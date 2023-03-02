*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${URL bug academy}    https://academybugs.com/contact-us-form/   
${LOGIN URL}    https://academybugs.com/
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode

${URL BOOK}    https://demoqa.com/books

${URL CHECKBOX}    https://demoqa.com/checkbox


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL bug academy}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${LOGIN URL}
    Title Should Be    Welcome Page
