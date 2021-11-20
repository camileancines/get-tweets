# get-tweets

Foi feita a leitura da documentação da API do Twitter e o estudo do JSON gerado pela URL de onde deve ser feita a requisição dos dados do usuário. 
o mesmo foi feito com a URL para fazer a requisição dos tuítes do usuário, usando a "user_id".

É necessário fazer a autenticação via BearerToken e meu intuito foi colocar o token gerado da minha conta de desenvolvedora para a aplicação rodar com isso já pronto, sem o usuário precisar faze-lo.

A partir da leitura dos JSON com o Postman, contruí a estrutura das models para User e Tweet.

A camada de network foi produzida com a intenção de chamar o dado de user_id a partir da @ do usuário no Twitter. Depois de capturar essa user_id, ela seria usada para fazer a requisição dos textos dos tuítes deste usuário definido.

As views foram feitas usando ViewCode.
