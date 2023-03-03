*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${URL LOGIN}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${URL HOMEPAGE}    https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
${BROWSER}        Chrome
${DELAY}          0


${valid username}     Admin
${valid password}    admin123


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL LOGIN}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    OrangeHRM

Input Username
    Input Text    name:username    ${valid username}

Input Wrong Username
    Input Text    name:username    Binh

Input Password-Orange
    Input Text    name:password   ${valid password}

Input Wrong Password-Orange
    Input Text    name:password   binh123


Submit Credentials
    Click Button    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

Check Message Error     

    Element Should Be Visible    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/div/div[1]/div[1]
    Element Should Contain    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/div/div[1]/div[1]/p    Invalid credentials

Check Message Username is required

    Element Should Be Visible    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/span
    Element Should Contain    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/span    Require

Check Message Password is required

    Element Should Be Visible    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/span
    Element Should Contain    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/span    Require

Home Page Should Be Open
    Location Should Be    ${URL HOMEPAGE}
    Title Should Be    OrangeHRM

Check NavBar
    Element Text Should Be    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span    Admin
    Element Text Should Be    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a    PIM
    Element Text Should Be    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[8]/a/span    Dashboard

NavBar Admin    
    
    Click Element   //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    Title Should Be    OrangeHRM

NavBar PIM
    
    Click Element    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a

NavBar Log Out
    Click Element    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/ul/li/span/p
    Click Element    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/ul/li/ul/li[4]/a

Search Employee
    Location Should Be    https://opensource-demo.orangehrmlive.com/web/index.php/pim/viewEmployeeList
    Sleep    10

    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/div/div/input    Bill
    
    Click Button    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/button[2]
Add Employee
    Location Should Be    https://opensource-demo.orangehrmlive.com/web/index.php/pim/viewEmployeeList
    
    Sleep    10
    Click Element    //*[@id="app"]/div[1]/div[1]/header/div[2]/nav/ul/li[3]/a

    Location Should Be    https://opensource-demo.orangehrmlive.com/web/index.php/pim/addEmployee

    Sleep    10

    Input Text    name:firstName    Alten
    Input Text    name:middleName    Societe
    Input Text    name:lastName    FRANCE

    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[1]/div[2]/div/div/div[2]/input    35000
    Click Button    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[2]/button[2]
    