<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Alterar Disciplina</h1>
        <form method="post" action="../executar/executar_alterar_disciplina.jsp">
            <label for="id">ID</label><br>
            <input type="text" name="id" value="<%=request.getParameter("id")%>" readonly/><br>
            
            <label for="nome">NOME</label><br>
            <input type="text" name="nome" value="<%=request.getParameter("nome")%>"/><br>
            
            <label for="cargahoraria">CARGA HORARIA</label><br>
            <input type="text" name="cargahoraria" value="<%=request.getParameter("cargahoraria")%>"/><br>
            
            <input type="submit" value="ATUALIZAR"/>
        </form>
    </body>
</html>
