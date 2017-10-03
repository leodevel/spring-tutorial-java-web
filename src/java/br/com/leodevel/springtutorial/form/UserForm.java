package br.com.leodevel.springtutorial.form;

import br.com.leodevel.springtutorial.model.User;

public class UserForm {
    
    private User user;

    public UserForm() {
    }

    public UserForm(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
}