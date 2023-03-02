*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../resources/ex2ressources.robot
Library    XML

*** Test Cases ***
Exo 2
    Open Shop Page
    Click link    ${shoes-link}
    Verify Shoes Page Location
    Click Button    ${add-cart-btn}
    Verify Cart Page Location
    Verify Cart value
    Close Browser