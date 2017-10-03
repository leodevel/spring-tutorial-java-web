<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários</title>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"
                integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
              crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
                integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
        crossorigin="anonymous"></script>
    </head>
    <body>

        <div class="container-fluid" style="margin-top: 20px">

            <div class="panel panel-default">
                <div class="panel-heading" style="font-size: 20px;">
                    <center>
                        <b>Atualizar cadastro</b>
                    </center>
                </div>

                <div class="panel-body">

                    <form:form method="POST" action="update?id=${formUser.user.id}" commandName="formUser" cssClass="form-horizontal">

                        <div class="form-group">
                            <form:label path="user.name" cssClass="control-label col-sm-1" for="name">Nome: </form:label>
                                <div class="col-sm-11">
                                <form:input value="${user.name}" path="user.name" cssClass="form-control" placeholder="Informe o nome"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <form:label path="user.tel" cssClass="control-label col-sm-1" for="tel">Telefone: </form:label>
                                <div class="col-sm-11">
                                <form:input value="${user.tel}" path="user.tel" cssClass="form-control" placeholder="Informe o telefone"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <form:label path="user.address" cssClass="control-label col-sm-1" for="address">Endereço: </form:label>
                                <div class="col-sm-11">
                                <form:input value="${user.adrress}" path="user.address" cssClass="form-control" placeholder="Informe o endereço"/>
                            </div>
                        </div>

                        <div class="form-group"> 
                            <div class="col-sm-offset-1 col-sm-11">
                                <button type="submit" class="btn btn-default">Atualizar</button>
                            </div>
                        </div>

                        <c:set var="error">
                            <form:errors path="user"/>
                        </c:set>    

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger fade in col-sm-offset-1 col-sm-11">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                                <strong>Erro!</strong> <form:errors path="user"/>
                            </div> 
                        </c:if>  

                    </form:form>

                </div>

            </div>

        </div>

    </body>
</html>
