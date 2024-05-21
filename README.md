## Projeto 2 (dois) - "Robot API REST"

- Autor Moisés Ademir Chiaretto
  
- Descrição das explicações de cada item da 'estrutura do projeto **"Robot API REST"** desenvolvido' em Robot Framework com a IDE PyCharm.

- Objetivo acessar um site Web, navegar pela página e realizar um pesquisa de um produto.

    - Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
 
    - Cenário 02: Cadastrar um usuário já existente


- Site oficial do Robot Framework:

  https://robotframework.org


  ![11_Logo_Robot_Frame_Work](https://github.com/moiseschiaretto/Robot_API/assets/84775466/d8c63b2c-fbe8-4731-9fef-0401c8aad228)



## Estrutura do Projeto "Robot API"


![03_Estrutura_Projeto](https://github.com/moiseschiaretto/Robot_API/assets/84775466/7dbbe213-5058-4ee6-af98-7487be90f1bf)




## Configurações Passo a Passo de um Projeto Robot Framework


**1. Pré-requisitos**

1.1. IDE VSCode ou IDE PyCharm instaladas

1.2. Instalar o Python

https://www.python.org/downloads/

![04_Python](https://github.com/moiseschiaretto/Robot_API/assets/84775466/82789a0a-38ac-463b-bd16-762ae36e9d7e)



**2. Instalação do Robot FrameWork**

2.1. Site: https://robotframework.org


![11_Logo_Robot_Frame_Work](https://github.com/moiseschiaretto/Robot_API/assets/84775466/41f00294-4cb2-4f81-8bec-3e334141266f)


2.2. Opção: GET STARTED

2.3. Opção: Install

2.4. Digitar no Terminal da IDE PyCharm / VSCode

```
pip install robotframework
```

2.5. Digitar no Terminal da IDE PyCharm / VSCode para atualização

```
pip install -U robotframework

```
2.6. Digitar no Terminal da IDE PyCharm / VSCode

```
robot --version
```

**3. Instalação da Library para Web Testing - HTTP RequestsLibrary (Python)**

3.1. Site: https://robotframework.org

3.2. Opção: RESOURCES

3.3. Opção: LIBRARIES

3.4. Opção: HTTP RequestsLibrary (Python)

https://robotframework.org/#resources

3.5. No "Github" rolar abaixo até encontrar "Install old version 0.9 (supports python 2.7+)"

3.6. Digitar no Terminal da IDE PyCharm / VSCode

```

pip install robotframework-requests

```

**4. Verificar as bibliotecas instaladas na máquina**

4.1. Digitar no Terminal da IDE PyCharm / VSCode

```

pip list

```


**Dica é criar o arquivo "requeriments.txt"**

Informar neste arquivo todas as bibliotecas a serem instaladas e as versões, exemplos:

robotframework>=7.0

robotframework-requests>=0.9.7


**5. API REST**

https://github.com/serverest/serverest?tab=readme-ov-file


**6. Documentação da API REST**

https://serverest.dev/#/Usu%C3%A1rios/post_usuarios



**7. Instalar o Plugin "Robot Framework Language Server"**

7.1. Instalar o Plugin "Robot Framework Language Server" na IDE PyCharm

7.2. Acessar o botão "Engrenagem" (canto superior direito) e a opção "Settings" na IDE PyCharm

![00_Botao_Configuracoes](https://github.com/moiseschiaretto/Robot_API/assets/84775466/40048cfd-fed7-4e3a-a676-4b019107de37)


7.3. Clicar em "Plugins"

7.4 Guia "Marketplace" pesquisar por "ROBOT"

7.5 Selecionar o Pluging **"Robot Framework Language Server"**

7.6 Clicar em **"Install"**


![02_Plugins_Robot_Framework](https://github.com/moiseschiaretto/Robot_API/assets/84775466/c1afe410-c1e4-4a80-a50f-0162c2954958)


7.7. Botão "OK"

7.8. Reiniciar (reset) a IDE PyCharm.


## Dica para configurar o "Tipo de Arquivo" na IDE PyCharm

**1.** Acessar o botão "Engrenagem" (canto superior direito) e a opção "Settings" na IDE PyCharm


![00_Botao_Configuracoes](https://github.com/moiseschiaretto/Robot_API/assets/84775466/0eb83fbf-afb1-44b5-a161-0fdadc5043d8)


**2.** Clicar em "Editor" >> "File Types" >> "Robot Framework" >> ""File name patterns".


![01_EDITOR_FILE_TYPES](https://github.com/moiseschiaretto/Robot_API/assets/84775466/527b7661-c704-4905-9ef4-59727a500b7c)




## Arquivo "tests.robot"

- Caminho do arquivo "api_users.robot":

**/Robot_API/tests**

- Contém os cenários de testes a serem executados.

    - Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
 
    - Cenário 02: Cadastrar um usuário já existente


```

*** Settings ***
Resource       ../api_testing/api_testing_users.resource

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    ${EMAIL_TEST}    201
    Conferir se o usuário foi cadastrado corretamente

Cenário 02: Cadastrar um usuário já existente
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    ${EMAIL_TEST}    201
    Repetir o cadastro do usuário
    Verificar se a API não permitiu o cadastro repetido

```


## Arquivo "api_testing_users.resource"

- Caminho do arquivo "api_testing_users.resource":

  **/Robot_Web/api_testing_users**

- Contém o código (keyword) do Robot Framework que será executado de acordo com o BDD, os cenários de testes.

```

*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections

*** Keywords ***
Criar um usuário novo
    ${email_aleatorio}  Generate Random String  4  chars=[LETTERS]
    ${email_aleatorio}  Convert To Lower Case    ${email_aleatorio}
    Set Test Variable    ${EMAIL_TEST}  ${email_aleatorio}@emailteste.com
    Log  ${EMAIL_TEST}

Cadastrar o usuário criado na ServeRest
    [Arguments]  ${email}  ${satus_code}
    ${body}  Create Dictionary
    ...      nome=Fulano da Silva
    ...      email=${email}
    ...      password=12345
    ...      administrador=true
    Log  ${body}

    Criar Sessão na ServeRest
    ${response}  POST On Session
    ...          alias=ServeRest
    ...          url=/usuarios
    ...          json=${body}
    ...          expected_status=${satus_code}
    Log  ${response.json()}
    Set Test Variable    ${RESPONSE}  ${response.json()}

Criar Sessão na ServeRest
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev  headers=${headers}

Conferir se o usuário foi cadastrado corretamente
        Log  ${RESPONSE}
        Dictionary Should Contain Item  ${RESPONSE}  message  Cadastro realizado com sucesso
        Dictionary Should Contain Key   ${RESPONSE}  _id

Repetir o cadastro do usuário
        Cadastrar o usuário criado na ServeRest    ${EMAIL_TEST}    400

Verificar se a API não permitiu o cadastro repetido
        Dictionary Should Contain Item    ${RESPONSE}    message    Este email já está sendo usado


```


## Executar os testes "api_users.robot"

- Caminho do arquivo "api_users.robot":

  **/Robot_API/tests**

**1. Executar toda a suite de testes, digitar o comando abaixo no terminal**

```

robot -d ./log ./tests/api_users.robot

```

**>> Inserir imagem de execução <<**



## Log dos Testes Executados - Report

- Relatório dos resultados dos testes executados, inclusive com estatística dos resultados e evidências de telas.

- Informar no navegador ou o caminho do **arquivo de log**, exemplo:

  **C:\Users\Moises\PycharmProjects\ROBOT_API\ROBOT_API\log\log.html**

- Outra forma é localizar e abrir o arquivo **log.html**

**>> Inserir imagem de log / report <<**
