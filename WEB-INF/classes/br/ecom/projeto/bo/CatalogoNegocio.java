package br.ecom.projeto.bo;

import java.util.List;

import br.ecom.projeto.imptdao.MySQLCatalogoDAO;
import br.ecom.projeto.interfaces.CatalogoDAO;
import br.ecom.projeto.models.Categoria;
import br.ecom.projeto.models.Produto;
import br.ecom.projeto.models.SubCategoria;

public class CatalogoNegocio {
	
	public List<Produto> getListad(String descricao){
		CatalogoDAO dao = new MySQLCatalogoDAO();
		return dao.obterDescricao(descricao);	
	}
	
	public List<Produto> getListam(String marca){
		CatalogoDAO dao = new MySQLCatalogoDAO();
		return dao.obterMarca(marca);
	}
		
	public List<Produto> getListac(Categoria cat){
		CatalogoDAO dao = new MySQLCatalogoDAO();
		return dao.obterCategoria(cat);
	}
	
	public List<Produto> getListas(SubCategoria sub){
		CatalogoDAO dao = new MySQLCatalogoDAO();
		return dao.obterSubcategorias(sub);	
	}


}
