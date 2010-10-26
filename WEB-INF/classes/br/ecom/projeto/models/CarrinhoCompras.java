package br.ecom.projeto.models;

import java.io.Serializable;
import java.util.List;

public class CarrinhoCompras implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int pedidoid;
	private String pedidodata;
	private double pedidototal;
	private String comentarios;
	private List<ItemC> itens;
	private Login login;
		
	public int getPedidoid() {
		return pedidoid;
	}
	public void setPedidoid(int pedidoid) {
		this.pedidoid = pedidoid;
	}
	
	public double getPedidototal() {
		return pedidototal;
	}
	public void setPedidototal(double pedidototal) {
		this.pedidototal = pedidototal;
	}
	public void setPedidodata(String pedidodata) {
		this.pedidodata = pedidodata;
	}
	public String getPedidodata() {
		return pedidodata;
	}
	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}
	public String getComentarios() {
		return comentarios;
	}
	public void setLogin(Login login) {
		this.login = login;
	}
	public Login getLogin() {
		return login;
	}
	public void setItens(List<ItemC> itens) {
		this.itens = itens;
	}
	public List<ItemC> getItens() {
		return itens;
	}
	
	
	

}
