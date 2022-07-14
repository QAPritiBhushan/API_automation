*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary


*** Variables ***
${API_Base_Endpoint}     http://restapi.demoqa.com/customer


*** Test Case ***
TC001_Post_Request_Fetch_Response_Validate_Status_Code

    #Max retries exceeded
    create session       API_Testing      ${API_Base_Endpoint}
    ${body}=        create dictionary       FirstName=madhuri       LastName=two     UserName=Tiyafse        Password=12/12/1990
    ${header}=      create dictionary       Content-type=application/json
    ${response}=        post request       API_Testing      /register      data=${body}     headers=${header}

    log to console     ${response.status_code}
    log to console     ${response.content}
