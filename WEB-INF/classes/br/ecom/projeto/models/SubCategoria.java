package br.ecom.projeto.models;


public class SubCategoria {

	private int subcatid;
	private String subcatdescricao;
	private Categoria categoria;
	
	public SubCategoria(){}
	
	public SubCategoria(int subcatid, String subcatdescricao, Categoria categoria){
		this.subcatid = subcatid;
		this.subcatdescricao = subcatdescricao;
		this.categoria = categoria;
	}
	
	public int getSubcatid() {
		return subcatid;
	}
	public void setSubcatid(int subcatid) {
		this.subcatid = subcatid;
	}
	public String getSubcatdescricao() {
		return subcatdescricao;
	}
	public void setSubcatdescricao(String subcatdescricao) {
		this.subcatdescricao = subcatdescricao;
	}
	public Categoria getCategoria() {
		return categoria;
	}
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	
	

}