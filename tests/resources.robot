*** Settings ***
Documentation       training course
...  using selenium and robot framework
Library     SeleniumLibrary


*** Variables ***
${User_name}=           rahulshettyacademy
${Password}=            learning
${URL}=     https://www.rahulshettyacademy.com/loginpagePractise/



*** Keywords ***
open browser with mortgage payement url
    Create Webdriver    Chrome     executable_path=C:/Users/dave/Downloads/robot chrome driver/chromedriver
    GO To           ${URL}



Close Browser Session
    Close Browser