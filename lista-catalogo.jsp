
    <%@page import="java.util.List,br.ecom.projeto.models.*"
%>

<%
@SuppressWarnings("unchecked")
List<Produto> produtosbusca = (List<Produto>) request.getAttribute("produtosbusca");
@SuppressWarnings("unchecked")
List<Produto> produtosmarca = (List<Produto>) request.getAttribute("produtosmarca");
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
<html>
<head>
<title>Catalogo</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<script type="text/javascript">

function validar() {
	var tamanho = document.formAddItens.addPROD.length;
	for (i=0; i < tamanho; i++) {
		if (!document.formAddItens.addPROD[i].checked) {
			document.formAddItens.addQUATID[i].value = "0";
		}	
	}	
	document.formAddItens.submit();	
}
</script>
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
 <p align="left"><span class="style12">-----</span><img src="images/arrow1.gif" width="10" height="10"> <span class="style9 style7 style7"><strong>Catálogo</strong></span></p>
  <p align="right"><%if(session.getAttribute("controle") != null) {%> <h5>Você tem <%=session.getAttribute("controle")%> itens em sua Lista<%}%></h5></p>
  <p align="right"><%if(session.getAttribute("controle2") != null) {%> <h5>Você tem <%=session.getAttribute("controle2")%> itens em seu Carrinho</h5><%}%></p>
  <p align="left">&nbsp;</p>
  <p><img src="images/Untitled-77.png" width=100% height="175"></p>
  
 <!-- INCÍCIO DO CONTEÚDO -->
<div id="bodyPan">


<form action="BuscaProdutosController">	  
	    <input type="hidden" name="buttonListaCompras" value="ListaCompras" />
	    <span class="style8 style8">Busca Nome</span>  	    
	    <input type="text" size=30 name="txtBUSCA"/>
	    <input type="submit" class="submit" value="ok" width="43" height="20"/>
	 
	     <span class="style8 style8">Busca Marcas</span> 
          <input type="text" size=30 name="txtBUSCA2"/>

          	<input type="submit" class="submit" value="ok" width="43" height="20"/>
	  </form>
      
        
     <form action="BuscaCatalogoController" name="formBuscaCategoria">
       <p>
         <input type="hidden" name="buttonListaCompras" value="ListaCompras" />
           <span class="style8 style8">Categorias</span>  
         <select name="listaCategoria" style="width:300px;" id="listaCategoria" onChange="document.formBuscaCategoria.submit()">
           
           <%       	if (todascategorias != null) {        %>
           
           <option value="" selected="selected"></option> 
           
           <% 	for (Categoria c : todascategorias) {        %>
           <option value="<%=c.getCategoriaid()%>"><%=c.getCategoriadescricao()%></option>
           <%
		}
	%>
           <%
		}
	%>
         </select>
      </p>
     </form>
         <form action="BuscaCatalogoController" name="formBuscaSubcategoria">
         <input type="hidden" name="buttonListaCompras" value="ListaCompras" />
       <span class="style8 style8"> Mais Categorias</span>      
      <select name="listaSubCategoria" style="width:300px;" id="listaSubCategoria" onChange="document.formBuscaSubcategoria.submit()">
           
           <%
        	if (todassubcategorias != null) {
        %>
           <option value="" selected="selected"></option>
        <%
        	for (SubCategoria s : todassubcategorias) {
        %>
           <option value="<%=s.getSubcatid()%>"><%=s.getSubcatdescricao()%></option>
           <%
  	}
  %>   
           <%
     	}
     %>      
         </select>
       </form>

	
	<% if (request.getAttribute("produtosbusca")!= null) {%>
	<form name="formAddItens" action="ItemLController" method="post">
	
<table width="800">
	<caption>
	<span class="style8"><strong>Resultados:</strong></span>
	</caption>

	<tr>
		<th width="118"></th>
		<th width="210"></th>
		<th width="60"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Valor</span></th>
		<th width="80"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Quantidade</span></th>
		<th width="60"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Adicionar</span></th>
	</tr>	

	<% for (Produto p : produtosbusca) { %>
		
	<tr>
	<td><input name="txtTITULO" type="hidden" value="<%=p.getProdutotitulo() %>"/></td>
	<td><input name="txtDESCRICAO" type="hidden" value="<%=p.getProdutodescricao()%>"/></td>
	<td><input name="txtVALOR" type="hidden" value="<%=p.getProdutovalor()%>"/></td>
    </tr>
	
	<tr>
		<td><img src="images\<%=p.getProdutoimagem()%>" width=100px class="style8"></td>
		<td><span class="style11 style8"><b><%=p.getProdutotitulo()%></b><br><%=p.getProdutodescricao()%></span></td>
     	<td><span class="style11 style8">R$ <%=p.getProdutovalor()%></span></td>		
		<td><input name="addQUATID" type="text" class="style8" id="addQUATID" size="5" /></td>
		<td><input name="addPROD" type="checkbox" class="style8" value="<%=p.getProdutoid()%>" /></td>
	</tr>

	<%}	%>
	</table>
		
	<div align="center">
	  <input type="submit" class="submit" value="Enviar Lista" onClick="javascript:validar()"/>
	  </div>
	</form>
	<% } %>
	<% if (request.getAttribute("produtosmarca") != null) {%>
	<form name="formAddItens" action="ItemLController" method="post">
	
<table width="676">
	<caption>
	<span class="style8"><strong>Resultados:</strong></span>
	</caption>

	<tr>
		<th width="118"></th>
		<th width="210"></th>
		<th width="60"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Valor</span></th>
		<th width="80"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Quantidade</span></th>
		<th width="60"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Adicionar</span></th>
	</tr>	

	<% for (Produto p : produtosmarca) { %>
		
	<tr>
	<td><input name="txtTITULO" type="hidden" value="<%=p.getProdutotitulo() %>"/></td>
	<td><input name="txtDESCRICAO" type="hidden" value="<%=p.getProdutodescricao()%>"/></td>
	<td><input name="txtVALOR" type="hidden" value="<%=p.getProdutovalor()%>"/></td>
    </tr>
	
	<tr>
		<td><img src="images\<%=p.getProdutoimagem()%>" width=100px class="style8"></td>
		<td><span class="style11 style8"><b><%=p.getProdutotitulo()%></b><br><%=p.getProdutodescricao()%></span></td>
     	<td><span class="style11 style8">R$ <%=p.getProdutovalor()%></span></td>		
		<td><input name="addQUATID" type="text" class="style8" id="addQUATID" size="5" /></td>
		<td><input name="addPROD" type="checkbox" class="style8" value="<%=p.getProdutoid()%>" /></td>
	</tr>

	<%}	%>
	</table>
		
	<div align="center">
	  <input type="submit" class="submit" value="Enviar Lista" onClick="javascript:validar()"/>
	  </div>
	</form>
	<%}	%>

	<% if (request.getAttribute("produtoscat") != null) {%>
	<form name="formAddItens" action="ItemLController" method="post">
<table width="676">
	<caption>
	<span class="style8"><strong>Resultados:</strong></span>
	</caption>

    <tr>
		<th width="118"></th>
		<th width="210"></th>
		<th width="60"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Valor</span></th>
		<th width="80"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Quantidade</span></th>
		<th width="60"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Adicionar</span></th>
	</tr>	

	
	<% for (Produto p : produtoscat) {%>
	
	<tr>
	<td><input name="txtTITULO" type="hidden" value="<%=p.getProdutotitulo() %>"/></td>
	<td><input name="txtDESCRICAO" type="hidden" value="<%=p.getProdutodescricao()%>"/></td>
	<td><input name="txtVALOR" type="hidden" value="<%=p.getProdutovalor()%>"/></td>
    </tr>
	
	<tr>
		<td><img src="images\<%=p.getProdutoimagem()%>" width=100px class="style8"></td>
		<td><span class="style11 style8"><b><%=p.getProdutotitulo()%></b><br><%=p.getProdutodescricao()%></span></td>
     	<td><span class="style11 style8">R$ <%=p.getProdutovalor()%></span></td>		
		<td><input name="addQUATID" type="text" class="style8" id="addQUATID" size="5" /></td>
		<td><input name="addPROD" type="checkbox" class="style8" value="<%=p.getProdutoid()%>" /></td>
	</tr>
   
	<%
		}
	%>
	
</table>
		
	  <div align="center">
	    <input type="submit" class="submit" value="Enviar Lista" onClick="javascript:validar()"/>
      </div>
	</form>
	
	<%
	}
%>

	<% if (request.getAttribute("produtossub") != null) { %>
	<form name="formAddItens" action="ItemLController" method="post">	
<table width="676">
	<caption>
	<span class="style8"><strong>Resultados:</strong></span>
	</caption>

	<tr>
		<th width="118"></th>
		<th width="210"></th>
		<th width="60"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Valor</span></th>
		<th width="80"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Quantidade</span></th>
		<th width="60"><span class="style5 style7 style8 style8 style7 style10 style8 style8">Adicionar</span></th>
	</tr>	
	
	<% for (Produto p : produtossub) { %>
	
	<tr>
	<td><input name="txtTITULO" type="hidden" value="<%=p.getProdutotitulo() %>"/></td>
	<td><input name="txtDESCRICAO" type="hidden" value="<%=p.getProdutodescricao()%>"/></td>
	<td><input name="txtVALOR" type="hidden" value="<%=p.getProdutovalor()%>"/></td>
    </tr>
	
	<tr>
		<td><img src="images\<%=p.getProdutoimagem()%>" width=100px class="style8"></td>
		<td><span class="style11 style8"><b><%=p.getProdutotitulo()%></b><br><%=p.getProdutodescricao()%></span></td>
     	<td><span class="style11 style8">R$ <%=p.getProdutovalor()%></span></td>		
		<td><input name="addQUATID" type="text" class="style8" id="addQUATID" size="5" /></td>
		<td><input name="addPROD" type="checkbox" class="style8" value="<%=p.getProdutoid()%>" /></td>
	</tr>

	<%
		}
	%>
   </table>
	
    
     <div align="center">
       <input type="submit" class="submit" value="Enviar Lista" onClick="javascript:validar()"/>
     </div>
	</form>
	<%
		}
	%>
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