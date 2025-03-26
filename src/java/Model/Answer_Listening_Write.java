/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class Answer_Listening_Write {
    private int answer_id;
    private int quest_Listen;
    private int test_id;
    private String content_Answer;

    public Answer_Listening_Write() {
    }

    public Answer_Listening_Write(int answer_id, int quest_Listen, int test_id, String content_Answer) {
        this.answer_id = answer_id;
        this.quest_Listen = quest_Listen;
        this.test_id = test_id;
        this.content_Answer = content_Answer;
    }

    public int getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(int answer_id) {
        this.answer_id = answer_id;
    }

    public int getQuest_Listen() {
        return quest_Listen;
    }

    public void setQuest_Listen(int quest_Listen) {
        this.quest_Listen = quest_Listen;
    }

    public int getTest_id() {
        return test_id;
    }

    public void setTest_id(int test_id) {
        this.test_id = test_id;
    }

    public String getContent_Answer() {
        return content_Answer;
    }

    public void setContent_Answer(String content_Answer) {
        this.content_Answer = content_Answer;
    }
    
}
