package br.ecom.projeto.models;

import java.io.Serializable;


public class ItemL implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int itemid;
	private int itemquantidade;
	private double total;
	private Produto produto;
	
	
	public ItemL(){}
	
	public ItemL(int itemid, int itemquantidade, double total, Produto produto){
		this.itemid = itemid;
		this.itemquantidade = itemquantidade;
		this.total = total;
		this.produto = produto;
	}

	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public int getItemquantidade() {
		return itemquantidade;
	}

	public void setItemquantidade(int itemquantidade) {
		this.itemquantidade = itemquantidade;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getTotal() {
		return total;
	}
}
