<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.List,br.ecom.projeto.models.*"
%>
 <%@taglib prefix="s" uri="/struts-tags" %>

<%
@SuppressWarnings("unchecked")
List<SubCategoria> todassubcategorias = (List<SubCategoria>) request.getAttribute("todassubcategorias");
@SuppressWarnings("unchecked")	
List<Categoria> todascategorias = (List<Categoria>) request.getAttribute("todascategorias");
@SuppressWarnings("unchecked")	
List<Produto> produtoscat = (List<Produto>) request.getAttribute("produtoscat");
@SuppressWarnings("unchecked")	
List<Produto> produtossub = (List<Produto>) request.getAttribute("produtossub");
Login l = (Login)session.getAttribute("usuario");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Controle Ofertas</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
</head>
<body class="thrColLiq">
<div id="container">
  <div id="topPan">
  <div id="ImgPan"><img src="images/Brazil-Hirota.jpg" width="100%" height="75"></div>
<ul>
    <li><a href="ofertas-controle.jsp">controle</a> | </li>
    <li><a href="BuscaOfertasController">ofertas</a> | </li>
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

  <!-- FIM DO CABE�ALHO -->
 
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <p align="left"><span class="style12">-----</span><img src="images/arrow1.gif" width="10" height="10"> <span class="style9 style7 style7"><strong>Controle de Ofertas</strong></span></p>
  <p align="right"><h5>Administrador</h5></p>
  <p align="right"></p>
  <p align="left">&nbsp;</p>
  <p><img src="images/Untitled-77.png" width=100% height="175"></p>
  
 <!-- INC�CIO DO CONTE�DO -->
<div id="bodyPan">

<div align="center">
<form action="CatalogoController">
<fieldset>
<legend><span class="style8">Adicione ofertas em seus Produtos</span></legend>
<p>&nbsp;</p>
    <input type="hidden" name="buttonOferta" /> 
    <input type="submit" class="submit" value="Adicionar Ofertas""/>
</fieldset>
</form>

 </div>

<% if(request.getAttribute("ok") != null) { %>
<form action="BuscaProdutosController">
<input type="hidden" name="buttonOferta" />
<span class="style8 style8">Busca Nome</span> 
<input type="text" size=30 name="txtBUSCA" id="txtBUSCA" /> 
<input type="submit" class="submit" value="ok" width="43" height="20" /> 
 <span class="style8 style8">Busca Marcas</span> 
          <input type="text" size=30 name="txtBUSCA2" id="txtBUSCA2" />
          	<input type="submit" class="submit" value="ok" width="43" height="20"/>
          	</form>

<form action="BuscaCatalogoController" name="formBuscaCategoria">
<input type="hidden" name="buttonOferta" />
<span class="style8 style8">Categorias</span>
<select name="listaCategoria" style="width: 300px;" id="listaCategoria"
	onChange="document.formBuscaCategoria.submit()"> 
	
	<%   if (todascategorias != null) {         %>

	<option value="" selected="selected"></option>

	<%        	for (Categoria c : todascategorias) {        %>
	<option value="<%=c.getCategoriaid()%>"><%=c.getCategoriadescricao()%></option>
	<% 		} 	%>
	<%		}	%>
</select>
</form>
<form action=""><span class="style8 style8">Busca Codigo</span> 
<input type="text" size=30 name="txtBUSCA" id="txtBUSCA" /> 
<input type="submit" class="submit" value="ok" width="43" height="20" /></form>

<form action="BuscaCatalogoController" name="formBuscaSubcategoria">
<input type="hidden" name="buttonOferta" />
<span class="style8 style8"> Mais Categorias</span> 
<select name="listaSubCategoria" style="width: 300px;" id="listaSubCategoria"
	onChange="document.formBuscaSubcategoria.submit()">

	<%       	if (todassubcategorias != null) {        %>
	<option value="" selected="selected"></option>
	
	<%        	for (SubCategoria s : todassubcategorias) {        %>
	<option value="<%=s.getSubcatid()%>"><%=s.getSubcatdescricao()%></option>
	<%  	}  %>
	<%     	}     %>
</select>
</form>
<% } %>

<%if (produtoscat != null) { %>



<table width="96%">
	<caption>
	<span class="style8"><strong>Resultados:</strong></span>
	</caption>

	<tr>
		<th width="48%">&nbsp;</th>
		<th width="18%"><span class="style5 style7 style8 style8 style7 style10 style8 style8 style8 style8">Valor</span></th>
		<th width="34%"><span class="style5 style7 style8 style8 style7 style10 style8 style8 style8 style8">Desconto</span></th>
	</tr>

	<% 		for (Produto p : produtoscat) { 	%>
	<form action="OfertaController">
	<tr>
		<td><input name="txtCODIGO" type="hidden" class="style8 style8"
			value="<%=p.getProdutoid()%>" /></td>
		<td><input name="txtIMAGEM" type="hidden" class="style8 style8"
			value="<%=p.getProdutoimagem()%>" /></td>
		<td><input name="txtTITULO" type="hidden" class="style8 style8"
			value="<%=p.getProdutotitulo()%>" /></td>
		<td><input name="txtDESCRICAO" type="hidden"
			value="<%=p.getProdutodescricao()%>" />
		<input name="txtVALOR" type="hidden"
			value="<%=p.getProdutovalor()%>" /></td>
	</tr>
	

	<tr>
		<td class="style8"><span class="style8 style8"><b><%=p.getProdutotitulo()%></b></span></td>
		<td class="style8">R$ <%=p.getProdutovalor()%></td>
		<td class="style8"><input type="submit" class="submit" value="Cadastrar Oferta" /></td>
	</tr>
</form>
	<% } %>
</table>

<%}%>

<%if (produtossub != null) { %>



<table width="676">
	<tr>
		<th width="324"><span class="style8"></span></th>
		<th width="126"><span class="style8 style8">Valor</span></th>
		<th width="210"><span class="style8 style8">Desconto</span></th>
	</tr>

	<% 		for (Produto p : produtossub) { 	%>
<form action="OfertaController">
	<tr>
		<td><input name="txtCODIGO" type="hidden" class="style8 style8"
			value="<%=p.getProdutoid()%>" /></td>
		<td><input name="txtIMAGEM" type="hidden" class="style8 style8"
			value="<%=p.getProdutoimagem()%>" /></td>
		<td><input name="txtTITULO" type="hidden" class="style8 style8"
			value="<%=p.getProdutotitulo()%>" /></td>
		<td><input name="txtDESCRICAO" type="hidden"
			value="<%=p.getProdutodescricao()%>" />
		<input name="txtVALOR" type="hidden"
			value="<%=p.getProdutovalor()%>" /></td>
	</tr>

	<tr>
		<td><span class="style8 style8"><b><%=p.getProdutotitulo()%></b></span></td>
		<td><span class="style8 style8">R$ <%=p.getProdutovalor()%></span></td>
		<td><input type="submit" class="submit style8 style8" value="Cadastrar Oferta" /></td>
	</tr>
</form>
	<%}%>
</table>

<%}%>

</div>
<!-- FIM DO CONTE�DO -->
<p><img src="images/Untitled-77.png" alt="" width=100% height="18"></p>
<div id="footermainPan">
  <div id="footerPan">
    <p align="center" class="style10 style8 style8">&nbsp;</p>
    <p align="center" class="style10 style8 style8 style8 style8 style6 style6"><strong>Hirota Supermercados - Tornando seu dia Melhor</strong></p>
    <p align="center" class="style10 style8 style8 style8 style8 style6 style6">Hitora Supermercados     � 2010 - Todos Direitos Reservados</p>
    <p align="center" class="style10 style8 style8">&nbsp;</p>
  </div>

</div>
</div>
</body>
</html>