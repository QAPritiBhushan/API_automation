*** Setting ***
Library    ExcelDataDriver


*** Test Cases ***
Add basic test result column
    ${extra columns} =    Create List    [Status]    [Log Message]    [Screenshot]    [Tags]
    Auto Insert Extra Columns    C:\Data_1\newData.xlsx    username    ${extra columns}