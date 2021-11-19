<%@page import="DAO.DAODisciplina"%>
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
                  DAODisciplina ddis = new DAODisciplina();
                  ddis.excluirDisciplina(Integer.parseInt(request.getParameter("id")));
                  out.print("Disciplina Excluida!");
                  out.print("<meta http-equiv='refresh' content='3, url=../consultar_disciplina.jsp'>");
              } catch (Exception erro) {
                  throw new RuntimeException("erro executar_excluir_disciplina.jsp: " + erro);
              }
  
        %>
    </body>
</html>
