package br.ecom.projeto.models;

public class Produto {


	private static final long serialVersionUID = 1L;

	private int produtoid;
	private String produtotitulo;
	private String produtodescricao;
	private String produtoimagem;
	private double produtovalor;

	public Produto(){}

	public Produto(int produtoid, String produtotitulo, String produtodescricao,  String produtoimagem, double produtovalor){
		this.produtoid = produtoid;
		this.produtotitulo = produtotitulo;
		this.produtodescricao = produtodescricao;
		this.produtoimagem = produtoimagem;
		this.produtovalor = produtovalor;
	}

	public int getProdutoid() {
		return produtoid;
	}

	public void setProdutoid(int produtoid) {
		this.produtoid = produtoid;
	}

	public String getProdutodescricao() {
		return produtodescricao;
	}

	public void setProdutodescricao(String produtodescricao) {
		this.produtodescricao = produtodescricao;
	}

	public double getProdutovalor() {
		return produtovalor;
	}

	public void setProdutovalor(double produtovalor) {
		this.produtovalor = produtovalor;
	}

	public void setProdutotitulo(String produtotitulo) {
		this.produtotitulo = produtotitulo;
	}

	public String getProdutotitulo() {
		return produtotitulo;
	}

	public void setProdutoimagem(String produtoimagem) {
		this.produtoimagem = produtoimagem;
	}

	public String getProdutoimagem() {
		return produtoimagem;
	}
	
	
}
