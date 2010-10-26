package br.ecom.projeto.bo;

import java.util.List;

import br.ecom.projeto.imptdao.MySQLEquiparativoDAO;
import br.ecom.projeto.interfaces.EquiparativoDAO;
import br.ecom.projeto.models.CarrinhoCompras;
import br.ecom.projeto.models.Produto;

public class EquiparativoNegocio {

	public List<CarrinhoCompras> obterId (int login){
		EquiparativoDAO dao = new MySQLEquiparativoDAO();
		return dao.obterId(login);
	}
	public List<CarrinhoCompras> obterQuantidadeItens(int ccompras){
		EquiparativoDAO dao = new MySQLEquiparativoDAO();
		return dao.obterQuantidadeItens(ccompras);
	}
	public List<CarrinhoCompras> obterComentarios(int ccompras){
		EquiparativoDAO dao = new MySQLEquiparativoDAO();
		return dao.obterComentarios(ccompras);
	}

	public List<Produto> obterPrecoMaisBarato(int ccompras){
		EquiparativoDAO dao = new MySQLEquiparativoDAO();
		return dao.obterPrecoMaisCaro(ccompras);
	}
	public List<Produto> obterPrecoMaisCaro(int ccompras){
		EquiparativoDAO dao = new MySQLEquiparativoDAO();
		return dao.obterPrecoMaisCaro(ccompras);
	}
	public List<CarrinhoCompras> obterTotal(int ccompras){
		EquiparativoDAO dao = new MySQLEquiparativoDAO();
		return dao.obterTotal(ccompras);
	}
	
}