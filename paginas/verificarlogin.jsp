<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login errado</title>
    <style>
        p{
            font: bold normal 2em Arial;
            text-align: center;
            margin: 10px;
        }
        
        div{
            display: flex;
            align-items: center;
            justify-content: center;
        }

        div a{
            font: bold normal 1.5em Arial;
            text-decoration: none;
            color: black;
            margin: 10px;
            transition: 0.3s;
        }

        div a:hover{
            text-decoration: underline;
            color: blue;
            font-size: 1.7em;
            padding: 10px;
            transition: 0.3s;
        }
    </style>
</head>
<body>
    <%

    String vlogin = request.getParameter("txtEmail");
    String vsenha = request.getParameter("txtSenha");

    // Variaveis para o banco de dados
    String banco    = "avogbd" ;
    String endereco = "jdbc:mysql://localhost:3306/" + banco ;
    String usuario  = "root";
    String senha    = "" ;
  
    String driver   = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memória
    Class.forName( driver ) ;

    //Cria a variavel para conectar com banco
    Connection conexao ;

    // Abrir a conexao com o banco
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    String sql = "SELECT * FROM alunos WHERE email=? AND senha=? ";

    // Cria o statement para executar o camando no banco
    PreparedStatement stm = conexao.prepareStatement( sql );

    stm.setString(1, vlogin) ;
    stm.setString(2, vsenha) ;

    ResultSet dados =  stm.executeQuery() ;

    if(dados.next())
    {
       session.setAttribute( "usuario"  ,  dados.getString("nome")  ) ;
       response.sendRedirect("consulta2.jsp");
    }
    else
    {
        out.print("<p>Login incorreto</p>");
        out.print("<div><a href='login.html'>Voltar</a></div>") ;
    }

%>

</body>
</html>

