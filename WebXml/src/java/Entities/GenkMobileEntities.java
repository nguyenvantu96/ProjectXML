/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

/**
 *
 * @author TUYEN
 */
public class GenkMobileEntities {
    private String img;
    private String title;
    private String tileSub;
    private String aherf;
    private String time;
    public GenkMobileEntities(String img, String title, String tileSub, String aherf) {
        this.img = img;
        this.title = title;
        this.tileSub = tileSub;
        this.aherf = aherf;
    }

    public GenkMobileEntities() {
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTileSub() {
        return tileSub;
    }

    public void setTileSub(String tileSub) {
        this.tileSub = tileSub;
    }

    public String getAherf() {
        return aherf;
    }

    public void setAherf(String aherf) {
        this.aherf = aherf;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    
    
}
