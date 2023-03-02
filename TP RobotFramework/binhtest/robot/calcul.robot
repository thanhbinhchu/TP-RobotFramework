*** Settings ***
Test Template      verifier mon calcul

*** Test Cases ***
doit passer     1+1     2
doit echouer        1+2     5

*** Keywords ***
verifier mon calcul
    [Arguments]     ${calcul}       ${attendue}
    ${att_entier} =     Convert To Integer       ${attendue}
    ${resultat} =       Evaluate        ${calcul}
    Should Be Equal     ${resultat}      ${att_entier}
