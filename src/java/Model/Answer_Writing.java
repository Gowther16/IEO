/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class Answer_Writing {
    private int answer_id;
    private int write_id;
    private int test_id;
    private String Content_Answer;

    public Answer_Writing() {
    }

    public Answer_Writing(int answer_id, int write_id, int test_id, String Content_Answer) {
        this.answer_id = answer_id;
        this.write_id = write_id;
        this.test_id = test_id;
        this.Content_Answer = Content_Answer;
    }

    public int getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(int answer_id) {
        this.answer_id = answer_id;
    }

    public int getWrite_id() {
        return write_id;
    }

    public void setWrite_id(int write_id) {
        this.write_id = write_id;
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
