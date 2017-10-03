package br.com.leodevel.springtutorial.dataset;

import br.com.leodevel.springtutorial.model.User;
import java.util.ArrayList;
import java.util.List;

public class Dataset {

    private static List<User> LIST;
    private static int ID = 1;

    static {
        LIST = new ArrayList<>();
        LIST.add(new User(ID++, "Leonardo Barbosa", "(12) 9 8300-0891", 
                "Av. Marechal Deodoro, 1205, Caraguatatuba - SP, Brasil."));
        LIST.add(new User(ID++, "Rafael Santana","(12) 9 7320-1091", 
                "Av. Santana, 25, São Sebastião - SP, Brasil."));
        LIST.add(new User(ID++, "José Carlos","(12) 9 3302-0811", 
                "Av. Cardozo, 5, Ilha Bela - SP, Brasil."));
    }

    public static List<User> getListUsers() {
        return LIST;
    }

    public static void addUser(User user) {
        user.setId(ID++);
        LIST.add(user);
    }

    public static void updateUser(User user) {
        for (int i = 0; i < LIST.size(); i++) {
            if (LIST.get(i).getId() == user.getId()) {
                LIST.set(i, user);
                break;
            }
        }
    }

    public static User getUserById(int id) {
        for (User user : LIST) {
            if (user.getId() == id) {
                return user;
            }
        }
        return null;
    }

    public static void deleleUser(int id) {
        LIST.removeIf(e -> e.getId() == id);
    }

}
