<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List,br.ecom.projeto.models.*"
%>

<%
@SuppressWarnings("unchecked")
	List<ItemC> lista = (List<ItemC>) session.getAttribute("lista");
Login l = (Login)session.getAttribute("usuario");
%>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Carrinho</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<style type="text/css">
<!--
#apDiv2 {
	position:absolute;
	left:677px;
	top:4px;
	width:166px;
	height:322px;
	z-index:1;
}
.style14 {color: #333333}
.style16 {color: #FFFFFF; font-size: x-small; }
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
 <p align="left"><span class="style12">-----</span><img src="images/arrow1.gif" width="10" height="10"> <span class="style9 style7 style7"><strong>Meu Carrinho de Compras</strong></span></p>
  <p align="right"><%if(session.getAttribute("controle") != null) {%> <h5>Você tem <%=session.getAttribute("controle")%> itens em sua Lista<%}%></h5></p>
  <p align="right"><%if(session.getAttribute("controle2") != null) {%> <h5>Você tem <%=session.getAttribute("controle2")%> itens em seu Carrinho</h5><%}%></p>
  <p align="left">&nbsp;</p>
  <p><img src="images/Untitled-77.png" width=100% height="175"></p>
  
 <!-- INCÍCIO DO CONTEÚDO -->
<div id="bodyPan">
<%
	if (lista != null) {
%>

<div class="style7" id="apDiv2">   
<form action="CatalogoController">
<fieldset>
<legend><span class="style13">Adicione produtos</span></legend>
<input type="hidden" name="buttonCarrinho" value="Carrinho" />
<input type="submit" class="submit"  value="Adicione Produtos" />
</fieldset>
</form>

<form action="RemoverListaCarrinhoController">
<fieldset>
<legend><span class="style13">Esvazie seu carrinho</span></legend>
<input type="submit" class="submit" value="Esvaziar Carrinho"/>
</fieldset>
</form>

<form action="ListaCarrinhoController">
<fieldset>
<legend><span class="style13">Finalize seu carrinho</span></legend>
<input type="submit" class="submit" value="Finalizar Carrinho" />
</fieldset>
</form>
</div>

<div align="left">
	<table width="70%" height="87">
	<tr>
		<th width="60%"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Produto</span></th>
		<th width="20%"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Quantidade</span></th>
		<th width="10%"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Valor</span></th>
        <th width="100"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Remover</span></th>
	</tr>

	<%
		for (ItemC i : lista) {
	%>
	
	<tr>
		<td><span class="style11 style8"><%=i.getProduto().getProdutotitulo()%></span></td>
	  <td><span class="style11 style8"><%=i.getItemcquantidade()%></span></td>
	  <td><span class="style11 style8"><%=i.getTotal() %></span></td>
	 <td>
	<form action="DeleteItemController" class="style8 style7 style7">
	<input type="hidden" name="id" value="<%=i.getItemcid()%>"/>
	<input type="submit" class="submit" value="remover item" />
	</form></td>
	</tr>

	<%
		}
	%>
	</table>
  </div>

<span class="style3">
<%
	}
%>


<% if (lista == null) { %> 
</span>
<center class="style1">
<table width="70%">
<tr>
<td width="100%"><form action="CatalogoController">
<fieldset>
<legend><span class="style14 style3 style4 style10">Seu Carrinho está vazio..</span></legend>
<legend class="style14 style3 style6 style10">Adicione produtos consultando nosso Catálogo</legend>
<p>&nbsp;</p>
<input type="hidden" name="buttonCarrinho" value="Carrinho" />
<input type="submit" class="submit" value="Adicione Produtos"/>
</fieldset>
</form></td></tr>
</table>
</center>
<% } %>
<p>&nbsp;</p>
	<p>&nbsp;</p>
    <p>&nbsp;</p>
	<p>&nbsp;</p>
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

</body>
</html>