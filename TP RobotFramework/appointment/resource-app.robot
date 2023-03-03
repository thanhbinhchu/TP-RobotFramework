** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library    DateTime

*** Variables ***
${URL CURA}    https://katalon-demo-cura.herokuapp.com/
${BROWSER}        Chrome
${DELAY}          0
${valid username}     John Doe
${valid password}    ThisIsNotAPassword

${URL LOGIN}    https://katalon-demo-cura.herokuapp.com/profile.php#login
${URL APPOINTMENT}    https://katalon-demo-cura.herokuapp.com/#appointment

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${URL CURA}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    #Home Page Should Be Open

Open LogIn Page
    Click Element    //*[@id="menu-toggle"]/i
    Sleep   3
    Click Element    //*[@id="sidebar-wrapper"]/ul/li[3]/a
    Location Should Be    ${URL LOGIN}
    Title Should Be    CURA Healthcare Service

Input Correct Username
    
    Input Text    id:txt-username    ${valid username}

Input Incorrect Username
    Input Text    id:txt-username    binh

Input Correct Password
    
    Input Text    id:txt-password    ${valid password}

Input Incorrect Password
    
    Input Text    id:txt-password    binh123

Submit Login
    Click Button    id:btn-login

Appointment Page Should Be Open
    Location Should Be    ${URL APPOINTMENT}
    Title Should Be    CURA Healthcare Service

Make an Appointment
    Get Selected List Label    id:combo_facility    
    Select Checkbox    id:chk_hospotal_readmission
    # Select Radio Button    id:radio_program_medicare    Medicare
    
    Click Element    //*[@id="txt_visit_date"]
    Click Element   xpath:/html/body/div/div[1]/table/tbody/tr[5]/td[1]

    Input Text    id:txt_comment    NO COMMENT
    Click Button    id:btn-book-appointment

Submit Log Out
    Click Element    //*[@id="menu-toggle"]/i
    Click Element    //*[@id="sidebar-wrapper"]/ul/li[5]/a