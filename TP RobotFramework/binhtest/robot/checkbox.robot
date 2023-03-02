*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../resources/resource-binh.robot
Library    Telnet
Library    OperatingSystem

*** Test Cases ***
Search form
    Open Browser    ${URL CHECKBOX}    ${BROWSER}
    
    Wait Until Element Is Not Visible    timeout = 5   

    Checkbox Should Be Selected    //*[@class="rct-icon rct-icon-check"]
    
    Sleep  3
    Run And Return Rc And Output    id:result 

    

    Checkbox Should Not Be Selected    //*[@class="rct-icon rct-icon-uncheck"]
    Sleep    3
    Run And Return Rc And Output    ${None}

    Close Browser