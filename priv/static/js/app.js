document.getElementById("saveButton").addEventListener("click", function(event) {

  event.preventDefault();


  const descricao = document.getElementById("descricao").value;
  let preco = document.getElementById("preco").value;
  const validade = document.getElementById("validade").value;
  const cadastro = document.getElementById("cadastro").value;

 
  preco = formatPrecoToBR(preco);


  const productData = {
    descricao: descricao,
    preco: preco,
    validade: validade,
    cadastro: cadastro
  };

 
  fetch("/api/produtos", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(productData)  
  })
  .then(response => response.json())  
  .then(data => {
    console.log("Produto salvo:", data);
    alert("Produto salvo com sucesso!");
  })
  .catch(error => {
    console.error("Erro ao salvar produto:", error);
    alert("Erro ao salvar produto.");
  });
});

// 
function formatPrecoToBR(value) {
  // 
  value = value.replace(/[^\d,]/g, "");

  
  value = value.replace(",", ".");

  
  let formattedValue = parseFloat(value).toFixed(2);

  
  return formattedValue.replace(".", ",");
}
