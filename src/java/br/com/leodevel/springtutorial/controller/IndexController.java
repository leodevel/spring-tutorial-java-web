package br.com.leodevel.springtutorial.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String viewIndex() {
        return "index";
    }

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "redirect:index";
    }

}
