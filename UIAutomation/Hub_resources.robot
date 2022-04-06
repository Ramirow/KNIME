*** Settings ***
Documentation     Hub Page
Library           SeleniumLibrary

*** Variables ***
${ProfileIcon}      //*[@id="__layout"]/div/div[1]/header/nav/div[2]/div/button/div
${Spaces}       //*[@id="__layout"]/div/div[1]/header/nav/div[2]/div/ul/li[2]/a
${YourSpace}     //*[@id="__layout"]/div/div[1]/main/section/div/div[2]/div/h2

*** Keywords ***     
Navigate to Spaces
     click Element    xpath=${ProfileIcon}
     click Element    xpath=${Spaces} 
     Wait Until Element Is Visible   xpath=${YourSpace}
     Page Should Contain Element    xpath=${YourSpace}