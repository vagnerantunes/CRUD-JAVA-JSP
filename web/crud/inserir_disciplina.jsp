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
            Disciplina dis = new Disciplina();
            DAODisciplina ddis = new DAODisciplina();

            try {
                    String nome = request.getParameter("nome");
                    String cargahoraria = request.getParameter("cargahoraria");
                    
                    if(nome.equals(null) || cargahoraria.equals(null)){
                        
                    } else {
                        dis.setNome(nome);
                        dis.setCargahoraria(Integer.parseInt(cargahoraria));
                        ddis.inserirDisciplina(dis);
                        out.print("Disciplina inserida com sucesso!");
                        out.print("<meta http-equiv='refresh' content='3, url=../nova_disciplina.jsp'>");
                    }
                } catch (Exception erro) {
                    throw new RuntimeException("Erro inserir_disciplina: " + erro);                    
                }
        %>
    </body>
</html>
