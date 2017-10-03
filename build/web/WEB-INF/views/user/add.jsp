<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
              crossorigin="anonymous">
    </head>
    <body>

        <div class="container-fluid" style="margin-top: 20px">

            <div class="panel panel-default">
                <div class="panel-heading" style="font-size: 20px;">
                    <center>
                        <b>Cadastrar usuário</b>
                    </center>
                </div>
            </div>

            <div class="panel-body">

                <form:form method="POST" action="user/add" commandName="formUser">
                    <table>
                        <tr>
                            <td><form:label path="user.name">Nome</form:label></td>
                            <td><form:input path="user.name"/></td>
                        </tr>                
                        <tr>                    
                            <td colspan="2">
                                <input type="submit" value="Cadastrar"/>
                            </td>
                        </tr>
                    </table>                
                    <form:errors path="messageError" cssStyle="color:red"/>
                </form:form>

            </div>

        </div>

    </body>
</html>
