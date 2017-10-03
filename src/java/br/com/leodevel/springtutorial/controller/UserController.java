package br.com.leodevel.springtutorial.controller;

import br.com.leodevel.springtutorial.dataset.Dataset;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String viewList(ModelMap model) {
        model.addAttribute("listUsers", Dataset.getListUsers());
        return "/user/list";
    }

}