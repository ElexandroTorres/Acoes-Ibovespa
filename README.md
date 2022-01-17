# Ações Ibovespa

Aplicativo para realizar consulta dos valores das ações listadas no IBOSVESPA.

Telas do aplicativo.

<img src="screenshots/firstScreen.jpg" alt="Imagem da tela inicial" width="200"> <img src="screenshots/stock2Information.jpg" alt="Imagem mostrando a pesquisa do simbolo MGLU3, retornando informações sobre a ação da Magazine Luiza" width="200"> <img src="screenshots/stockInformation.jpg" alt="Imagem mostrando a pesquisa do simbolo BIDI4, retornando informações sobre a ação do Banco Inter" width="200">

Foi utilizada a HG Finance API para realizar as consultas das ações. Varios retornos diferentes da API foram tratados, fazendo com que a UI mostre ao usuario oque foi retornado.

Como a API permite buscas de ações mesmo que o nome completo do simbulo não seja digitado, essa tambem foi uma situação que necessitou de tratamento na hora de exibir os dados.

E por ultimo, algumas ações são achadas nas pesquisas porem com nenhum dado relacionado a elas, então nesse caso o usuario também é informado da situação.
