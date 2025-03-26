/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class Answer_Speaking {
    private int answer_id;
    private int quest_Speak;
    private int test_id;
    private String Content_Answer;

    public Answer_Speaking() {
    }

    public Answer_Speaking(int answer_id, int quest_Speak, int test_id, String Content_Answer) {
        this.answer_id = answer_id;
        this.quest_Speak = quest_Speak;
        this.test_id = test_id;
        this.Content_Answer = Content_Answer;
    }

    public int getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(int answer_id) {
        this.answer_id = answer_id;
    }

    public int getQuest_Speak() {
        return quest_Speak;
    }

    public void setQuest_Speak(int quest_Speak) {
        this.quest_Speak = quest_Speak;
    }

    public int getTest_id() {
        return test_id;
    }

    public void setTest_id(int test_id) {
        this.test_id = test_id;
    }

    public String getContent_Answer() {
        return Content_Answer;
    }

    public void setContent_Answer(String Content_Answer) {
        this.Content_Answer = Content_Answer;
    }
    
}
