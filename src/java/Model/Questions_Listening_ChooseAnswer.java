package Model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author bangc
 */
public class Questions_Listening_ChooseAnswer {
    private int questListen_id;
    private String question_text;
    private String answer_options;
    private String correct_answer;
    private String explanation;
    private int listen_id;

    public Questions_Listening_ChooseAnswer() {
    }

    public Questions_Listening_ChooseAnswer(int questListen_id, String question_text, String answer_options, String correct_answer, String explanation, int listen_id) {
        this.questListen_id = questListen_id;
        this.question_text = question_text;
        this.answer_options = answer_options;
        this.correct_answer = correct_answer;
        this.explanation = explanation;
        this.listen_id = listen_id;
    }

    public int getQuestListen_id() {
        return questListen_id;
    }

    public void setQuestListen_id(int questListen_id) {
        this.questListen_id = questListen_id;
    }

    public String getQuestion_text() {
        return question_text;
    }

    public void setQuestion_text(String question_text) {
        this.question_text = question_text;
    }

    public String getAnswer_options() {
        return answer_options;
    }

    public void setAnswer_options(String answer_options) {
        this.answer_options = answer_options;
    }

    public String getCorrect_answer() {
        return correct_answer;
    }

    public void setCorrect_answer(String correct_answer) {
        this.correct_answer = correct_answer;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public int getListen_id() {
        return listen_id;
    }

    public void setListen_id(int listen_id) {
        this.listen_id = listen_id;
    }
    
    
    
}
