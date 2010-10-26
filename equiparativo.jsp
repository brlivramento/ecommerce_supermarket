<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List,br.ecom.projeto.models.*, java.text.DecimalFormat;"
%>   
    
<%
@SuppressWarnings("unchecked")
List<CarrinhoCompras> lista = (List<CarrinhoCompras>)request.getAttribute("lista");
Login l = (Login)session.getAttribute("usuario");
%>  
  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sem Nome</title>
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

  <!-- FIM DO CABEï¿½ALHO -->
 
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p align="left"><span class="style12">-----</span><img src="images/arrow1.gif" width="10" height="10"> <span class="style9 style7 style7"><strong>Equiparativo</strong></span></p>
  <p align="left">&nbsp;</p>
  <p align="left">&nbsp;</p>
  <p align="right"></p>
  <p align="right"></p>
  <p align="left">&nbsp;</p>
  <p><img src="images/Untitled-77.png" width=100% height="175"></p>
 
 <!-- INCï¿½CIO DO CONTEï¿½DO -->
<div id="bodyPan">
        
        <% if (lista != null) { %>    
      <form action="EquiparativoController">
       
           <div align="left"><span class="style8">Selecione a Primeira Lista</span> 
             <select name="primeiraLista" id="primeiraLista" style="width:400px;">        
               <option selected="selected"></option>      
               
               <% for (CarrinhoCompras c : lista) { %>
               <option value="<%=c.getPedidoid()%>" ><%=c.getPedidodata() %> - <%=c.getPedidoid() %></option>   
               <% } %>
                 </select>
           </div>
        <p align="left"><span class="style8">Selecione a Segunda Lista</span>
          <select name="segundaLista" id="segundaLista" style="width:400px;" >
           <option selected="selected"></option>       
           
           <% for (CarrinhoCompras c : lista) { %>           
               <option value="<%=c.getPedidoid()%>" ><%=c.getPedidodata() %> - <%=c.getPedidoid() %></option>       
           <% } %>
             </select>      
         
            <input type="submit" class="submit" value="Comparar" />
           </p>
    </form>
         
    <p class="style8 style8 style13">
      <% } %>
          
          <% if ( request.getAttribute("ok") != null) { 

        	  
        	  double v1 = (Double)request.getAttribute("v1");
        	  double v2 = (Double)request.getAttribute("v2");
        	  double maiscaro = (Double)request.getAttribute("maiscaro");
        	  double maisbarato = (Double)request.getAttribute("maisbarato");
        	  double economia = (Double)request.getAttribute("economia");
        	  double total = (Double)request.getAttribute("total");
        	  String imaiscaro = (String)request.getAttribute("imaiscaro");
        	  String imaisb = (String)request.getAttribute("imaisb");
        	  String coment1 = (String)request.getAttribute("coment1");
        	  String coment2 = (String)request.getAttribute("coment2");
        	  int q1 = (Integer)request.getAttribute("q1");
        	  int q2 = (Integer)request.getAttribute("q2");

        	  %>
     
       <p class="style8 style8 style13">Total em R$ gasto Primeira Lista
          <input type="text" value="<%=v1%>" />
    </p>
    <p class="style8 style8 style13">Total em R$ gasto Segunda Lista
           <input type="text" value="<%=v2%>" />
    </p>
    <p class="style8 style8 style13">Total
    <% DecimalFormat form = new DecimalFormat("#.00");  %>
           <input type="text" value="<%=form.format(total) %>" />
    </p>
    <p class="style8 style8 style13">&nbsp;</p>
    <p class="style8 style8 style13">Economia 
      <input type="text" value="<%=form.format(economia) %>" />
    </p>
    <p class="style8 style8 style13">&nbsp;</p>
    <p class="style8 style8 style13">Quant. Itens Primeira Lista
       <input type="text" value="<%=q1 %>" />
    </p>
    <p class="style8 style8 style13">Quant. Itens Segunda Lista
       <input type="text" value="<%=q2 %>" />
    </p>
    <p class="style8 style8 style13">&nbsp;</p>
    <p class="style8 style8 style13">Item mais caro 
      <input type="text" size="35" value="<%=imaiscaro%>" />
    </p>
    <p class="style8 style8 style13">Preço do Item mais caro
      <input type="text" value="<%=maiscaro %>" />
    </p>
    <p class="style8 style8 style13">&nbsp;</p>
    <p class="style8 style8 style13">Item mais barato
      <input type="text" size="35" value="<%=imaisb %>"/>
    </p>
    <p class="style8 style8 style13">Preço do Item mais barato
       <input type="text" value="<%=maisbarato %>" />
    </p>
    <p class="style8 style8 style13">&nbsp;</p>
    <p class="style8 style8 style13">Comentarios Primeira Lista    </p>
    <p class="style8 style8 style13">
      <textarea cols="45" rows="5"><%=coment1 %></textarea>
    </p>
    <p class="style8 style8 style13">Comentarios Segunda Lista</p>
    <p class="style8 style8 style13">
      <textarea name="textarea" id="textarea" cols="45" rows="5"><%=coment2 %></textarea> </p>
 <% } %> 
                                                                           
</div>
<!-- FIM DO CONTEï¿½DO -->
<p><img src="images/Untitled-77.png" alt="" width=100% height="18"></p>
<div id="footermainPan">
  <div id="footerPan">
    <p align="center"><strong>Hirota Supermercados - Tornando seu dia Melhor</strong></p>
    <p align="center">Hitora Supermercados     ï¿½ 2010 - Todos Direitos Reservados</p>
  </div>
</div></div>
</body>
</html>