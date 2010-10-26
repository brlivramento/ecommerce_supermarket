package br.ecom.projeto.models;

import java.io.Serializable;

public class ItemC implements Serializable {

	private static final long serialVersionUID = 1L;

	private int itemcid;
	private int itemcquantidade;
	private Produto produto;
	private double total;
	private CarrinhoCompras pedido;

	public int getItemcid() {
		return itemcid;
	}
	public void setItemcid(int itemcid) {
		this.itemcid = itemcid;
	}
	public int getItemcquantidade() {
		return itemcquantidade;
	}
	public void setItemcquantidade(int itemcquantidade) {
		this.itemcquantidade = itemcquantidade;
	}
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	public CarrinhoCompras getPedido() {
		return pedido;
	}
	public void setPedido(CarrinhoCompras pedido) {
		this.pedido = pedido;
	}
	public void setTotal(double total2) {
		this.total = total2;
	}
	public double getTotal() {
		return total;
	}
}
