*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource-orange.robot
Library    Telnet

*** Test Cases ***
Submit login with username&password
    Open Browser To Login Page   
    Wait Until Element Is Not Visible    timeout = 5
    Input Username
    Input Password-Orange
    Submit Credentials
    Sleep  3

    Title Should Be    OrangeHRM   
    Close Browser

Submit login with wrong username
    Open Browser To Login Page
    Wait Until Element Is Not Visible    timeout = 5
    Input Wrong Username
    Input Password-Orange
    Submit Credentials

    Close Browser

Submit login with wrong password
    Open Browser To Login Page
    Wait Until Element Is Not Visible    timeout = 5
    Input Username
    Input Wrong Password-Orange
    Submit Credentials

    Close Browser

Submit login without username
    Open Browser To Login Page
    Wait Until Element Is Not Visible    timeout = 5
    Input Password-Orange
    Submit Credentials

    Close Browser

Submit login without password
    Open Browser To Login Page
    Wait Until Element Is Not Visible    timeout = 5
    Input Username
    Submit Credentials

    Close Browser

Dashboard Admin
    Open Browser To Login Page   
    Wait Until Element Is Not Visible    timeout = 5
    Input Username
    Input Password-Orange
    Submit Credentials
    Sleep  3
    Title Should Be    OrangeHRM

    Check NavBar
    
    NavBar Admin

    Close Browser

Add Employee in Page PIM
    Open Browser To Login Page   
    Wait Until Element Is Not Visible    timeout = 5
    Input Username
    Input Password-Orange
    Submit Credentials
    Sleep  3
    Title Should Be    OrangeHRM
    
    NavBar PIM
    Wait Until Element Is Not Visible    timeout = 5

    Add Employee

    Close Browser

Log Out
    Open Browser To Login Page   
    Wait Until Element Is Not Visible    timeout = 5
    Input Username
    Input Password-Orange
    Submit Credentials
    Sleep  3
    Title Should Be    OrangeHRM
    
    NavBar Log Out

