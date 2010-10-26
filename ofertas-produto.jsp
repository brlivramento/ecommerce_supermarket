<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List,br.ecom.projeto.models.*, java.text.DecimalFormat;"
%>

<%
	Produto produto = (Produto)session.getAttribute("produto");
Login l = (Login)session.getAttribute("usuario");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ofertas</title>
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
 <p align="left"><span class="style12">-----</span><img src="images/arrow1.gif" width="10" height="10"> <span class="style9 style7 style7"><strong>Produto</strong></span></p>
 <p align="left">&nbsp;</p>
 <p align="left">&nbsp;</p>
 <p align="right"></p>
  <p align="right"></p>
  <p align="left">&nbsp;</p>
  <p><img src="images/Untitled-77.png" width=100% height="175"></p>
  
 <!-- INCÍCIO DO CONTEÚDO -->
<div id="bodyPan">
  
  <table width="780" height="271">
  <tr>
  <td width="255"><img src="images\<%=produto.getProdutoimagem() %>" width=200px></td>
  <td><strong><%=produto.getProdutotitulo()%> <br> <%=produto.getProdutodescricao() %></strong></td>  </tr> 
  </table>
  
  <div align="center"><strong>Valor</strong>:<%=produto.getProdutovalor() %><br>
    
    
    <% if (produto != null) { %>
    
    
    
  </div>
  <form action="OfertaCalculoController" class="style7 style7">
		  <div align="center"><strong>Desconto</strong>:
		    <input name="txtDESCONTO" type="text" size="10"/ value=""%>
		    <input name="txtVALOR" type="hidden" value="<%=produto.getProdutovalor()%>"/>
		    <input type="submit" class="submit" value="Calcular" />
		  </div>
  </form>
 <div align="center"><span class="style7 style7">
	     <% } %>
		   
		   <% if (session.getAttribute("resultado") != null) {
			
			DecimalFormat form = new DecimalFormat("#.00"); 
			float desconto = (Float)session.getAttribute("desconto");
		%>
		   
	     <strong>Desconto de</strong>:
	     <input name="txtNOVOVALOR" type="text" value="<%=desconto %>%" />
	     <strong>Novo Valor</strong>:
	     <input name="txtCALCULO" type="text" value="<%=form.format(session.getAttribute("resultado")) %>" />
	     </span>
     </div>
	    <form action="CadastraOfertaController" class="style7 style7">
		   <div align="center">
		     <input type="submit" class="submit" value="Cadastrar nova Oferta" />
		   </div>
	    </form>	
		 <div align="center"><span class="style7 style7">
	     <%} %>
	     </span>
         </div>
    <p align="center" class="style7 style7">&nbsp;</p>
	<p align="center" class="style7 style7">&nbsp;</p>
	<p align="center" class="style7 style7">&nbsp;</p>
	<p>&nbsp;  </p>
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