package br.ecom.projeto.interfaces;

import java.util.List;

import br.ecom.projeto.models.CarrinhoCompras;

public interface CarrinhoComprasDAO {

	public void setPedido(CarrinhoCompras pedido);
	public List<CarrinhoCompras> getPedido();
}
