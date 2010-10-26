<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link href="style.css" rel="stylesheet" type="text/css" />
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

  <!-- FIM DO CABEÇALHO -->
 
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><img src="images/Untitled-77.png" width=100% height="175"></p>
 
 <!-- INCÍCIO DO CONTEÚDO -->
<div id="bodyPan">

<img src="images/Untitled-77.png" width="100%" height="24">
<div align="center">
  <p><img src="images/Untitled-77.png" width="100%" height="24">    </p>
  <p>&nbsp;</p>
  <p><span class="style12">Usuário e senha inválidos</span>
      </p>
</div>
<center>
<s:form action="LoginAction">
	<s:textfield name="usuario.logindescricao" label="Login"/>
	<s:password name="usuario.loginsenha" label="Senha"/> 
	<s:submit value="Entrar"/>
</s:form>
</center>
<img src="images/Untitled-77.png" width="100%" height="24">
</div>
<!-- FIM DO CONTEÚDO -->
<p><img src="images/Untitled-77.png" alt="" width=100% height="18"></p>
<div id="footermainPan">
  <div id="footerPan">
    <p align="center"><strong>Hirota Supermercados - Tornando seu dia Melhor</strong></p>
    <p align="center">Hitora Supermercados     © 2010 - Todos Direitos Reservados</p>
  </div>

</div>
</div>
</body>
</html>
