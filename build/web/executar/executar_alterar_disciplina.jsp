<%@page import="DAO.DAODisciplina"%>
<%@page import="MODEL.Disciplina"%>
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
                    Disciplina dis = new Disciplina();
                    DAODisciplina ddis = new DAODisciplina();
                    dis.setNome(request.getParameter("nome"));
                    dis.setCargahoraria(Integer.parseInt(request.getParameter("cargahoraria")));
                    dis.setId(Integer.parseInt(request.getParameter("id")));
                    ddis.atualizarDisciplina(dis);
                    out.print("Alterado com sucesso!");
                    out.print("<meta http-equiv='refresh' content='3, url=../consultar_disciplina.jsp'>");
                } catch (Exception erro) {
                    throw new RuntimeException("Erro executar_alterar_disciplina" + erro);
                }
        %>
    </body>
</html>
