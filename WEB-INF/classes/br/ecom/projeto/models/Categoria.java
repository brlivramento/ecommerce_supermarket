package br.ecom.projeto.models;

public class Categoria {

	private int categoriaid;
	private String categoriadescricao;
	
	public Categoria(){ }
	
	public Categoria(int categoriaid, String categoriadescricao){
		this.setCategoriaid(categoriaid);
		this.setCategoriadescricao(categoriadescricao);
	}

	public void setCategoriadescricao(String categoriadescricao) {
		this.categoriadescricao = categoriadescricao;
	}

	public String getCategoriadescricao() {
		return categoriadescricao;
	}

	public void setCategoriaid(int categoriaid) {
		this.categoriaid = categoriaid;
	}

	public int getCategoriaid() {
		return categoriaid;
	}
	
	

}
