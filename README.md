# Tutorial Spring Framework #

Este exemplo mostrar o código fonte utilizado para listar, cadastrar, atualizar e remover usuários de uma lista estática. 

## Bibliotecas ##

* Spring framework 4.0.1
* JSTL 1.2.1

## Arquivos de configuração ##

#### web.xml ####

```xml
    <?xml version="1.0" encoding="UTF-8"?>
<web-app version="3.0" xmlns="http://java.sun.com/xml/ns/javaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd">
    
    <servlet>
        <servlet-name>Spring MVC Dispatcher Servlet</servlet-name>
        <servlet-class>
            org.springframework.web.servlet.DispatcherServlet
        </servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>
                /WEB-INF/spring-context.xml
            </param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <servlet-mapping>
        <servlet-name>Spring MVC Dispatcher Servlet</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>
    
    <welcome-file-list>
        <welcome-file>/index</welcome-file>
    </welcome-file-list>
    
    <session-config>
        <session-timeout>
            30
        </session-timeout>
    </session-config>
    
    <filter>  
        <filter-name>encodingFilter</filter-name>  
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>  
        <init-param>  
            <param-name>encoding</param-name>  
            <param-value>UTF-8</param-value>  
        </init-param>  
        <init-param>  
            <param-name>forceEncoding</param-name>  
            <param-value>true</param-value>  
        </init-param>  
    </filter>  
    
    <filter-mapping>  
        <filter-name>encodingFilter</filter-name>  
        <url-pattern>/*</url-pattern>  
    </filter-mapping> 
    
</web-app>
````

#### spring-context.xml ####

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="http://www.springframework.org/schema/mvc 
    http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd
    http://www.springframework.org/schema/beans 
    http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
    http://www.springframework.org/schema/context 
    http://www.springframework.org/schema/context/spring-context-3.0.xsd">

    <context:component-scan base-package="br.com.leodevel.springtutorial" />
    <mvc:annotation-driven />

    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/views/"/>
        <property name="suffix" value=".jsp"/>
    </bean>   

</beans>
````

## Controladores ##

#### IndexController ####

```java
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
````

#### UserController ####
```java
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
````






