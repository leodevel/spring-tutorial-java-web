package br.com.leodevel.springtutorial.form;

import br.com.leodevel.springtutorial.model.User;

public class FormUser {
    
    private User user;

    public FormUser() {
    }

    public FormUser(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "FormUser{" + "user=" + user + '}';
    }
    
}