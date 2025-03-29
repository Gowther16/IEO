/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class BrandPoint_Speaking {
    private int brand_id;
    private int quest_id;
    private String BrandPoint;

    public BrandPoint_Speaking(int brand_id, int quest_id, String BrandPoint) {
        this.brand_id = brand_id;
        this.quest_id = quest_id;
        this.BrandPoint = BrandPoint;
    }

    public BrandPoint_Speaking() {
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public int getQuest_id() {
        return quest_id;
    }

    public void setQuest_id(int quest_id) {
        this.quest_id = quest_id;
    }

    public String getBrandPoint() {
        return BrandPoint;
    }

    public void setBrandPoint(String BrandPoint) {
        this.BrandPoint = BrandPoint;
    }
    
}
