*** Settings ***
Documentation     Login Page
Library           SeleniumLibrary

*** Variables ***
${PublicSpace}     //*[@id="__layout"]/div/div[1]/main/section/div/div[2]/div/div/ul/li[3]/div/div/button[2]
${SpaceField}      //*[@id="__layout"]/div/div[1]/main/section[1]/div/div/div/div[1]/h3/div/div/textarea

*** Keywords ***
Create the public space 
    Run Keyword And Ignore Error      
    ...   Run Keywords
    ...   Click Button    ${PublicSpace}
    ...   AND   Wait Until Element Is Visible     ${SpaceField}   
    ...   AND   Clear Element Text       ${SpaceField}
    ...   AND   Input Text    xpath=${SpaceField}      New Space  

