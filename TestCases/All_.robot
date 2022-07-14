*** Settings ***
Library     RequestsLibrary
Library     os
Library     JSONLibrary
Library     Collections
Library     DataDriver  TestData/TestData.xlsx   sheet_name=Sheet3
Test Template    Mykeywork



*** Test Cases ***

TC001_Post_Request_Fetch_Response_Validate_Status_Code using ${API_Base_Endpoint}



*** Keywords ***
Mykeywork
    [Arguments]     ${API_Base_Endpoint}    ${FirstName}    ${MiddleName}   ${LastName}  ${DoB}  ${Status_code_Post}
    create session      API_Testing       ${API_Base_Endpoint}
    ${body}=            create dictionary      first_name=${FirstName}   middle_name=${MiddleName}  last_name=${LastName}    date_of_birth=${DoB}
    ${header}=          create dictionary       Content-type=application/json,
    ${response}=        post request        API_Testing         api/studentsDetails     data=${body}        headers=${header}
    log to console      ${response.status_code}
    ${StrinfResCode}=       convert to string                   ${response.status_code}

    should be equal         ${StrinfResCode}         415




