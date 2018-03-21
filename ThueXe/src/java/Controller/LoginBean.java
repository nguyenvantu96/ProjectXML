/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entites.User;
import Model.LoginDao;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Admin
 */
@ManagedBean
@ViewScoped
public class LoginBean implements Serializable {

    private String username;
    private String password;
    private User user;
    private LoginDao loginDao;
    private boolean checkLogin = false;

    /**
     * Creates a new instance of LoginBean
     */
    @PostConstruct
    public void init() {
        loginDao = new LoginDao();
        user = new User();
    }

    public String login() {
        try {
            user = loginDao.loginAction(username, password);
            if (user != null) {
                checkLogin = true;
            } else {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Failed", "Login Failed"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (checkLogin) {
            return "AdminPage.xhtml";
        } else {
            return "Admin.xhtml";
        }
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}
