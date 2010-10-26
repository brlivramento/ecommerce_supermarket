        <%@page import="java.util.List,br.ecom.projeto.models.*"
%>

<%
@SuppressWarnings("unchecked")
	List<ItemL> itens = (List<ItemL>) session.getAttribute("itens");
Login l = (Login)session.getAttribute("usuario");
%>
<html>
<head>
<title>Lista Compras</title>
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
  <p align="left"><span class="style12">-----</span><img src="images/arrow1.gif" width="10" height="10"> <span class="style9 style7 style7"><strong>Minha Lista de Compras</strong></span></p>
  <p align="right"><%if(session.getAttribute("controle") != null) {%> <h5>Você tem <%=session.getAttribute("controle")%> itens em sua Lista<%}%></h5></p>
  <p align="right"><%if(session.getAttribute("controle2") != null) {%> <h5>Você tem <%=session.getAttribute("controle2")%> itens em seu Carrinho</h5><%}%></p>
  <p align="left">&nbsp;</p>
  <p><img src="images/Untitled-77.png" width=100% height="175"></p>
  
 <!-- INCÍCIO DO CONTEÚDO -->
<div id="bodyPan">
<div align="left">
  <% 	if (itens != null) { %>
  
    <table width="70%" height="87">
      <tr>
        <th width="60%"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Produto</span></th>
	      <th width="20%"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Quantidade</span></th>
	      <th width="10%"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Valor</span></th>
          <th width="100"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Remover</span></th>
	    </tr>
      
      <% 	for (ItemL i : itens) { %>
      
      <tr>
        <td><span class="style11 style8"><b><%=i.getProduto().getProdutotitulo()%></b></span></td>
   	      <td><span class="style11 style8"><%=i.getItemquantidade()%></span></td>
          <td><span class="style11 style8"> <%=i.getTotal() %></span></td>
          <td><div align="center">
          <form action="RemoverItemCController">              
                <input type="hidden" name="id" value="<%=i.getItemid() %>"/>
              <input type="submit" class="submit" value="remover"/>
          </form></div></td>
	    </tr>
      <% } %>
    </table>
  <div class="style7" id="apDiv2"> 
    <form action="CatalogoController">
      <fieldset>  
        <legend><span class="style11">Adicione produtos</span></legend>
        <input type="hidden" name="buttonListaCompras" value="ListaCompras" />
        <input type="submit"  class="submit" value="Adicione Produtos"/>
        </fieldset>
    </form>
    <form action="RemoverListaController">
      <fieldset>    
        <legend><span class="style11">Limpe sua lista</span></legend>
        <input type="submit"  class="submit" value="Esvaziar Lista"/>
        </fieldset>
    </form>
    <form action="ListaComprasController" >
      <fieldset>  
        <legend><span class="style13 style8">Finalize sua lista</span></legend>
        <input type="submit"  class="submit" value="Finalizar Lista"/>
        </fieldset>
    </form>
  </div>
     <% } %>
    
    <% if (itens == null) { %> 
    <center class="style1"> 
  <table width="70%">
      <tr>
        <td width="100%"><form action="CatalogoController">
            <fieldset>
              <legend><span class="style3 style4 style10 style14"> Sua Lista está vazia.</span></legend>
              <legend class="style3 style6 style10 style14">Adicione produtos consultando nosso Catálogo</legend>
               <p align="center">&nbsp;</p>
              
                <input type="hidden" name="buttonListaCompras" value="ListaCompras" /> 
                <input type="submit"  class="submit" value="Adicione Produtos"/>
                
            </fieldset>
        </form></td>
      </tr></table>
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
</div>
</body>
</html>