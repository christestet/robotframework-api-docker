*** Settings ***
Library     RequestsLibrary

*** Test Cases ***
Test RequestsLibrary on Google.com
    ${response}=    GET    https://www.google.com
    log    ${response}
    Status Should Be    200
    Should Not Be Empty    ${response.content}