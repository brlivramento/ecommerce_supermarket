<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.util.List,br.ecom.projeto.models.*"
%>

<%
@SuppressWarnings("unchecked")
List<Endereco> lis = (List<Endereco>)session.getAttribute("lis");
@SuppressWarnings("unchecked")
List<Email> lis2 = (List<Email>)session.getAttribute("lis2");
@SuppressWarnings("unchecked")
List<Telefone> lis3 = (List<Telefone>)session.getAttribute("lis3");
Login l = (Login)session.getAttribute("usuario");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pedido</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<style type="text/css">
<!--
.style13 {font-size: large}
.style14 {
	font-size: 14px
}
-->
</style>
</head>
<body class="thrColLiq">
<div id="container">
  <div id="topPan">
  <div id="ImgPan"><img src="images/Brazil-Hirota.jpg" width="100%" height="75"></div>
<ul>
  	<li><a href="index.jsp" class="style5">inicio</a>| </li>
  	<li><a href="BuscaOfertasController">ofertas</a> | </li>
  	<li><a href="minha-lista.jsp">listas</a>| </li>
  	<li><a href="PermissaoController">carrinho</a> | </li>
  	<li><a href="PermEquiparativoController">equiparativo</a> |</li>
  </ul>
</div>
<br></br>
<p><img src="images/Untitled-77.png" width=100% height="18"></p>
<p><img src="images/Untitled-77.png" width=100% height="18"></p>
<div id="barraLogin">
<form action="LoginController" class="style5 style8 style8">
    
    <% if(session.getAttribute("usuario") == null) { %>
    <div align="center" class="style8 style8">Bem vindo, <b>Visitante</b><span class="style11">------</span><span class="style11">--------</span><a href="cadastro.jsp" class="style12" >Cadastre-se</a> <span class="style11">----</span> Login
        <input type="text" height="14" name="usuario.logindescricao" />
      Senha
      <input type="password" height="14" name="usuario.loginsenha" />
      <input type="submit" class="submit" value="Entrar" width="10" height="5"/></div>
      <% } %>
    
      <% if(session.getAttribute("usuario") != null) { %>
     <div align="center" class="style13"><span class="style8 style8">Bem vindo, <b><%=l.getLogindescricao()%></b><span class="style11">------</span><span class="style11">----------------</span><span class="style11"> ------------</span><a href="ListaAltCadastroController" class="style12" >Alterar Cadastro</a><span class="style11">----------</span><a href="DestroiSessaoController" class="style12" >Sair</a></span></div>
     <% } %> 	
  
</form>
</div>

  <!-- FIM DO CABEÇALHO -->
 
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><img src="images/Untitled-77.png" width=100% height="175"></p>
 
 <!-- INCÍCIO DO CONTEÚDO -->
<div id="bodyPan">
<div align="center">
    <p class="style7"></p>
    <p class="style7"></p>
    <p class="style7 style7 style9 style9">Você concluiu um Pedido..</p>
    <p class="style7"></p>
    <p class="style7">&nbsp;</p>
    <p class="style7">Após a confirmação do pagamento, seu pedido será encaminhado </p>
    <p class="style7">para o seguinte endereço registrado em nosso banco de dados:</p>
    
      <% if (lis != null){ %>
      
        <% for (Endereco e : lis) { %>
    <br></br>  <br></br>
    <p class="style7 style7 style14">Endereço: <strong><%=e.getEndlogradouro() %></strong>      Numero: <strong><%=e.getEndnumero() %></strong>      </p>
    <p class="style7 style7 style14">Complemento: <strong><%=e.getEndcomplemento() %></strong>      CEP: <strong><%=e.getEndcep() %></strong>      </p>
    <p class="style7 style7 style14">Bairro: <strong><%=e.getEndbairro() %></strong> 
      Estado: <strong><%=e.getEndestado() %></strong> 
      Cidade: <strong><%=e.getEndcidade() %></strong>    </p>
      
    <% } %>
    <% } %>
    <br></br>
    <% if (lis3 != null){ %>
    <% for (Telefone t : lis3) { %>
    <p class="style7 style7 style14">Telefone: <strong><%=t.getTelefoneddd() %> - <%=t.getTelefonenumero() %></strong>    </p>
    <% } %>
    <% } %>
    <br></br>
    <% if (lis2 != null){ %>
    <% for (Email em : lis2) { %>
    <p class="style7 style7 style14">Email: <strong><%=em.getEmaildescricao() %></strong>       </p>
     <% } %> 
    <% } %>
    <br></br>
    <form action="CompraController">
    <input type="submit" class="submit" value="ok" /></form>
    <div align="right">
    <table width="300" border="1">
      <tr>
        <th><div align="center"><strong>PAGAMENTO</strong></div></th>
      </tr>
    </table></div>
 </div>
</div>
<!-- FIM DO CONTEÚDO -->
<p><img src="images/Untitled-77.png" alt="" width=100% height="18"></p>
<div id="footermainPan">
  <div id="footerPan">
    <p align="center" class="style10 style8 style8">&nbsp;</p>
    <p align="center" class="style10 style8 style8 style8 style8 style6 style6"><strong>Hirota Supermercados - Tornando seu dia Melhor</strong></p>
    <p align="center" class="style10 style8 style8 style8 style8 style6 style6">Hitora Supermercados     © 2010 - Todos Direitos Reservados</p>
    <p align="center" class="style10 style8 style8">&nbsp;</p>
  </div>

</div>
</div>
</body>
</html>