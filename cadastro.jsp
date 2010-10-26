<%@ page contentType="text/html; charset=UTF-8"  
%> 
    <%@page import="java.util.List,br.ecom.projeto.models.*"
%>

<%
Login l = (Login)session.getAttribute("usuario");
%>

<html>
<head>
<title>Cadastro</title>
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
 <p align="left"><span class="style12">-----</span><img src="images/arrow1.gif" width="10" height="10"> <span class="style9 style7 style7"><strong>Cadastro</strong></span></p>
  <p align="right"><%if(session.getAttribute("controle") != null) {%> <h5>Você tem <%=session.getAttribute("controle")%> itens em sua Lista<%}%></h5></p>
  <p align="right"><%if(session.getAttribute("controle2") != null) {%> <h5>Você tem <%=session.getAttribute("controle2")%> itens em seu Carrinho</h5><%}%></p>
  <p align="left">&nbsp;</p>
  <p><img src="images/Untitled-77.png" width=100% height="175"></p>
 
 <!-- INCÍCIO DO CONTEÚDO -->
<div id="bodyPan">

<form action="CadastroAction.action" > 
       
        <p align="center" class="style8 style8">Nome Completo:
          <input name="cliente.clientenome" size="35" />
        Sexo:
        <select name="cliente.clientesexo">
          <option value="" selected="selected"></option>
          <option value="Masculino">Masculino</option>
          <option value="Feminino">Feminino</option>
        </select> 
      </p>
        <p align="center" class="style8 style8">RG 
          <input name="cliente.clienterg" />
        
        CPF
        <input name="cliente.clientecpf" />
      </p>
        <p align="center" class="style8 style8">Data Nascimento:
          <input name="cliente.clientedatanasc" />
        
        Email: 
        <input name="email.emaildescricao" />
      </p>
        <p align="center" class="style8 style8">&nbsp;</p>
        <p align="center" class="style8 style8">DDD 
          <input name="telefone.telefoneddd" size="4" />
        
        Telefone 
        <input name="telefone.telefonenumero" size="24" />
        
        Tipo Telefone 
        <select name="telefone.telefonetipo">
          <option value="" selected="selected"></option>
          <option value="Residencial">Residencial</option>
          <option value="Comercial">Comercial</option>
          <option value="Celular">Celular</option>
        </select>
      </p>
        <p align="center" class="style8 style8">Logradouro: 
          <input name="endereco.endlogradouro" size="40" />
      
        Numero: 
        <input name="endereco.endnumero" size="6" />
      Complemento: 
          <input name="endereco.endcomplemento" size="10" />
      </p>
        <p align="center" class="style8 style8">Tipo do Endereco 
          <select name="endereco.endtipo">
          <option value="" selected="selected"></option>
          <option value="Casa">Casa</option>
          <option value="Apartamento">Apartamento</option>
          </select>
          CEP 
          <input name="endereco.endcep" size="35" />
        </p>
        <p align="center" class="style8 style8">Bairro: 
          <input name="endereco.endbairro" size="20" />
       
        Cidade: 
        <input  name="endereco.endcidade" size="20" />
        
        Estado
        <select name="endereco.endestado">
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
        <p align="center" class="style8 style8">&nbsp;</p>
        <p align="center" class="style8 style8">&nbsp;</p>
        <p align="center" class="style8 style8">Login: 
          <input type="text" name="login.logindescricao" />
      </p>
        <p align="center" class="style8 style8">Senha: 
          <input type="password" name="login.loginsenha" />
        </p>
        <p align="center" class="style8 style8">&nbsp;</p>
        <p align="center">
          
          <input type="submit" class="submit" value="Cadastrar Dados"/> 
          
          <input type="reset" class="submit" value="Limpar Dados" /></p>
                                                                           
  </form>
  
  <p>
    <% if(request.getAttribute("ok") != null) { %>
    
      <span class="style8 style8">Informações Pessoais<br>
        
        <b> ${cliente.clientenome}</b><br>
        <b> ${cliente.clienterg}</b><br>
        <b> ${cliente.clientecpf}</b><br>
      <b> ${cliente.clientedatanasc}</b></span></p>
  <p><span class="style8 style8"><br>
    Informações de Contato<br>
    
      <b> ${telefone.telefoneddd}</b><br>
      <b> ${telefone.telefonenumero}</b><br>
    
    
      <b> ${endereco.endlogradouro}</b><br>
      <b> ${endereco.endnumero}</b><br>
      <b> ${endereco.endcomplemento}</b><br>
      <b> ${endereco.endcep}</b><br>
      <b> ${endereco.endbairro}</b><br>
      <b> ${endereco.endcidade}</b><br>
      <b> ${endereco.endestado}</b></span><br>
    
    
    
  </p>
  <div align="center"><form action="login.jsp">
    <fieldset class="style9">
      <legend>
      <input type="submit" class="submit" value="Prosseguir" />
      </legend>
      </fieldset></form>
  </div>
  
  <% } %>
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