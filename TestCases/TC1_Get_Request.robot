*** Settings ***
Library     RequestsLibrary


*** Variables ***
${API_Base_Endpoint}     http://thetestingworldapi.com/
${city}         Delhi


*** Test Cases ***

TC001_Get_Request_Fetch_Response_Validate_Status_Code
    create session      API_Testing       ${API_Base_Endpoint}
    ${Get_Response}=    GET On Session       API_Testing         api/studentsdetails/100001
    log to console          ${Get_Response}
    log to console          ${Get_Response.status_code}
    log to console          ${Get_Response.content}
    ${StrinfResCode}=       convert to string                   ${Get_Response.status_code}
    should be equal         ${StrinfResCode}         200
    ${json_resonse}=        set variable     ${Get_Response.content}
    log to console          ${json_resonse}





TC002_Get_Request_Fetch_Response_Validate_Status_Code
    create session      API_Testing       ${API_Base_Endpoint}
    ${Get_Response}=    GET On Session       API_Testing         api/studentsdetails/100012
    log to console          ${Get_Response}
    log to console          ${Get_Response.status_code}
    log          ${Get_Response.content}
    ${StrinfResCode}=       convert to string                   ${Get_Response.status_code}
    should be equal         ${StrinfResCode}         200


TC001_Get_Request_Fetch_Response_Validate_Status_Code
    create session      API_Testing       ${API_Base_Endpoint}
    ${Get_Response}=    GET On Session       API_Testing         api/studentsdetails
    log to console          ${Get_Response}
    log to console          ${Get_Response.status_code}
    log to console          ${Get_Response.content}
    ${StrinfResCode}=       convert to string                   ${Get_Response.status_code}
    #should not be equal         ${StrinfResCode}         200