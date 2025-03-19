/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class Questions_Speaking {
    private int quest_Speak;
    private int speak_id;
    private String question_text;

    public Questions_Speaking() {
    }

    public Questions_Speaking(int quest_Speak, int speak_id, String question_text) {
        this.quest_Speak = quest_Speak;
        this.speak_id = speak_id;
        this.question_text = question_text;
    }

    public int getQuest_Speak() {
        return quest_Speak;
    }

    public void setQuest_Speak(int quest_Speak) {
        this.quest_Speak = quest_Speak;
    }

    public int getSpeak_id() {
        return speak_id;
    }

    public void setSpeak_id(int speak_id) {
        this.speak_id = speak_id;
    }

    public String getQuestion_text() {
        return question_text;
    }

    public void setQuestion_text(String question_text) {
        this.question_text = question_text;
    }
    
}
