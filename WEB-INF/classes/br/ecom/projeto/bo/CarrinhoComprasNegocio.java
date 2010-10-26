package br.ecom.projeto.bo;

import java.util.List;

import br.ecom.projeto.imptdao.MySQLCarrinhoComprasDAO;
import br.ecom.projeto.interfaces.CarrinhoComprasDAO;
import br.ecom.projeto.models.CarrinhoCompras;

public class CarrinhoComprasNegocio {

	public void setPedido(CarrinhoCompras pedido){
		CarrinhoComprasDAO dao = new MySQLCarrinhoComprasDAO();
		dao.setPedido(pedido);		
	}
	
	public List<CarrinhoCompras> getPedido(){
		CarrinhoComprasDAO dao = new MySQLCarrinhoComprasDAO();
		return dao.getPedido();
	}
}
