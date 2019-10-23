# Teste em Ruby - Algoritmo de Dijkstra para Matching em Vagas

## Descrição

Um recrutador precisa analisar as candidaturas recebidas para vagas de emprego. Dado o grande volume de candidaturas em algumas vagas, olhar um a um seria um trabalho muito demorado.

Para resolver este problema foi criada uma API em que o recrutador encontrará recursos para criação de vagas, pessoas e relacionar pessoas a vagas.

- Entre pessoas e vagas, há uma respectiva distância e ela é parte do critério de análise.

- Há pré-requisitos de experiência em vagas e isto é parte do critério de análise.

- Cada pessoa tem sua respectiva experiência e isto é parte do critério de análise.

De acordo com as informações coletadas, há um recurso para o recrutador analisar um ranking de candidatos para cada vaga. Para a criação do ranking, é necessária a computação dos dados criteriosos.

--------------------------------
* [Processo Seletivo Vagas - Engenheiro(a) de Software](https://github.com/VAGAScom/desafio-tecnico/blob/master/desafio-tecnico.md) 
--------------------------------

## Pré Requisitos

- Docker
- Docker Compose

## Começando

Estas instruções vão servir para que você execute a aplicação em sua máquina local.

## Instalação

Primeiro será necessário executar o docker na raiz da aplicação:

```
docker-compose up --build
```

Assim que a aplicação estiver pronta, precisaremos inicializar o banco de dados:

```
docker-compose exec web rails db:create db:migrate
```

Com a aplicação em execução e o banco inicializado e estruturado, precisamos agora seguir os próximos passos. 

## Rodando os testes

Para garantir o bom funcionamento da aplicação, rote os testes:

```
docker-compose exec web rails test
```

## Endpoints

**1 - Endpoint para cadastrar vagas de emprego**

### Request

```
POST http://localhost:9000/v1/vagas
```
 * Body:
```
{
    "empresa": "Teste",
    "titulo": "Vaga teste",
    "descricao": "Criar os mais diferentes tipos de teste",
    "localizacao": "A",
    "nivel": 3
}
```
### Response

**O response para esta função será definido por você e faz parte da avaliação.**

```
{
    "status": "success",
    "message": "Vaga criada!",
    "data": {
        "id": 1,
        "empresa": "Empresa Teste",
        "titulo": "Vaga teste",
        "descricao": "Criar os mais diferentes tipos de teste",
        "localizacao": "E",
        "nivel": 5
    }
}
```

**2. Criar um endpoint para cadastrar pessoas**

### Request

```
POST http://localhost:9000/v1/pessoas
```
 * Body:
```
{
    "nome": "John Doe",
    "profissao": "Engenheiro de Software",
    "localizacao": "C",
    "nivel": 2
}
```
### Response

**O response para esta função será definido por você e faz parte da avaliação.**

```
{
    "status": "sucess",
    "message": "Pessoa criada!",
    "data": {
        "id": 2,
        "nome": "John Doe",
        "profissao": "Engenheiro de Software",
        "localizacao": "C",
        "nivel": 2
    }
}
```

**3. Registrar candidatura de uma pessoa em uma vaga**

*Neste endpoint você deverá registar a candidatura do candidato para a vaga em questão.*

### Request

```
POST http://localhost:9000/v1/candidaturas
```
 * Body:
```
{
    "id_vaga": 1,
    "id_pessoa": 2
}
```
### Response

**O response para esta função será definido por você e faz parte da avaliação.**

```
{
    "status": "success",
    "message": "Candidatura criada!",
    "data": {
        "id": 1,
        "pessoa": {
            "id": 2,
            "nome": "John Doe",
            "profissao": "Engenheiro de Software",
            "localizacao": "C",
            "nivel": 2
        },
        "vaga": {
            "id": 1,
            "empresa": "Empresa Teste",
            "titulo": "Vaga teste",
            "descricao": "Criar os mais diferentes tipos de teste",
            "localizacao": "E",
            "nivel": 5
        },
        "score": 62
    }
}
```

**4. Criar um endpoint para retornar os candidatos de uma vaga, ordenados pelo score (de forma decrescente)**

### Request

```
GET: http://localhost:9000/v1/vagas/1/candidaturas/ranking
```
### Response

```
{
    "data": [
        {
            "nome": "John Doe",
            "profissao": "John Doe",
            "localizacao": "John Doe",
            "nivel": "John Doe",
            "score": 62
        },
        {
            "nome": "John Doe",
            "profissao": "John Doe",
            "localizacao": "John Doe",
            "nivel": "John Doe",
            "score": 62
        }
    ]
}
```

## Erros em requisições

### 404 - Not Found

Requisições `GET` que não forem encontradas, terão como resposta:

```
{
    "status": "error",
    "errors": {
        "response": "Ops! Este estado não existe!."
    }
}
```

### 422 - Unprocessable Entity

Requisições `POST` com dados inválidos terão o seguinte retorno:

```
{
    "status": "error",
    "errors": {
        "location": [
            "O dado {x} é obrigatório!",
            ....
        ]
    }
}
```

## Criado com

* [Ruby on Rails](https://rubyonrails.org) - O framework web utilizado 
* [Docker](https://www.docker.com/) - O software de contêiner utilizado
* [PostgreSQL](https://www.postgresql.org/) - O SGBD utilizado

## Autores

* **Kaio Teixeira** - *Initial work* - [kteixeira](https://github.com/kteixeira)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## Licença

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
