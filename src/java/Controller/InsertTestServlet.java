/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import dal.ListeningDAO;
import dal.Questions_Listening_ChooseAnswerDAO;
import dal.Questions_Listening_WriteDAO;
import dal.Questions_ReadingDAO;
import dal.Questions_SpeakingDAO;
import dal.ReadingDAO;
import dal.SpeakingDAO;
import dal.TopicExamDAO;
import dal.WritingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bangc
 */
public class InsertTestServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsertTestServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertTestServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        User create = (User) request.getSession().getAttribute("user");

        TopicExamDAO topicDAO = new TopicExamDAO();
        int topicId = topicDAO.InsertTopicExam(create.getId());
        if (topicId == 0) {
            response.getWriter().println("Error inserting TopicExam!");
            return;
        }

        ReadingDAO readingDAO = new ReadingDAO();
        String readingTitle = request.getParameter("readingTitle");
        String readingContent = request.getParameter("readingContent");
        String readingDurationStr = request.getParameter("readingDuration");
        int readingDuration = Integer.parseInt(readingDurationStr);

        if (readingTitle != null && !readingTitle.isEmpty()) {
            int readingId = readingDAO.InsertReading(topicId, readingDuration, readingTitle, readingContent);

            Questions_ReadingDAO qrDAO = new Questions_ReadingDAO();
            int questionCountR = countQuestions(request, "questionTextR_");
            for (int i = 1; i <= questionCountR; i++) {
                String questionText = request.getParameter("questionTextR_" + i);
                if (questionText != null && !questionText.isEmpty()) {
                    String optionCountStr = request.getParameter("questionTextR_" + i);
                    int optionCount = Integer.parseInt(optionCountStr);
                    String explanation ="";
                    String options = null;
                    for (int j = 0; j < optionCount; j++) {
                        String option = request.getParameter("answerOptionR_" + i + "_" + j);
                        if (j == 0) {
                            options.concat(option);
                        } else {
                            options.concat("|" + option);
                        }
                    }
                    String correctAnswerStr = request.getParameter("correctAnswerR_" + i);
                    qrDAO.InsertQuestions_Reading(questionText, options, correctAnswerStr, explanation, readingId);
                }
            }

        }

        ListeningDAO listeningDAO = new ListeningDAO();
        String listeningFile = request.getParameter("listeningFile");
        String listeningDurationStr = request.getParameter("listeningDuration");
        int listeningDuration = Integer.parseInt(listeningDurationStr);
        int listeningId = listeningDAO.InsertListening(topicId, 30, listeningFile);

        Questions_Listening_ChooseAnswerDAO qlcDAO = new Questions_Listening_ChooseAnswerDAO();
        int questionCountL = countQuestions(request, "questionTextL_");
        for (int i = 1; i <= questionCountL; i++) {
            String questionText = request.getParameter("questionTextL_" + i);
            if (questionText != null && !questionText.isEmpty()) {
                String optionCountStr = request.getParameter("questionTextL_" + i);
                int optionCount = Integer.parseInt(optionCountStr);
                String explanation ="";
                String options = null;
                for (int j = 0; j < optionCount; j++) {
                    String option = request.getParameter("answerOptionL_" + i + "_" + j);
                    if (j == 0) {
                        options.concat(option);
                    } else {
                        options.concat("|" + option);
                    }
                }
                String correctAnswerStr = request.getParameter("correctAnswerL_" + i);
                qlcDAO.InsertQuestions_Listening_ChooseAnswer(questionText, options, correctAnswerStr, explanation, listeningId);
            }
        }

        Questions_Listening_WriteDAO qlwDAO = new Questions_Listening_WriteDAO();
        int questionCountLW = countQuestions(request, "questionTextLW_");
        for (int i = 1; i <= questionCountLW; i++) {
            String questionText = request.getParameter("questionTextLW_" + i);
            if (questionText != null && !questionText.isEmpty()) {
                qlwDAO.InsertQuestions_Listening_Write(listeningId, questionText);
            }
        }

        SpeakingDAO speakingDAO = new SpeakingDAO();
        String speakingDurationStr = request.getParameter("speakingDuration");
        int speakingDuration = Integer.parseInt(speakingDurationStr);
        int speakingId = speakingDAO.InsertSpeaking(topicId, speakingDuration);

        Questions_SpeakingDAO qsDAO = new Questions_SpeakingDAO();
        int questionCountS = countQuestions(request, "questionTextS_");
        for (int i = 1; i <= questionCountS; i++) {
            String questionText = request.getParameter("questionTextS_" + i);
            if (questionText != null && !questionText.isEmpty()) {
                qsDAO.InsertQuestions_Speaking(speakingId, questionText);
            }
        }

        WritingDAO writingDAO = new WritingDAO();
        String writingTitle = request.getParameter("writingTitle");
        String writingContent = request.getParameter("writingContent");
        String writingDurationStr = request.getParameter("writingDuration");
        int writingDuration = Integer.parseInt(writingDurationStr);

        if (writingTitle != null && !writingTitle.isEmpty()) {
            writingDAO.InsertWriting(topicId, writingDuration, writingTitle, writingContent);
        }

        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    private int countQuestions(HttpServletRequest request, String prefix) {
        int count = 0;
        while (request.getParameter(prefix + (count + 1)) != null) {
            count++;
        }
        return count;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
