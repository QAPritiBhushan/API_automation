*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections


*** Variables ***
${API_Base_Endpoint}     http://thetestingworldapi.com/


*** Test Cases ***

TC001_Post_Request_Fetch_Response_Validate_Status_Code
    create session      API_Testing       ${API_Base_Endpoint}
    ${body}=            create dictionary      first_name=ooooppp   middle_name =pppp        last_name=kkkk
    ${header}=          create dictionary       Content-type=application/json
    ${response}=        POST On Session        API_Testing         api/studentsDetails     data=${body}        headers=${header}
    log to console      ${response.status_code}
    #log to console      ${response.content}

    #Validations
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}         200
    ${body}=            convert to string       ${response.content}
    should contain      ${body}       ooooppp
    should contain      ${body}       pppp
    should contain      ${body}       kkkk
    ${contentTypeValue}=    get from dictionary     ${response.headers}     content-type
    should be equal         ${contentTypeValue}     application/json


