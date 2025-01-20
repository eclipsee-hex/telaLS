# Tela

Requirements: 

Elixir -> Version 1.18.1
Erlang -> Version OTP 27
NodeJS -> 22.13.0
Postgres -> 17.2-3 (configurar a senha mestre como masterkey)

Ao baixar o projeto com os requirements configurados executar na seguinte ordem no diretório do projeto:

1. mix deps.get (este comando instalara todas as dependencias configurads no mix.ex

2. mix ecto.create (este comando criará o banco de dados)

3. mix ecto.migrate (executara todas as migrations para criar a tabela)

4. mix phx.server (inicia o servidor phoenix no endereço: http://127.0.0.1:4000)

Este Projeto é basicamente uma tela de cadastro de produtos, integrado com o backend desenvolvido em Elixir, em cima do framework Phoenix.
Todo o backend foi testado e validado o funcionamento. Desenvolvi uma aplicação basica utilizando o Javascript para interagir com o index.html, porém como não dispunha de tempo habil para testar a aplicação inteira, não consegui validar se de fato os botões na pagina estão funcionando corretamente. 


Este é a estrutura basica dos endpoints disponiveis, para o caso de quiserem testar o backend, podendo utilizar o Postman ou Insomnia.
Para realizar um cadastro de produto o endpoint utilizado é o /api/produtos, no metodo POST, para listar todos os produtos utilizar o mesmo endpoint no metodo GET, para resgatar um produto pelo ID, utilizar da seguinte forma: /api/produtos/id.

Sempre o request deve ser feito como application/json e a resposta do server será em JSON.

Eu não tenho tanta vivencia com FrontEnd e isso não me permitiu ter a condição de ajustar e testar adequadamente a interação do front com o backend, mas o backend está funcional e pode mostrar um pouco da minha noção de Logica de Programação.


  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
