<%@page import="MODEL.Professor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOProfessor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONSULTAR PROFESSOR</title>
    </head>
    <body>
        <div>
            <h2>Consultar Professor</h2>
            <form action="consultar_professor.jsp" method="post">
                <label>Pesquisar por nome</label><br>
                <input type="text" name="nome"/><br>
                <input type="submit" value="Pesquisar"/>                
            </form>
            <a href="index.jsp"><input type="submit" value="HOME"</a>
            <%
                out.print("<table border='1'>");
                out.print("<tr>");
                out.print("<th>ID</th>");
                out.print("<th>NOME</th>");
                out.print("<th>EMAIL</th>");
                out.print("<th>SENHA</th>");
                out.print("<th>EDITAR</th>");
                out.print("<th>EXCLUIR</th>");
                out.print("</tr>");
                
                DAOProfessor pro = new DAOProfessor();
                
                if(request.getParameter("nome") == "" || request.getParameter("nome") == null){
                    ArrayList<Professor> lista = pro.listarProfessores();
                    for(int i = 0; i < lista.size();i++){
                        out.print("<tr>");
                        out.print("<td>" + lista.get(i).getId() + "</td>");
                        out.print("<td>" + lista.get(i).getNome() + "</td>");
                        out.print("<td>" + lista.get(i).getSenha() + "</td>");
                        
                        out.print("<td><a href='crud/alterar_professor.jsp?id="
                            + lista.get(i).getId()
                            + "&nome" + lista.get(i).getNome()
                            + "&email=" + lista.get(i).getEmail()
                            + "&senha=" + lista.get(i).getSenha()
                            + "'>CLIQUE</a></td>");
                        out.print("<td><a href='crud/excluir_professor.jsp?id="
                            + lista.get(i).getId()
                            + "&nome" + lista.get(i).getNome()
                            + "'>CLIQUE</a></td>");                        
                        out.print("</tr>");
                    }
                } else {
                    ArrayList<Professor> lista = pro.listarProfessorNome(request.getParameter("nome"));
                    for(int i = 0;i < lista.size();i++){
                        out.print("<tr>");
                        out.print("<td>" + lista.get(i).getId() + "</td>");
                        out.print("<td>" + lista.get(i).getNome() + "</td>");
                        out.print("<td>" + lista.get(i).getEmail() + "</td>");
                        out.print("<td>" + lista.get(i).getSenha() + "</td>");
                        out.print("<td><a href='crud/alterar_professor.jsp?id="
                                + lista.get(i).getId()
                                + "&nome=" + lista.get(i).getNome()
                                + "&email=" + lista.get(i).getEmail()
                                + "&senha" + lista.get(i).getSenha()
                                + "'>CLIQUE</a></td>");                        
                        out.print("<td><a href='crud/exluir_professor.jsp?id="
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
