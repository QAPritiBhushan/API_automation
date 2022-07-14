*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections


*** Variables ***
${API_Base_Endpoint}     https://thetestingworldapi.com/


*** Test Cases ***
TC001_Post_Request_Fetch_Response_Validate_Status_Code
    create session      API_Testing     ${API_Base_Endpoint}
    ${body}=        create dictionary   first_name=mmmm0   middle_name=twobhushan  last_name=Tiyafuse    date_of_birth=12/12/2010
    ${header}=      create dictionary       Content-Type=application/json
    ${response}=        post request    API_Testing     api/studentsDetails     data=${body}    headers=${header}
    log to console      ${response.status_code}
    #log to console      ${response.content}

    #Validations
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      201
