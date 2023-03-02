*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../resources/resource-binh.robot
Resource           ../resources/ex3.locators.robot
Library    Telnet
Library    OperatingSystem

*** Test Cases ***
Search form
    Open Browser    ${URL BOOK}    ${BROWSER}

    Wait Until Element Is Not Visible    timeout = 5
    Input Text    id:searchBox    JavaScript
    Sleep  3

    # Run And Return Rc And Output    //*[@id="see-book-Learning JavaScript Design Patterns"]
    
    ${count results}=    Get Element Count    ${locator-results with images}     
    Should Be True    ${count results} == 4

    Title Should Be    DEMOQA

    Close Browser