*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections



*** Variables ***
${API_Base_Endpoint}     http://thetestingworldapi.com/



*** Test Cases ***
TC001_Post_Request_Fetch_Response_Validate_Status_Code
    create session          API_Testing             ${API_Base_Endpoint}
    ${response}=            DELETE On Session       API_Testing     api/studentsDetails/232323
    log to console          ${response.status_code}
    log to console          ${response.content}
    ${codeInString}=        convert to string       ${response.status_code}
    ${body}=                convert to string       ${response.content}
    should contain          ${body}                 Delete  data success
    should be equal         ${codeInString}         200

