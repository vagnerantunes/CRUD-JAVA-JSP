<%@page import="DAO.DAOProfessor"%>
<%@page import="MODEL.Professor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                    Professor pro = new Professor();
                    DAOProfessor dpro = new DAOProfessor();
                    pro.setNome(request.getParameter("nome"));
                    pro.setEmail(request.getParameter("email"));
                    pro.setSenha(request.getParameter("senha"));
                    pro.setId(Integer.parseInt(request.getParameter("id")));
                    dpro.atualizarProfessor(pro);
                    out.print("Alterado com sucesso!");
                    out.print("<meta http-equiv='refresh' content='3, url=../consultar_professor.jsp'>");
                } catch (Exception erro) {
                    throw new RuntimeException("Erro executar_alterar_professor" + erro);
                }
        %>
    </body>
</html>
