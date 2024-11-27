<%@page language="java" import="java.sql.*" %>
<%
    //cria as variaveis para armazenar as informações 
    //digitadas pelo usuário

    String vnome = request.getParameter("txtNome");
    int    vidade= Integer.parseInt( request.getParameter("txtIdade"));
    String vtel = request.getParameter("txtTel");
    String vemail= request.getParameter("txtEmail");
    String vsenha = request.getParameter("txtSenha");
    Double vcpf = Double.parseDouble(request.getParameter("txtCpf"));

    //variaveis para o banco de dados
    String banco    = "avogbd" ;
    String endereco = "jdbc:mysql://localhost:3306/"+banco;
    String usuario  = "root";
    String senha    = "" ;

    //Variavel para o Driver
    String driver = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memória
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco de dados
    Connection conexao ;

    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql como o comando INSERT
    String sql = "INSERT INTO alunos (nome, cpf, idade, telefone, email, senha) values (?,?,?,?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql) ;
    stm.setString( 1 , vnome) ;
    stm.setDouble( 2 , vcpf) ;
    stm.setInt( 3 , vidade ) ;
    stm.setString( 4 , vtel) ;
    stm.setString( 5 , vemail ) ;
    stm.setString( 6 , vsenha) ;

    stm.execute() ;
    stm.close() ;

    out.print("Dados gravados com sucesso!!!");
    out.print("<br><br>") ;
    out.print("<a href='consulta.jsp'>Tabela</a>") ;
    out.print("<a href='../index.html'>Pagina Inicial</a>") ;
%>
