package com.exemplo.produto;

import java.io.Serializable;

import com.exemplo.model.Produto;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Named;
import jakarta.ws.rs.client.Client; 
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Named
@RequestScoped
public class ProdutoBean implements Serializable {

    private static final String ENDPOINT_URL = "http://localhost:4000/api/produtos";
    private String descricao; 
    private Double preco; 

    // Getters e Setters
    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
    public Double getPreco() { return preco; }
    public void setPreco(Double preco) { this.preco = preco; }

    @SuppressWarnings("ConvertToTryWithResources")
    public void gravar() {
        try {
            Client client = ClientBuilder.newClient();

            if (descricao == null || descricao.trim().isEmpty() || preco == null) {
                
                return;
            }

            Produto produto = new Produto();
            produto.setDescricao(descricao); 
            produto.setPreco(preco);

            Entity<Produto> entity = Entity.entity(produto, MediaType.APPLICATION_JSON);

            Response response = client.target(ENDPOINT_URL)
                    .request()
                    .post(entity);

            if (response.getStatus() == 201) {
                
                limpar();
            } else {
                
            }

            client.close();

        } catch (Exception e) {
            
        }
    }

    private void limpar() {
        this.descricao = null;
        this.preco = null;
    }

}