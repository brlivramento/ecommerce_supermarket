<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.List,br.ecom.projeto.models.*"
%>

<%
@SuppressWarnings("unchecked")
List<Cliente> lista = (List<Cliente>)request.getAttribute("lista");
Login l = (Login)session.getAttribute("usuario");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Alterar Cadastro</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<style type="text/css">
<!--
.style13 {font-weight: bold}
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

  <!-- FIM DO CABEï¿½ALHO -->
 
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <p align="left"><span class="style12">-----</span><img src="images/arrow1.gif" width="10" height="10"> <span class="style9 style7 style7"><strong>Alterar Cadastro</strong></span></p>
  <p align="right"><%if(session.getAttribute("controle") != null) {%> 
  <h5>VocÃª tem <%=session.getAttribute("controle")%> itens em sua Lista<%}%></h5></p>
  <p align="right"><%if(session.getAttribute("controle2") != null) {%> 
  <h5>VocÃª tem <%=session.getAttribute("controle2")%> itens em seu Carrinho</h5><%}%></p>
  <p align="left">&nbsp;</p>
  <p><img src="images/Untitled-77.png" width=100% height="175"></p>
  
 <!-- INCï¿½CIO DO CONTEï¿½DO -->
<div id="bodyPan">

<form action="AlteraCadastroController"/>

<p align="center">
  <% if(lista != null) { %>
  
    <% for (Cliente cli : lista) { %>
    <input type="hidden" name="txtIDEMAIL" value="<%=cli.getEmail().getEmailid() %>" />	
    <% } %>	 
  
    <span class="style8">Email:</span> 
  <input type="hidden" name="buttonEmail" />
   <input name="txtEMAIL" />
  </p>
<p align="center">&nbsp;</p>
<p align="center">
   <input type="submit" class="submit" value="Alterar" /> 
  </form>
  
  <% if (request.getAttribute("ok") != null) { %>	   
  <span class="style8"><strong>Email alterado com sucesso!</strong></span>
  <% } %>

<form action="AlteraCadastroController"/> 
    
       <% for (Cliente cli : lista) { %>
       <input type="hidden" name="txtIDTELEFONE" value="<%=cli.getTelefone().getTelefoneid() %>" />
<% } %>	
       
        <input type="hidden" name="buttonTelefone" />
       
    
     <p align="center" class="style8 style8">DDD 
       <input type="text" name="txtDDD" size="4" />
        
       Telefone 
       <input type="text" name="txtTELEFONE" size="20" />
        
       Tipo Telefone 
       <select name="selTELTIPO">
         <option value="" selected="selected"></option>
         <option value="Residencial">Residencial</option>
         <option value="Comercial">Comercial</option>
         <option value="Celular">Celular</option>
       </select>
    </p>
	  	  
	        <p>&nbsp;</p>
	        <p align="center">
	          <input type="submit" class="submit" value="Alterar Telefone" /> 
	          
	          </form>
	          
	          <% if (request.getAttribute("ok3") != null) { %>	   
	          <span class="style8"><strong>Telefone alterado com sucesso!</strong></span>
	          <% } %>
    <form action="AlteraCadastroController"/>
	      
  <div align="center">
    <% for (Cliente cli : lista) { %>
    <input type="hidden" name="txtIDENDERECO" value="<%=cli.getEnd().getEndid() %>" />
    <% } %>	
	          
      <input type="hidden" name="buttonEndereco" />
	          
    </div>
        <p align="center" class="style8 style8">Logradouro: 
          <input name="txtLOGRADOURO" size="40" />
      
        Numero: 
 
        <input name="txtNUMERO" size="6" />
      Complemento: 
          <input name="txtCOMPLEMENTO" size="10" />
      </p>
        <p align="center" class="style8 style8">Tipo do Endereco 
          <select name="selENDTIPO">
          <option value="" selected="selected"></option>
          <option value="Casa">Casa</option>
          <option value="Apartamento">Apartamento</option>
          </select>
          CEP 
          <input name="txtCEP" size="35" />
        </p>
        <p align="center" class="style8 style8">Bairro: 
          <input name="txtBAIRRO" size="20" />
       
        Cidade: 
        <input  name="txtCIDADE" size="20" />
        
        Estado
        <select name="selESTADO">
          <option value="" selected="selected"></option>
          <option value="AC">AC</option>
          <option value="AL">AL</option>
          <option value="AP">AP</option>
          <option value="AM">AM</option>
          <option value="BA">BA</option>
          <option value="CE">CE</option>
          <option value="DF">DF</option>
          <option value="ES">ES</option>
          <option value="GO">GO</option>
          <option value="MA">MA</option>
          <option value="MT">MT</option>
          <option value="MS">MS</option>
          <option value="MG">MG</option>
          <option value="PA">PA</option>
          <option value="PB">PB</option>
          <option value="PR">PR</option>
          <option value="PE">PE</option>
          <option value="PI">PI</option>
          <option value="RJ">RJ</option>
          <option value="RN">RN</option>
          <option value="RS">RS</option>
          <option value="RO">RO</option>
          <option value="RR">RR</option>
          <option value="SC">SC</option>
          <option value="SP">SP</option>
          <option value="SE">SE</option>
          <option value="TO">TO</option>
        </select>
      </p>
	  	      
	        <div align="center">
	        <input type="submit" class="submit" value="Alterar Endereï¿½o" /> 
	        
	       
	        
	        <% if (request.getAttribute("ok2") != null) { %>
	        <span class="style8"><strong>EndereÃ§o alterado com sucesso!</strong></span>
            <% } %></div> </form>
  </div>
	        
	        <% } %>	
            
</div>
<!-- FIM DO CONTEï¿½DO -->
<p><img src="images/Untitled-77.png" alt="" width=100% height="18"></p>
<div id="footermainPan">
  <div id="footerPan">
    <p align="center" class="style10 style8 style8">&nbsp;</p>
    <p align="center" class="style10 style8 style8 style8 style8 style6 style6"><strong>Hirota Supermercados - Tornando seu dia Melhor</strong></p>
    <p align="center" class="style10 style8 style8 style8 style8 style6 style6">Hitora Supermercados     ï¿½ 2010 - Todos Direitos Reservados</p>
    <p align="center" class="style10 style8 style8">&nbsp;</p>
  </div>

</div>
</body>
</html>