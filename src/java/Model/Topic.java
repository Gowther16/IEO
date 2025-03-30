/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class Topic {
    private int topic;
    private String creator;

    public Topic() {
    }

    public Topic(int topic, String creator) {
        this.topic = topic;
        this.creator = creator;
    }

    public int getTopic() {
        return topic;
    }

    public void setTopic(int topic) {
        this.topic = topic;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }
    
}
