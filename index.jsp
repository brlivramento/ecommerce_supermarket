<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List,br.ecom.projeto.models.*"
%>

<%
Login l = (Login)session.getAttribute("usuario");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Início</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
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
 <p align="left"><span class="style12">-----</span><img src="images/arrow1.gif" width="10" height="10"> <span class="style9 style7 style7"><strong>Página Principal</strong></span></p>
  <p align="right"><%if(session.getAttribute("controle") != null) {%> <h5>Você tem <%=session.getAttribute("controle")%> itens em sua Lista<%}%></h5></p>
  <p align="right"><%if(session.getAttribute("controle2") != null) {%> <h5>Você tem <%=session.getAttribute("controle2")%> itens em seu Carrinho</h5><%}%></p>
  <p align="left">&nbsp;</p>
  <p><img src="images/Untitled-77.png" width=100% height="175"></p>
  
 <!-- INCÍCIO DO CONTEÚDO -->
<div id="bodyPan">

<p align="right" class="style9">&nbsp;</p>
<p class="style9 style9"><strong>Bem Vindo ao Sistema</strong></p>
<p>&nbsp;</p>

<p align="center"></p><table width="84%" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr> 
    <td width="37%" rowspan="2"><img src="images/carrinho_de_compras.png" width="136" height="135"></td>
    <td width="63%"><p align="left"><span class="style9 style9"><strong>Efetue Compras Online</strong><br>
          A maneira mais prática de fazer compras </span></p>
      </td>
  </tr>
  <tr> 
    <td><span class="style8 style8 style9 style9"><a href="PermissaoController">CLIQUE AQUI</a> 
    	<br></span>
      <p class="style7 style7">Durante a  navega&ccedil;&atilde;o pelo site, voc&ecirc; pode i acrescentar produtos em seu Carrinho de  compras virtual, como em um supermercado, este carrinho cont&ecirc;m informa&ccedil;&otilde;es  b&aacute;sicas sobre os produtos comprados: pre&ccedil;o, quantidade e total do  seu pedido. </p></td>
  </tr>
</table>

<br>
<table width="97%" height="79" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="78%"><p class="style9 style14"><strong>Crie  Lista de Compras</strong></p></td>
    <td width="22%" rowspan="2"><img src="images/check-list.jpg" width="120" height="156"></td>
  </tr>
  <tr> 
    <td><span class="style8 style8 style7 style7 style9 style9"><a href="minha-lista.jsp" class="style13">CLIQUE AQUI</a> 
    	<br></span>
      <p class="style7 style7">Possibilidade  de cria&ccedil;&atilde;o de Listas de compras. Para acionar esta funcionalidade, voc&ecirc;, usu&aacute;rio n&atilde;o  precisar&aacute; necessariamente estar logado, tendo em vista que seu  interesse &eacute; somente gerar uma lista como aux&iacute;lio para uma posterior compra em nossa rede de supermecados.</p></td>
  </tr>
</table>
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