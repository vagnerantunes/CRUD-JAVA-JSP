<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MODEL.Professor"%>
<%@page import="DAO.DAOProfessor"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Professor pro = new Professor();
            DAOProfessor dpro = new DAOProfessor();
            
            try {
                    String nome = request.getParameter("nome");
                    String email = request.getParameter("email");
                    String senha = request.getParameter("senha");
                    
                    if(nome.equals(null) || email.equals(null) || senha.equals(null)){
                        
                    } else {
                        pro.setNome(nome);
                        pro.setEmail(email);
                        pro.setSenha(senha);
                        dpro.inserirProfessor(pro);
                        
                        out.print("Professor inserido com sucesso!");
                        out.print("<meta http-equiv='refresh' content='3, url=../novo_professor.jsp'>");
                    }                        
                } catch (Exception erro) {
                    throw new RuntimeException("Erro inserir_professor: " + erro);                   
                }
        %>    
    </body>
</html>
