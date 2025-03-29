/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.security.Timestamp;

/**
 *
 * @author bangc
 */
public class Student_Results {
    private int result_id;
    private int user_id;
    private int test_id;
    private int score;
    private Timestamp completed_at;

    // Constructor mặc định
    public Student_Results() {
    }

    // Constructor đầy đủ tham số
    public Student_Results(int result_id, int user_id, int test_id, int score, Timestamp completed_at) {
        this.result_id = result_id;
        this.user_id = user_id;
        this.test_id = test_id;
        this.score = score;
    }

    // Constructor không có result_id (dùng khi thêm mới vì result_id là IDENTITY)
    public Student_Results(int user_id, int test_id, int score) {
        this.user_id = user_id;
        this.test_id = test_id;
        this.score = score;
    }

    // Getter và Setter
    public int getResult_id() {
        return result_id;
    }

    public void setResult_id(int result_id) {
        this.result_id = result_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getTest_id() {
        return test_id;
    }

    public void setTest_id(int test_id) {
        this.test_id = test_id;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
