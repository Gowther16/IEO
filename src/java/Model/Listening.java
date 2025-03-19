/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class Listening {
    private int listen_id;
    private int topic_id;
    private int duration;
    private String Video_listen;

    public Listening() {
    }

    public Listening(int listen_id, int topic_id, int duration, String Video_listen) {
        this.listen_id = listen_id;
        this.topic_id = topic_id;
        this.duration = duration;
        this.Video_listen = Video_listen;
    }

    public int getListen_id() {
        return listen_id;
    }

    public void setListen_id(int listen_id) {
        this.listen_id = listen_id;
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

    public String getVideo_listen() {
        return Video_listen;
    }

    public void setVideo_listen(String Video_listen) {
        this.Video_listen = Video_listen;
    }
    
}
