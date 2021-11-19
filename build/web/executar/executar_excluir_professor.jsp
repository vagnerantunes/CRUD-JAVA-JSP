<%@page import="DAO.DAOProfessor"%>
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
                  DAOProfessor dpro = new DAOProfessor();
                  dpro.excluirProfessor(Integer.parseInt(request.getParameter("id")));
                  out.print("Professor Excluido!");
                  out.print("<meta http-equiv='refresh' content='3, url=../consultar_professor.jsp'>");
              } catch (Exception erro) {
                  throw new RuntimeException("erro executar_excluir_professor.jsp: " + erro);
              }
  
        %>
    </body>
</html>
