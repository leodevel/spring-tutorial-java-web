<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                        <b>Lista de usuários</b>
                    </center>
                </div>

                <div class="panel-body">                    
                                        
                    <c:if test="${msg != null}">
                        <c:if test="${msg[0] == 'success'}">
                            <div class="alert alert-success">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                                <strong>Sucesso!</strong> ${msg[1]}
                            </div>
                        </c:if>
                    </c:if>

                    <table class="table table-striped">

                        <thead>
                            <tr>
                                <th>#ID</th>
                                <th>Nome</th>
                                <th>Telefone</th>
                                <th>Endereço</th>
                                <th>Ações</th>
                            </tr>
                        </thead>

                        <tbody>                
                            <c:forEach var="user" items="${listUsers}">                    
                                <tr>
                                    <td>${user.getId()}</td>
                                    <td>${user.getName()}</td>
                                    <td>${user.getTel()}</td>
                                    <td>${user.getAddress()}</td>
                                    <td>
                                        <a href="update?id=${user.getId()}" class="btn btn-primary ">
                                            <span class="glyphicon glyphicon-edit"></span> Editar 
                                        </a>
                                        <a href="remove?id=${user.getId()}" class="btn btn-danger ">
                                            <span class="glyphicon glyphicon-trash"></span> Excluir 
                                        </a>
                                    </td>
                                </tr>                    
                            </c:forEach>                
                        </tbody>

                    </table>

                    <center>
                        <a href="add" class="btn btn-default ">
                            <span class="glyphicon glyphicon-plus"></span> Adicionar
                        </a>
                    </center>

                </div>
            </div>

        </div>

        <script>
            $(document).ready(function () {
                $(".alert").fadeOut(5000);
            });            
        </script>        

    </body>
</html>