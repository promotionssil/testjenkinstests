*** Settings ***
Documentation   validate login form
Library      SeleniumLibrary
Test Teardown   Close Browser Session
Suite Setup     open browser with mortgage payement url
#Ressource

*** Variables ***
${error_message}=   css:.alert.alert-danger.col-md-12


*** Test Cases ***
Validate Unsuccesful Login
    open browser with mortgage payement url
    Fill the login form
    wait until it click and display login error message
    verify Error Message is correct
    Close Browser Session


*** Keywords ***
open browser with mortgage payement url
    Create Webdriver    Chrome     executable_path=C:/Users/dave/Downloads/robot chrome driver/chromedriver
    GO To   https://www.rahulshettyacademy.com/loginpagePractise/

Fill the login form
    [Tags]  test15
    Input Text         id:username     ahmed@gmail.com
    Input Password     id:password     123456
    Click Button       id:signInBtn


wait until it click and display login error message
    Wait Until Element Is Visible   ${error_message}


verify Error Message is correct
#    ${result}=   Get Text    ${error_message}
#    Should Be Equal As Strings  ${result}     Incorrect username/password.
    Element Text Should Be    ${error_message}       Incorrect username/password.





