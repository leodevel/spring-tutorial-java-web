package br.com.leodevel.springtutorial.controller;

import br.com.leodevel.springtutorial.dataset.Dataset;
import br.com.leodevel.springtutorial.form.FormUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String viewList(ModelMap model) {
        model.addAttribute("listUsers", Dataset.getListUsers());
        return "/user/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String viewAdd(ModelMap model) {
        model.addAttribute("formUser", new FormUser());
        return "/user/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(RedirectAttributes redir,
            @ModelAttribute("formUser") FormUser formUser,
            BindingResult result, ModelMap model) {

        // validação
        if (isEmpty(formUser.getUser().getName())
                || isEmpty(formUser.getUser().getTel())
                || isEmpty(formUser.getUser().getAddress())) {
            result.addError(new FieldError("", "user", "Todos os campos são obrigatórios!"));
            return "user/add";
        }

        Dataset.addUser(formUser.getUser());
        redir.addFlashAttribute("msg", new String[]{"success", "Usuario cadastrado com sucesso!"});
        return "redirect:/user/list";

    }

    @RequestMapping(value = "/update", method = RequestMethod.GET, params = {"id"})
    public String viewUpdate(ModelMap model,
            @RequestParam(required = true, value = "id") int id) {
        FormUser formUser = new FormUser(Dataset.getUserById(id));
        model.addAttribute("formUser", formUser);
        return "/user/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST, params = {"id"})
    public String update(RedirectAttributes redir,
            @ModelAttribute("formUser") FormUser formUser,
            BindingResult result, ModelMap model,
            @RequestParam(value = "id") int id) {

        formUser.getUser().setId(id);

        // validação
        if (isEmpty(formUser.getUser().getName())
                || isEmpty(formUser.getUser().getTel())
                || isEmpty(formUser.getUser().getAddress())) {
            result.addError(new FieldError("", "user", "Todos os campos são obrigatórios!"));
            return "user/update";
        }

        Dataset.updateUser(formUser.getUser());
        redir.addFlashAttribute("msg", new String[]{"success", "Cadastro atualizado com sucesso!"});       
        return "redirect:/user/list";

    }

    @RequestMapping(value = "/remove", method = RequestMethod.GET, params = {"id"})
    public String remove(RedirectAttributes redir, @RequestParam(value = "id") int id) {
        Dataset.deleleUser(id);
        redir.addFlashAttribute("msg", new String[]{"success", "Cadastro removido com sucesso!"});
        return "redirect:/user/list";
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

}
