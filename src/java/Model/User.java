/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.util.Date;

/**
 *
 * @author Nguyen Duc Tuan
 */
public class User {
    private int Id;
    private String name;
    private String email;
    private String password;
    private Date createdAt;
    private Date lastLogin;
    private String phone;
    private Date birthdate;

    public User(int Id, String name, String email, String password, Date createdAt, Date lastLogin, String phone, Date birthdate) {
        this.Id = Id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.createdAt = createdAt;
        this.lastLogin = lastLogin;
        this.phone = phone;
        this.birthdate = birthdate;
    }

    public User(String name, String email, String password, String phone, Date birthdate) {
        this.Id = Id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.birthdate = birthdate;
    }

 

    public User() {
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    @Override
    public String toString() {
        return "User{" + "Id=" + Id + ", name=" + name + ", email=" + email + ", password=" + password + ", createdAt=" + createdAt + ", lastLogin=" + lastLogin + ", phone=" + phone + ", birthdate=" + birthdate + '}';
    }

  

   
}
