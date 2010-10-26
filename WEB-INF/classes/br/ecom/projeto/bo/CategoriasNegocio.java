package br.ecom.projeto.bo;

import java.util.List;

import br.ecom.projeto.imptdao.MySQLCategoriaDAO;
import br.ecom.projeto.imptdao.MySQLSubCategoriaDAO;
import br.ecom.projeto.interfaces.CategoriaDAO;
import br.ecom.projeto.interfaces.SubCategoriaDAO;
import br.ecom.projeto.models.Categoria;
import br.ecom.projeto.models.SubCategoria;

public class CategoriasNegocio {

	public List<SubCategoria> getSubCategoria(){
		SubCategoriaDAO dao = new MySQLSubCategoriaDAO();
		return dao.getSubCategoria();
	}

	public List<Categoria> getCategoria(){
		CategoriaDAO dao = new MySQLCategoriaDAO();
		return dao.getCategoria();
	}
}
