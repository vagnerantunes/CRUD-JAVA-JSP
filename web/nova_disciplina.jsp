<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSERIR DISCIPLINA</title>
    </head>
    <body>
        <div>
            <h2>INSERIR DISCIPLINA</h2>
        </div>
        <form method="post" action="crud/inserir_disciplina.jsp">
            
            <label for="nome">NOME</label>
            <input typte="text" name="nome">
            
            <label for="cargahoraria">CARGA HORARIA</label>
            <input typte="text" name="cargahoraria">
            
            <input type="submit" value="ENVIAR">            
        </form>
        
    </body>
</html>
