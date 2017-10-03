<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                        <b>Lista de usuários</b>
                    </center>
                </div>
                
                <div class="panel-body">

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
                                        <a href="#" class="btn btn-primary ">
                                            <span class="glyphicon glyphicon-edit"></span> Editar 
                                        </a>
                                        <a href="#" class="btn btn-danger ">
                                            <span class="glyphicon glyphicon-trash"></span> Excluir 
                                        </a>
                                    </td>
                                </tr>                    
                            </c:forEach>                
                        </tbody>
                        
                    </table>
                    
                    <center>
                        <a href="#" class="btn btn-default ">
                            <span class="glyphicon glyphicon-plus"></span> Adicionar
                        </a>
                    </center>

                </div>
            </div>

        </div>
    </body>
</html>