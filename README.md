## Projeto 2 (dois) - "Robot API REST"

- Autor Moisés Ademir Chiaretto
  
- Descrição das explicações de cada item da 'estrutura do projeto **"Robot API REST"** desenvolvido' em Robot Framework com a IDE PyCharm.

- O objetivo é realizar um cadastro de usuário via API REST com o **método POST**, aguardando **o status code =201 "Cadastro com sucesso"**, e na sequência tentar cadastrar o mesmo usuário com o mesmo método, aguardando **o status code = 400   "E-mail já cadastrado"**. E após realizar uma pesquisa especifica do usuário cadastrado com o **método GET ID**, aguardando **o status code = 200    "Usuário encontrado".**

    - Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
 
    - Cenário 02: Cadastrar um usuário já existente
 
    - Cenário 03: Consultar os dados de um novo usuário



![BDD_SEM_E_COM_FALHA](https://github.com/moiseschiaretto/Robot_API/assets/84775466/df39eecb-4be3-4e79-af27-abe5612d55e6)

<br>

## Estrutura do Projeto "Robot API"


![03_Estrutura_Projeto](https://github.com/moiseschiaretto/Robot_API/assets/84775466/7dbbe213-5058-4ee6-af98-7487be90f1bf)


***

## Configurações Passo a Passo de um Projeto Robot Framework

<br>

|Python       |IDE PyCharm		|Robot          |API          |JSON          |
|-------------|---------------|---------------|-------------|--------------|
| ![04_Python](https://github.com/moiseschiaretto/Robot_API/assets/84775466/126bd197-35be-487d-9f0a-4002890de8e1) | <img width="194" alt="PyCharm" src="https://github.com/moiseschiaretto/Robot_API/assets/84775466/e3ae4558-681b-44d0-ac54-b0e79cde3941"> | ![11_Logo_Robot_Frame_Work](https://github.com/moiseschiaretto/Robot_API/assets/84775466/526870ab-6b12-4476-9952-3c1d8b7eca4f) | ![10_API_REST](https://github.com/moiseschiaretto/Robot_API/assets/84775466/60d67d8f-31e1-4701-86ad-e5d9f154960b) | <img width="164" alt="04_JSON" src="https://github.com/moiseschiaretto/Robot_API/assets/84775466/85688582-1624-4f7a-9573-bd049750b5a2"> |
<br>


**1. Pré-requisitos**

1.1. IDE VSCode ou IDE PyCharm instaladas

1.2. Instalar o Python

https://www.python.org/downloads/

![04_Python](https://github.com/moiseschiaretto/Robot_API/assets/84775466/82789a0a-38ac-463b-bd16-762ae36e9d7e)
<br>

1.3. Ao instalar o Python selecionar as seguintes opções para o Python ser adicionar as Variáveis de Ambiente do Sistema Operacional Windows.

- Use admin privileges when installing py.exe

- Add python.exe to PATH

<br>
<br>

<img width="493" alt="04_Python_PATH_ADD_VARIAVEIS_AMBIENTE_SO" src="https://github.com/moiseschiaretto/Robot_API/assets/84775466/7c1fd713-6fdf-43b1-80a0-43a4379298cd">

<br>
<br>

<img width="409" alt="04_PATH_Duas_PYTHON312_SCRIPTS" src="https://github.com/moiseschiaretto/Robot_API/assets/84775466/88581bee-fe3d-4317-91cf-fcfb090abee2">

<br>
<br>

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

```

robotframework>=7.0

robotframework-requests>=0.9.7

```


**5. API REST**

https://github.com/serverest/serverest?tab=readme-ov-file


**6. Documentação da API REST**

https://serverest.dev/#/Usu%C3%A1rios/post_usuarios


**- Método POST**

![09_API_POST](https://github.com/moiseschiaretto/Robot_API/assets/84775466/c6db26e1-8ba1-477e-91e8-6ece6efef36b)


**- Status Code = 201   "Cadastro com sucesso"**

**- Status Code = 400   "E-mail já cadastrado"**


![10_API_POST](https://github.com/moiseschiaretto/Robot_API/assets/84775466/850cced0-24f3-42ca-8fb2-7676ddc9221a)


**- Método GET ID**

**- Status Code = 200    "Usuário encontrado"**


![11_GET_ID](https://github.com/moiseschiaretto/Robot_API/assets/84775466/2574c74d-d893-492d-aece-c94b36fc8fa3)




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
 
    - Cenário 03: Consultar os dados de um novo usuário



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

Cenário 03: Consultar os dados de um novo usuário
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    ${EMAIL_TEST}    201
    Consultar os dados do novo usuário
    Conferir os dados retornados

```


## Arquivo "api_testing_users.resource"

- Caminho do arquivo "api_testing_users.resource":

  **/Robot_Web/api_testing_users**

- Contém o TDD, ou seja, o código (keyword) do Robot Framework que será executado de acordo com o BDD, os cenários de testes.



![17_TDD](https://github.com/moiseschiaretto/Robot_API/assets/84775466/82ba3d85-e584-4ed6-952a-f69ad962aefc)



```

*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections

*** Keywords ***
Criar um usuário novo
    ${email_aleatorio}  Generate Random String  4  chars=[LETTERS]
    ${email_aleatorio}  Convert To Lower Case    ${email_aleatorio}
    Set Global Variable    ${EMAIL_TEST}  ${email_aleatorio}@emailteste.com
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
    Log  ${RESPONSE}

Criar Sessão na ServeRest
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev  headers=${headers}

Conferir se o usuário foi cadastrado corretamente
    Log  ${RESPONSE}
    Dictionary Should Contain Item  ${RESPONSE}  message  Cadastro realizado com sucesso
    Dictionary Should Contain Key   ${RESPONSE}  _id
    Set Global Variable  ${ID_USER}   ${RESPONSE["_id"]}
    Log  ${ID_USER}

Repetir o cadastro do usuário
    Cadastrar o usuário criado na ServeRest    ${EMAIL_TEST}    400

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${RESPONSE}    message    Este email já está sendo usado

Consultar os dados do novo usuário
    ${response_get}  GET On Session  alias=ServeRest  url=/usuarios/${ID_USER}

    # Obtendo as propriedades do objeto response
    Log   ${ID_USER}
    Log   ${response_get.status_code}
    Log   ${response_get.reason}
    Log   ${response_get.headers}
    Log   ${response_get.elapsed}
    Log   ${response_get.text}
    Log   ${response_get.json()}

    Set Test Variable  ${RESP_GET}  ${response_get.json()}
    Log   ${RESP_GET}

Conferir os dados retornados
    Dictionary Should Contain Item    ${RESP_GET}    nome            Fulano da Silva
    Dictionary Should Contain Item    ${RESP_GET}    email           ${RESP_GET["email"]}
    Dictionary Should Contain Item    ${RESP_GET}    password        12345
    Dictionary Should Contain Item    ${RESP_GET}    administrador   true
    Dictionary Should Contain Item    ${RESP_GET}    _id             ${RESP_GET["_id"]}


```


## Executar os testes "api_users.robot"

- Caminho do arquivo "api_users.robot":

  **/Robot_API/tests**

**1. Executar toda a suite de testes, digitar o comando abaixo no terminal**

```

robot -d ./log ./tests/api_users.robot

```


![06_Execucao_OK](https://github.com/moiseschiaretto/Robot_API/assets/84775466/949aae2e-704c-40b8-84a6-ce190764a2c5)




## Log dos Testes Executados - Report

- Relatório dos resultados dos testes executados, inclusive com estatística dos resultados e evidências de telas.

- Informar no navegador ou o caminho do **arquivo de log**, exemplo:

  **C:\Users\Moises\PycharmProjects\ROBOT_API\ROBOT_API\log\log.html**

- Outra forma é localizar e abrir o arquivo **log.html**



![07_LOG](https://github.com/moiseschiaretto/Robot_API/assets/84775466/007be9aa-8502-427d-a00e-d1e3a13cb1ea)



![08_LOG](https://github.com/moiseschiaretto/Robot_API/assets/84775466/80fd9443-0773-4449-b683-86bcbac978e7)



![08_REPORT](https://github.com/moiseschiaretto/Robot_API/assets/84775466/22e2996f-243b-4f10-af52-2bdafe7e1a5f)



