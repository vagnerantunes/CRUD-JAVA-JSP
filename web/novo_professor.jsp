<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSERIR PROFESSOR</title>
        <link href="css/novoprofessor.css" rel="stylesheet">
    </head>
    <body>
        <div>
            <h2>INSERIR PROFESSOR</h2>
            <form method="post" action="crud/inserir_professor.jsp">
                <label for="nome">NOME</label>
                <input type="text" name="nome"/>
                
                <label for="email">EMAIL</label>
                <input type="text" name="email"/>
                
                <label for="senha">SENHA</label>
                <input type="text" name="senha"/>
                
                <input id="botao" type="submit" value="ENVIAR">
            </form>
            <a href="index.jsp"><input id="botaohome" type="submit" value="HOME"></a>
        </div>
        
        
    </body>
</html>
