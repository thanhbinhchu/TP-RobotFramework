*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../resources/resource-binh.robot
Library    Telnet

*** Test Cases ***
Submit contact form
    Open Browser    ${URL bug academy}    ${BROWSER}
    Wait Until Element Is Not Visible    timeout = 5
    Input Text    id:first_name    string
    Input Text    name:last_name     string
    Input Text    name:email    email@gmail.fr
    Input Text    name:subject    Strings
    Input Text    id:input-message    text
    Click Button  id:submit-contact-form
    Sleep  3

    Title Should Be    Contact Us Form – AcademyBugs.com    

    
    Close Browser