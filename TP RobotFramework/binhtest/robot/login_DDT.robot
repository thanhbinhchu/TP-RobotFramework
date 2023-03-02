*** Settings ***
Documentation   application du principe DDT
Library     SeleniumLibrary
Test setup          Ouvrir le nvigateur     ${URL de l'application}    ${navigateur}
Test teardown       Fermer le navigateur
Test Template       Modele login invalide

*** Variables ***
${URL de l'application}                 http://localhost:7272/
${navigateur}                Chrome
${localisateur du champ nom}            id:username_field
${localisateur du champ mot de passe}   id:password_field
${localisateur du btn login}            id:login_button
${temp d'attente}                        10

*** Test Cases ***
Mot de passe incorrecte     demo            nonvalide
Nom incorrecte              nonvalide    mode


*** keywords ***
Modele login invalide
    [Arguments]     ${nom}      ${mdp}
    Login a l'application       ${nom}      ${mdp}
    Title Should Be     Error Page

Ouvrir le nvigateur
    [Arguments]     ${addresse}     ${navigateur}
    Open Browser    ${addresse}     ${navigateur}

Fermer le navigateur
    Close Browser

Login a l'application
    [Arguments]     ${nom}      ${mdp}    
    Input Text      ${localisateur du champ nom}                ${nom}
    Input Text      ${localisateur du champ mot de passe}       ${mdp}
    Click Button    ${localisateur du btn login}
    Sleep   3
