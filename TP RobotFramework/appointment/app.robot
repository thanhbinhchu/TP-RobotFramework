*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource-app.robot
Library    Telnet

*** Test Cases ***
Submit login with username&password
    Open Browser To Home Page   
    Wait Until Element Is Not Visible    timeout = 5
    Open LogIn Page

    Input Correct Username
    Input Correct Password
    
    Submit Login

    Close Browser

Submit login with wrong username
    Open Browser To Home Page
    Wait Until Element Is Not Visible    timeout = 5
    Open LogIn Page
    Input Incorrect Username
    Input Correct Password
    Submit Login

    Close Browser

Submit login with wrong password
    Open Browser To Home Page
    Wait Until Element Is Not Visible    timeout = 5
    Open LogIn Page
    Input Correct Username
    Input Incorrect Password
    Submit Login

    Close Browser

Submit login without username
    Open Browser To Home Page
    Wait Until Element Is Not Visible    timeout = 5
    Open LogIn Page
    Input Correct Password
    Submit Login

    Close Browser

Submit login without password
    Open Browser To Home Page
    Wait Until Element Is Not Visible    timeout = 5
    Open LogIn Page
    Input Correct Username
    Submit Login

    Close Browser

Page Appointment
    Open Browser To Home Page   
    Wait Until Element Is Not Visible    timeout = 5
    Open LogIn Page

    Input Correct Username
    Input Correct Password
    
    Submit Login

    Appointment Page Should Be Open

    Make an Appointment


Log Out
    Open Browser To Home Page   
    Wait Until Element Is Not Visible    timeout = 5
    Open LogIn Page

    Input Correct Username
    Input Correct Password
    
    Submit Login

    Submit Log Out





