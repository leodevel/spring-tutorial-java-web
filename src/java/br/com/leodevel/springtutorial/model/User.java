package br.com.leodevel.springtutorial.model;

public class User {

    private int id;
    private String name;
    private String tel;
    private String address;

    public User() {
    }

    public User(int id, String name, String tel, String address) {
        this.id = id;
        this.name = name;
        this.tel = tel;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }    
    
}