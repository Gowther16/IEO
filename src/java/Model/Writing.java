/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class Writing {
    private int write_id;
    private int topic_id;
    private int duration;
    private String Title;
    private String Content;

    public Writing() {
    }

    public Writing(int write_id, int topic_id, int duration, String Title, String Content) {
        this.write_id = write_id;
        this.topic_id = topic_id;
        this.duration = duration;
        this.Title = Title;
        this.Content = Content;
    }

    public int getWrite_id() {
        return write_id;
    }

    public void setWrite_id(int write_id) {
        this.write_id = write_id;
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
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }
    
}
