*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***

${URL-exo2}    https://academybugs.com/store/
${browser}    Chrome
${shoes-link}    https://academybugs.com/store/dnk-yellow-shoes/
${add-cart-btn}    //input[@value = 'ADD TO CART']
${cart-locator}    //*[@id="sq-content"]/div

*** Keywords ***

Open Shop Page
    Open Browser    ${URL-exo2}    ${browser}

Verify Cart Page Location
    Page Should Contain Element    ${cart-locator}
    Wait Until Element Is Visible    id:ec_cart_total

Verify Shoes Page Location
    Wait Until Element Is Visible    ${add-cart-btn}
    # Title Should Be    DNK Yellow Shoes - AcademyBugs.com

Verify Cart value
    ${value}=    Get Text    id:ec_cart_total
    Should Be Equal As Strings    ${value}    $152.99

