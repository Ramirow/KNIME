*** Settings ***
Documentation     Login Page
Library           SeleniumLibrary

*** Variables ***
${URL}     https://hub.knime.com/
${BROWSER}     chrome
${VALIDUSR}    Rami123
${VALIDPWD}    Rami1234
${UNVALIDUSR}    usr
${UNVALIDPWD}   pwd
${LOGIN}      //*[@id="__layout"]/div/div[1]/header/nav/div[2]/button
${ACCEPT}     //*[@id="__layout"]/div/div[3]/div[2]/div/div[3]/button
${AGREE}      //*[@id="sliding-popup"]/div/div[3]/button
${USRFIELD}   //*[@id="edit-name"]
${PWDFIELD}    //*[@id="edit-pass"]
${SIGNIN}    //*[@id="edit-submit"]
${ErrorMessageLoc}     //*[@id="user-login-form"]/div[1]/div[1]
${ErrorMessage}      Unrecognized username or password .
${ProfileIcon}      //*[@id="__layout"]/div/div[1]/header/nav/div[2]/div/button/div

*** Keywords ***
Navigate to login
     Open Browser    ${URL}    ${BROWSER}
     Wait Until Element Is Visible   xpath=${ACCEPT}      10
     Click Element    xpath=${ACCEPT}
     Wait Until Element Is Visible   xpath=${LOGIN}      10
     Click Element    xpath=${LOGIN}
   
Insert a valid username and an invalid password
     Wait Until Element Is Visible   xpath=${USRFIELD}      20
     Input Text    xpath=${USRFIELD}    ${VALIDUSR}
     Input Password    xpath=${PWDFIELD}    ${UNVALIDPWD}
     #Click Element    xpath=${AGREE}
     Click Element    xpath=${SIGNIN}
     Wait Until Element Is Visible   xpath=${ErrorMessageLoc}
     Page Should Contain Element     xpath=${ErrorMessageLoc}     

Insert invalid username and valid password    
     Clear Element Text    xpath=${USRFIELD}
     Input Text    xpath=${USRFIELD}    ${UNVALIDUSR}
     Input Password    xpath=${PWDFIELD}    ${VALIDPWD}
     #Click Element    xpath=${AGREE}
     Click Element    xpath=${SIGNIN}
     Wait Until Element Is Visible   xpath=${ErrorMessageLoc}
     Page Should Contain Element     xpath=${ErrorMessageLoc}  

Leave the username and password blank
     Clear Element Text    xpath=${USRFIELD}
     Click Element    xpath=${SIGNIN}
     Wait Until Element Is Visible   xpath=${ErrorMessageLoc}
     Page Should Contain Element     xpath=${ErrorMessageLoc} 

Enter valid username and password
     Input Text    xpath=${USRFIELD}    ${VALIDUSR}
     Input Password    xpath=${PWDFIELD}    ${VALIDPWD}
     Click Element    xpath=${SIGNIN}
     sleep       2
     Page Should Contain Element     xpath=${ProfileIcon}
