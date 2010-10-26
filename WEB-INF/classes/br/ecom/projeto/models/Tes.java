package br.ecom.projeto.models;

import java.util.List;

import br.ecom.projeto.bo.EquiparativoNegocio;

public class Tes {

	public static void main(String[] args) {

		EquiparativoNegocio bo = new EquiparativoNegocio();
		
		int p1 = 11;
		int p2 = 12;
		
		
		List<Produto> lista3 = bo.obterPrecoMaisBarato(p1);
	//	double maisb1 = 0;
	//	String imaisb1 = null;
		for(Produto p : lista3) {
	//		imaisb1 = ;
	//		maisb1 = ;	
			System.out.println(p.getProdutotitulo());
			System.out.println(p.getProdutovalor());
		}

		List<Produto> lista4 = bo.obterPrecoMaisBarato(p2);
	//	double maisb2 = 0;
	//	String imaisb2 = null;
		for(Produto p : lista4) {
	//		imaisb2 = p.getProdutotitulo();
	//		maisb2 = p.getProdutovalor();
			System.out.println(p.getProdutotitulo());
			System.out.println(p.getProdutovalor());
		}
		
		
		
	}

}
