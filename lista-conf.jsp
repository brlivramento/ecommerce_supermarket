<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List,br.ecom.projeto.models.*, java.text.DecimalFormat;"
%>

<%
@SuppressWarnings("unchecked")
	List<ItemL> itens = (List<ItemL>) session.getAttribute("itens");
Login l = (Login)session.getAttribute("usuario");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista</title>
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
 <p align="left"><span class="style12">-----</span><img src="images/arrow1.gif" width="10" height="10"> <span class="style9 style7 style7"><strong>Confirmação Lista de Compras</strong></span></p>
 <p align="left">&nbsp;</p>
 <p align="left">&nbsp;</p>
 <p align="right"></p>
  <p align="right"></p>
  <p align="left">&nbsp;</p>
  <p><img src="images/Untitled-77.png" width=100% height="175"></p>
 <!-- INCÍCIO DO CONTEÚDO -->
<div id="bodyPan">


<%
	if (itens != null) {
%>
<div align="center">
<table width="92%" height="78">
<tr>
	  <th width="39%" class="style3 style6 style8 style9" scope="col" abbr="">Produto</th>
	  <th width="22%" class="style8 style9" scope="col" abbr="">Quantidade</th>
	  <th width="12%" class="style8 style9" scope="col" abbr="">Valor</th>
	</tr>

	<%
		for (ItemL i : itens) {
	%>
    
   <tr>
		<td><span class="style11 style8"><b><%=i.getProduto().getProdutotitulo()%></b></span></td>
     	<td><span class="style11 style8"><%=i.getItemquantidade() %></span></td>
        <td><span class="style11 style8"> <%=i.getTotal() %></span></td>
	 </tr>

	<%
		}
	%>	
    </table>
    <% if (session.getAttribute("listatotal") != null) {
    	DecimalFormat form = new DecimalFormat("#.00");
		double listatotal = (Double)session.getAttribute("listatotal"); %>	
		
		<table width="92%">
    <tr>
	<th width="100%"><div align="center"><span class="style12">Total - R$ <%=form.format(listatotal) %></span></div></th>
	</tr>
	<%}%>	
       </table>
	
	
	<form action="minha-lista.jsp">	
    <input type="submit" class="submit" value="Voltar Lista Compras"/>
     </form>
	
	<form action="lista-form.jsp">	
	<input type="submit" class="submit" value="Imprimir"/>
	</form>
	
	
	<%
		}
	%>
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