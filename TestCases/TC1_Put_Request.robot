*** Settings ***
Library     RequestsLibrary
Library     os
Library     JSONLibrary
Library     Collections
Library     DataDriver  TestData/TestData.xlsx   sheet_name=Sheet2
Test Template    Mykeywork


*** Variables ***
${API_Base_Endpoint}     http://thetestingworldapi.com/
${city}         Delhi


*** Test Cases ***

TC001_Post_Request_Fetch_Response_Validate_Status_Code
    create session      API_Testing       ${API_Base_Endpoint}
    ${body}=        create dictionary      id=2673113       first_name=aaaaa   middle_name =Bhushan   last_name= okok     date_of_birth=12/12/1990
    ${header}=      create dictionary       Content-type=application/json

    ${response}=        put request        API_Testing         api/studentsDetails/2673113     data=${body}        headers=${header}
    log to console      ${response.status_code}
    log to console      ${response.content}
    ${codeInString}=        convert to string       ${response.status_code}
    ${Get_Response}=    GET On Session       API_Testing         api/studentsdetails/2673113
    log to console          ${Get_Response.content}





