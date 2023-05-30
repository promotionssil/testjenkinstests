*** Settings ***
Documentation   validate login form
Library      SeleniumLibrary
Test Setup    open browser with mortgage payement url
Test Teardown   Close Browser Session
Resource       resources.robot


*** Variables ***
${error_message}=   css:.alert.alert-danger.col-md-12
${home_page_message}=       //h1[@class='my-4']

*** Test Cases ***
Validate Unsuccesful Login

    Fill the login form
    wait until it click and display login error message
    verify Error Message is correct
    Close Browser Session

Validate succesful Login
    [Tags]  Validlogin 
    Fill the login form
    wait until it click and display login home
    verify home page
    verify product items
    
    


*** Keywords ***


Fill the login form
    Input Text         id:username     ${User_name}
    Input Password     id:password     ${Password}
    Click Button       id:signInBtn


wait until it click and display login error message
    Wait Until Element Is Visible   ${error_message}
wait until it click and display login home
    Wait Until Element Is Visible   ${home_page_message}

verify Error Message is correct
#    ${result}=   Get Text    ${error_message}
#    Should Be Equal As Strings  ${result}     Incorrect username/password.
    Element Text Should be    ${error_message}       Incorrect username/password.
verify home page
    Element Text Should be    ${home_page_message}       Shop Name

verify product items
    @{items}=   create List     iphone X    Samsung Note 8      Nokia Edge  Blackberry
    ${pageitmes}=   Get WebElements    css:.card-title a
   
    FOR  ${item}    IN  @{pageitmes}
    LOG   ${item.text}
    END


