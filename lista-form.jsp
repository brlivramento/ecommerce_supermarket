<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List,br.ecom.projeto.models.*, java.text.DecimalFormat;"
%>

<%
@SuppressWarnings("unchecked")
	List<ItemL> itens = (List<ItemL>) session.getAttribute("itens");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>
<style type="text/css"> 
<!-- 
body  {
	font: 100% Verdana, Arial, Helvetica, sans-serif;
	margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
	padding: 0;
	text-align: center; /* this centers the container in IE 5* browsers. The text is then set to the left aligned default in the #container selector */
	color: #000000;
	background-color: #FFFFFF;
}
.thrColFix #container { 
	width: 780px;  /* using 20px less than a full 800px width allows for browser chrome and avoids a horizontal scroll bar */
	background: #FFFFFF;
	margin: 0 auto; /* the auto margins (in conjunction with a width) center the page */
	border: 1px solid #000000;
	text-align: left; /* this overrides the text-align: center on the body element. */
} 
.thrColFix #sidebar1 {
	float: left; /* since this element is floated, a width must be given */
	width: 150px; /* the actual width of this div, in standards-compliant browsers, or standards mode in Internet Explorer will include the padding and border in addition to the width */
	background: #EBEBEB; /* the background color will be displayed for the length of the content in the column, but no further */
	padding: 15px 10px 15px 20px; /* padding keeps the content of the div away from the edges */
}
.thrColFix #sidebar2 {
	float: right; /* since this element is floated, a width must be given */
	width: 160px; /* the actual width of this div, in standards-compliant browsers, or standards mode in Internet Explorer will include the padding and border in addition to the width */
	background: #EBEBEB; /* the background color will be displayed for the length of the content in the column, but no further */
	padding: 15px 10px 15px 20px; /* padding keeps the content of the div away from the edges */
}
.thrColFix #mainContent {
	width: 600px;
	margin-top: 0;
	margin-right: 200px;
	margin-bottom: 0;
	margin-left: 100px;
	background-color: #FFFFFF;
	left: auto;
	right: auto;
	padding: 0;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
}
.fltrt { /* this class can be used to float an element right in your page. The floated element must precede the element it should be next to on the page. */
	float: right;
	margin-left: 8px;
}
.fltlft { /* this class can be used to float an element left in your page */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* this class should be placed on a div or break element and should be the final element before the close of a container that should fully contain a float */
	clear:both;
    height:0;
    font-size: 1px;
    line-height: 0px;
}
.style1 {font-size: x-small}
.style7 {
	font-size: medium;
	color: #000000;
	font-family: Georgia, "Times New Roman", Times, serif;
}
.style8 {
	font-size: x-small;
	font-family: Georgia, "Times New Roman", Times, serif;
	color: #000000;
}
.style9 {
	font-family: Georgia, "Times New Roman", Times, serif;
	color: #000000;
}
.style11 {
	font-size: small;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #000000;
	font-weight: bold;
}
.style12 {font-size: x-small; font-family: Verdana, Arial, Helvetica, sans-serif; }
.style13 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style14 {font-size: x-small; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000; }
.style15 {font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000; }
.style17 {font-size: x-small; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333; }
--> 
</style>
<!--[if IE 5]>
<style type="text/css"> 
/* place css box model fixes for IE 5* in this conditional comment */
.thrColFix #sidebar1 { width: 180px; }
.thrColFix #sidebar2 { width: 190px; }
</style>
<![endif]--><!--[if IE]>
<style type="text/css"> 
/* place css fixes for all versions of IE in this conditional comment */
.thrColFix #sidebar2, .thrColFix #sidebar1 { padding-top: 30px; }
.thrColFix #mainContent { zoom: 1; }
/* the above proprietary zoom property gives IE the hasLayout it needs to avoid several bugs */
</style>
<![endif]--></head>

<body class="thrColFix">

<div id="container">
  <div id="mainContent">
    <h1 align="center" class="style7"><img src="images/Brazil-Hirota.jpg" width="196" height="53"></h1>
    <h1 align="left" class="style7"><span class="style8"><img src="images/Untitled-77.png" alt="" width="574" height="19"></span></h1>
    <div align="center" class="style8">Imprimir</div>
    <div align="center" class="style9">
      <p align="center" class="style1"><span class="style11">SUA LISTA DE COMPRAS</span> </p>
        <% 	if (itens != null) { %>
     
      <table width="604" border="3">
         <tr bordercolor="#333333">
           <th width="150" class="style17" scope="col" abbr="">Produto</th>
		  <th width="67" class="style17" scope="col" abbr="">Quantidade</th>
		  <th width="67" class="style17" scope="col" abbr="">Valor</th>
	  </tr>
           
         <% 	for (ItemL i : itens) { %>
           
         <tr bordercolor="#333333">
           <th class="style17" scope="col" abbr=""><%=i.getProduto().getProdutotitulo()%></th>
		  <th class="style17" scope="col" abbr=""><%=i.getItemquantidade()%></th>
		  <th class="style17" scope="col" abbr=""><%=i.getTotal() %></th>
	   </tr>
       <% } %>
      </table>
	   
	   <span class="style13">
	   <% if (session.getAttribute("listatotal") != null) {
		DecimalFormat form = new DecimalFormat("#.00");
		double listatotal = (Double)session.getAttribute("listatotal"); %>
       </span>
      <table width="604" border="1">
       <tr>
	   <th width="587" class="style13"><span class="style1">Total - R$ <%=form.format(listatotal) %></span></th>
	   </tr>
      </table>
        <span class="style13">
        <%} %>
           
          
          
        <span class="style1">
       <% } %>
        </span></span> </div>
    
    
    <p align="center" class="style14">Você; encontra as lojas Hirota em dez diferentes endere&ccedil;os. <br>
    Confira a loja mais pr&oacute;xima de voc&ecirc; e venha nos fazer uma visita.</p>
    <p align="center" class="style15"><span class="style1"><strong>Loja 1 - Hirota Lino Coutinho</strong><br />
      Rua Lino Coutinho, 990 - Ipiranga11 2063-9597Atendimento:<br />
      Segunda à Sábado: 07:30 às 20:30hs<br />
      Domingos e Feriados: 09:00hs às 14:00hs.</span>       </p>
    <p align="center" class="style15"><span class="style1"><strong>Loja 2 - Hirota Saúde</strong><br />
      Avenida Jabaquara, 1920 - Saúde11 2577-1937Atendimento:<br />
      Segunda à Sexta 08:00hs às 21:30hs.<br />
      Sabado: 08:00hs às 21:00hs.<br />
     Domingos e Feriados: 09:00hs as 14:00hs.      </span></p>
    <p align="center" class="style15"><span class="style1"><strong>Loja 3 - Hirota Brigadeiro Jordção</strong><br />
      Ver maisRua Brigadeiro Jordão, 479 - Ipiranga11 2063-4665Atendimento:<br />
      Segunda à Sábado: 08:00hs às 20:00hs.<br />
      Domingos e Feriados: Fechado.Serviços: <br />
     </span></p>
    <p align="center" class="style15"><span class="style1"><strong>Loja 4 - Hirota Gaspar Fernandes</strong><br />
      Ver maisRua Gaspar Fernandes, 452 - Vila Monumento11 2066-5300Atendimento:<br />
      Segunda à Sàbado: 08:00hs às 21:00hs<br />
      Domingos e Feriados: 09:00hs as 14:00hs.Serviços: <br />
     </span></p>
    <p align="center" class="style9"><span class="style12"><strong>Loja 5 - Hirota Aclimação</strong><br />
      Ver maisAvenida Aclimação 488 - Aclimação11 3277-0140Atendimento:<br />
      Segunda à Sábado: 08:00hs às 21:00hs<br />
    Domingos e Feriados: 09:00hs às 14:00hs.Serviços: </span></p>
    <p align="center" class="style9"><span class="style1"><span class="style8"><img src="images/Untitled-77.png" alt="" width="574" height="19"></span></span><span class="style9">
      <br></br>
    </span></p>
    </div>
<span class="style1">
	<!-- This clearing element should immediately follow the #mainContent div in order to force the #container div to contain all child floats -->
	<br class="clearfloat" />
  </span>
	<!-- end #container --></div>
</body>
</html>