/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDateTime;

/**
 *
 * @author Nguyen Duc Tuan
 */
public class TokenForgetPassword {

    private int id, userId;
    private String token;
    private Boolean isUsed;
    private LocalDateTime expiryTime;

    public TokenForgetPassword() {
    }

    public TokenForgetPassword(int id, int userId, String token, Boolean isUsed, LocalDateTime expiryTime) {
        this.id = id;
        this.userId = userId;
        this.token = token;
        this.isUsed = isUsed;
        this.expiryTime = expiryTime;
    }

    public TokenForgetPassword(int userId, String token, Boolean isUsed, LocalDateTime expiryTime) {
        this.userId = userId;
        this.token = token;
        this.isUsed = isUsed;
        this.expiryTime = expiryTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public boolean isIsUsed() {
        return isUsed;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Boolean getIsUsed() {
        return isUsed;
    }

    public void setIsUsed(Boolean isUsed) {
        this.isUsed = isUsed;
    }

    public LocalDateTime getExpiryTime() {
        return expiryTime;
    }

    public void setExpiryTime(LocalDateTime expiryTime) {
        this.expiryTime = expiryTime;
    }

    @Override
    public String toString() {
        return "forgetPassword{" + "id=" + id + ", userId=" + userId + ", token=" + token + ", isUsed=" + isUsed + ", expiryTime=" + expiryTime + '}';
    }

}
