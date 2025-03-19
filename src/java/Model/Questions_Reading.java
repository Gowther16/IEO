/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class Questions_Reading {
    private int questRead_id;
    private String question_text;
    private String answer_options;
    private String correct_answer;
    private String explanation;
    private int read_id;

    public Questions_Reading() {
    }

    public Questions_Reading(int questRead_id, String question_text, String answer_options, String correct_answer, String explanation, int read_id) {
        this.questRead_id = questRead_id;
        this.question_text = question_text;
        this.answer_options = answer_options;
        this.correct_answer = correct_answer;
        this.explanation = explanation;
        this.read_id = read_id;
    }

    public int getQuestRead_id() {
        return questRead_id;
    }

    public void setQuestRead_id(int questRead_id) {
        this.questRead_id = questRead_id;
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

    public int getRead_id() {
        return read_id;
    }

    public void setRead_id(int read_id) {
        this.read_id = read_id;
    }
    
}
