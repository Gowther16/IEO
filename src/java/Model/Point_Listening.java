/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author bangc
 */
public class Point_Listening {
    private int point_id;
    private int Coord_id;
    private int mark;
    private int result_id;

    public Point_Listening() {
    }

    public Point_Listening(int point_id, int Coord_id, int mark, int result_id) {
        this.point_id = point_id;
        this.Coord_id = Coord_id;
        this.mark = mark;
        this.result_id = result_id;
    }

    public int getPoint_id() {
        return point_id;
    }

    public void setPoint_id(int point_id) {
        this.point_id = point_id;
    }

    public int getCoord_id() {
        return Coord_id;
    }

    public void setCoord_id(int Coord_id) {
        this.Coord_id = Coord_id;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    public int getResult_id() {
        return result_id;
    }

    public void setResult_id(int result_id) {
        this.result_id = result_id;
    }
    
}
