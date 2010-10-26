package br.ecom.projeto.models;

import java.io.Serializable;

public class Ofertas implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int ofertaid;
	private Produto produto;
	private String desconto;
	
	public Ofertas(){}
	
	public Ofertas(int ofertaid, Produto produto, String desconto){
		this.ofertaid = ofertaid;
		this.produto = produto;
		this.desconto = desconto;
	}
	
	public int getOfertaid() {
		return ofertaid;
	}
	public void setOfertaid(int ofertaid) {
		this.ofertaid = ofertaid;
	}
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	public String getDesconto() {
		return desconto;
	}
	public void setDesconto(String string) {
		this.desconto = string;
	}
	
	

}
