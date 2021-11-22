<%@page import="java.util.ArrayList"%>
<%@page import="MODEL.Disciplina"%>
<%@page import="DAO.DAODisciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONSULTAR DISCIPLINA</title>
        <link href="css/consultardisciplina.css" rel="stylesheet">
    </head>
    
    <body>
        <div>
            <h1>Consultar Disciplina</h1>
            <form action="consultar_disciplina.jsp" method="post">
                <label>Pesquisar por nome</label><br>
                <input type="text" name="nome"/><br>
                <input id="botaopesquisar" type="submit" value="Pesquisar"/><br>
            </form>
            <a href="index.jsp"><input id="botaohome" type="submit" value="HOME"/></a>
                <%
                    out.print("<table border='1'>");
                    out.print("<tr>");
                    out.print("<th>ID</th>");
                    out.print("<th>NOME</th>");
                    out.print("<th>CARGA HORARIA</th>");                   
                    out.print("<th>EDITAR</th>");
                    out.print("<th>EXCLUIR</th>");
                    out.print("</tr>");

                    DAODisciplina ddis = new DAODisciplina();

                    if (request.getParameter("nome") == "" || request.getParameter("nome") == null) {
                        ArrayList<Disciplina> lista = ddis.listarDisciplinas();
                        for (int i = 0; i < lista.size(); i++) {
                            out.print("<tr>");
                            out.print("<td>" + lista.get(i).getId() + "</td>");
                            out.print("<td>" + lista.get(i).getNome() + "</td>");
                            out.print("<td>" + lista.get(i).getCargahoraria() + "</td>");                            

                            out.print("<td><a href='crud/alterar_disciplina.jsp?id="
                                    + lista.get(i).getId()
                                    + "&nome=" + lista.get(i).getNome()
                                    + "&cargahoraria=" + lista.get(i).getCargahoraria()                                    
                                    + "'>CLIQUE</a></td>");
                            out.print("<td><a href='crud/excluir_disciplina.jsp?id="
                                    + lista.get(i).getId()
                                    + "&nome=" + lista.get(i).getNome()
                                    + "'>CLIQUE</a></td>");
                            out.print("</tr>");
                        }
                    } else {
                        ArrayList<Disciplina> lista = ddis.listarDisciplinaNome(request.getParameter("nome"));
                        for (int i = 0; i < lista.size(); i++) {
                            out.print("<tr>");
                            out.print("<td>" + lista.get(i).getId() + "</td>");
                            out.print("<td>" + lista.get(i).getNome() + "</td>");
                            out.print("<td>" + lista.get(i).getCargahoraria() + "</td>");
                            
                            out.print("<td><a href='crud/alterar_professor.jsp?id="
                                    + lista.get(i).getId()
                                    + "&nome=" + lista.get(i).getNome()
                                    + "&cargahoraria=" + lista.get(i).getCargahoraria()                                    
                                    + "'>CLIQUE</a></td>");
                            out.print("<td><a href='crud/exluir_disciplina.jsp?id="
                                    + lista.get(i).getId()
                                    + "&nome=" + lista.get(i).getNome()
                                    + "'>CLIQUE</a></td>");
                            out.print("<tr>");
                        }
                    }
                %>  
        </div>
    </body>
</html>
