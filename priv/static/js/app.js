document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("produtoForm");
    const salvarBtn = document.getElementById("salvarBtn");
    const limparBtn = document.getElementById("limparBtn");
  
    const formatarPreco = (valor) => {
      return new Intl.NumberFormat("pt-BR", {
        style: "currency",
        currency: "BRL",
      }).format(valor);
    };
  
    const limparCampos = () => {
      form.reset();
    };
  
    const converterParaDecimal = (valor) => {
      return parseFloat(valor.replace(".", "").replace(",", "."));
    };
  
    const validarData = (data) => {
      const regex = /^(\d{2})\/(\d{2})\/(\d{4})$/;
      return regex.test(data);
    };
  
    salvarBtn.addEventListener("click", async (event) => {
      event.preventDefault();
  
      const descricao = form.descricao.value.trim();
      const preco = form.preco.value.trim();
      const validade = form.validade.value.trim();
      const cadastro = form.cadastro.value.trim();
  
      if (!descricao || !preco || !validade || !cadastro) {
        alert("Por favor, preencha todos os campos.");
        return;
      }
  
      if (!validarData(validade) || !validarData(cadastro)) {
        alert("As datas devem estar no formato dd/mm/yyyy.");
        return;
      }
  
      try {
        const produto = {
          descricao,
          preco: converterParaDecimal(preco),
          data_validade: validade,
          data_cadastro: cadastro,
        };
  
        const response = await axios.post("/api/produtos", produto);
  
        if (response.status === 201) {
          alert("Produto cadastrado com sucesso!");
          limparCampos();
        } else {
          alert("Erro ao cadastrar o produto. Tente novamente.");
        }
      } catch (error) {
        console.error("Erro ao cadastrar produto:", error);
        alert("Erro ao cadastrar o produto. Verifique os dados e tente novamente.");
      }
    });
  
    limparBtn.addEventListener("click", (event) => {
      event.preventDefault();
      limparCampos();
    });
  });
  