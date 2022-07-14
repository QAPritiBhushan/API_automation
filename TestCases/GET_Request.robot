*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     os
Library     Collections


*** Variables ***
${API_Base_Endpoint}     https://reqres.in/



*** Test Cases ***

TC001_Get_Request_Fetch_Response_Validate_Status_Code
    create session      API_Testing       ${API_Base_Endpoint}
    ${Get_Response}=    GET On Session       API_Testing         api/users/2
    ${StrinfResCode}=       convert to string                   ${Get_Response.status_code}
    should be equal         ${StrinfResCode}         200
    #validations
    ${JsonObj}=             to json     ${Get_Response.content}
    ${id}=                  Get value from json        ${JsonObj}       $.data.id
    ${id_string}            convert to string           ${id}
    should be equal         ${id_string}                [2]
    ${email}=                  Get value from json        ${JsonObj}       $.data.email
    ${email_string}            convert to string           ${email}
    should be equal         ${email_string}                ['ja2net.weaver@reqres.in']


