/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class Speaking {
    private int speak_id;
    private int topic_id;
    private int duration;

    public Speaking() {
    }

    public Speaking(int speak_id, int topic_id, int duration) {
        this.speak_id = speak_id;
        this.topic_id = topic_id;
        this.duration = duration;
    }

    public int getSpeak_id() {
        return speak_id;
    }

    public void setSpeak_id(int speak_id) {
        this.speak_id = speak_id;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }
    
}
