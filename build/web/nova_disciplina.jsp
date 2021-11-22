<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSERIR DISCIPLINA</title>
        <link href="css/novadisciplina.css" rel="stylesheet">
    </head>
    <body>
        <div>
            <h2>INSERIR DISCIPLINA</h2>

            <form method="post" action="crud/inserir_disciplina.jsp">

                <label for="nome">NOME</label>
                <input type="text" name="nome"/>

                <label for="cargahoraria">CARGA HORARIA</label>
                <input type="text" name="cargahoraria"/>

                <input id="botao" type="submit" value="ENVIAR"/>            
            </form>
            <a href="index.jsp"><input id="botaohome" type="submit" value="HOME"/></a>
        </div>
    </body>
</html>
