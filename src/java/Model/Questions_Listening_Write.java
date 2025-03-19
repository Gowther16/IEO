package Model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author bangc
 */
public class Questions_Listening_Write {
    private int quest_Listen;
    private int listen_id;
    private String question_test;

    public Questions_Listening_Write() {
    }

    public Questions_Listening_Write(int quest_Listen, int listen_id, String question_test) {
        this.quest_Listen = quest_Listen;
        this.listen_id = listen_id;
        this.question_test = question_test;
    }

    public int getQuest_Listen() {
        return quest_Listen;
    }

    public void setQuest_Listen(int quest_Listen) {
        this.quest_Listen = quest_Listen;
    }

    public int getListen_id() {
        return listen_id;
    }

    public void setListen_id(int listen_id) {
        this.listen_id = listen_id;
    }

    public String getQuestion_test() {
        return question_test;
    }

    public void setQuestion_test(String question_test) {
        this.question_test = question_test;
    }
    
}
