*** Settings ***
Documentation     Automation Testing for KNIME
Resource      ./Login_resources.robot

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

*** Test Cases *** 
Navigate to login page
    [Documentation]  We expect the user to navigate to login page
    Navigate to login
Verify the login Page
    [Documentation]  We expect the user to login
    Insert a valid username and an invalid password
    Insert invalid username and valid password
    Leave the username and password blank
    Enter valid username and password