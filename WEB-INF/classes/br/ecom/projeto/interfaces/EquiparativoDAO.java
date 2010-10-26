package br.ecom.projeto.interfaces;

import java.util.List;

import br.ecom.projeto.models.CarrinhoCompras;
import br.ecom.projeto.models.Produto;

public interface EquiparativoDAO {
	
	public List<CarrinhoCompras> obterId (int login);
	public List<CarrinhoCompras> obterQuantidadeItens(int ccompras);
	public List<CarrinhoCompras> obterComentarios(int ccompras);
	public List<Produto> obterPrecoMaisBarato(int ccompras);
	public List<Produto> obterPrecoMaisCaro(int ccompras);
	public List<CarrinhoCompras> obterTotal(int ccompras);

}
