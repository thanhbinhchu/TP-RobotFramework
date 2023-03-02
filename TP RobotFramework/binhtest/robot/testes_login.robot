*** Settings ***
Documentation   Application Demo  
...            on va tester la fonctionnalité login de notre application
Bibliothèque     SeleniumLibrary
Mise en place de test    Ouvrir le nvigateur    ${URL de l'application} 	${navigateur a utiliser}
Démontage de test    Fermer le navigateur


*** Variables ***
    ${URL de l'application}    http://localhost:7272/
    ${navigateur a utiliser}    Chrome
    ${localisateur du champ nom}    id:username_field
    ${localisateur du champ mot de passe}    id:password_field
    ${localisateur du btn login}    id:login_button

*** Test Cases ***
Login valide
    Login a l'application    demo    mode
    Title Should Be    Welcome Page
       
Mot de passe incorrecte
    Login a l'application    demo    nonvalide
    Title Should Be    Error Page

Nom de l'utilisateur incorrecte
    Login a l'application    nonvalide    mode
    Title Should Be    Error Page

*** keywords ***
Ouvrir le nvigateur
    [Arguments]    ${adresse}    ${navigateur}
    Open Browser    ${adresse}    ${navigateur}

Fermer le navigateur
    Close Browser

Login a l'application
    [Arguments]    ${nom}    ${mdp}
    Input Text    ${localisateur du champ nom}     ${nom}
    Input Text    ${localisateur du champ mot de passe}    ${mdp}
    Click Button    ${localisateur du btn login}
    Sleep    5


