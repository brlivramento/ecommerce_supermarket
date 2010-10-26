package br.ecom.projeto.interfaces;

import java.util.List;

import br.ecom.projeto.models.Categoria;
import br.ecom.projeto.models.Produto;
import br.ecom.projeto.models.SubCategoria;

public interface CatalogoDAO {

	public List<Produto> obterMarca(String marca);
	public List<Produto> obterDescricao(String descricao);
	public List<Produto> obterCategoria(Categoria cat);
	public List<Produto> obterSubcategorias(SubCategoria sub);

}
