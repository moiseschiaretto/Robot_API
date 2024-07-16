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
