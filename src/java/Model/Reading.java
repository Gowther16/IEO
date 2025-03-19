/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class Reading {
    private int read_id;
    private int topic_id;
    private int duration;
    private String title;
    private String content;

    public Reading() {
    }

    public Reading(int read_id, int topic_id, int duration, String title, String content) {
        this.read_id = read_id;
        this.topic_id = topic_id;
        this.duration = duration;
        this.title = title;
        this.content = content;
    }

    public int getRead_id() {
        return read_id;
    }

    public void setRead_id(int read_id) {
        this.read_id = read_id;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
}
