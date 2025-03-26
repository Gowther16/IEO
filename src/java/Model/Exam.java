/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class Exam {
    private int exam_id;
    private String test_name;
    private String description;
    private int time_exam;
    private int create_id;
    private int topic_id;

    public Exam() {
    }

    public Exam(int exam_id, String test_name, String description, int time_exam, int create_id, int topic_id) {
        this.exam_id = exam_id;
        this.test_name = test_name;
        this.description = description;
        this.time_exam = time_exam;
        this.create_id = create_id;
        this.topic_id = topic_id;
    }

    public int getExam_id() {
        return exam_id;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public String getTest_name() {
        return test_name;
    }

    public void setTest_name(String test_name) {
        this.test_name = test_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTime_exam() {
        return time_exam;
    }

    public void setTime_exam(int time_exam) {
        this.time_exam = time_exam;
    }

    public int getCreate_id() {
        return create_id;
    }

    public void setCreate_id(int create_id) {
        this.create_id = create_id;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }
    
}
