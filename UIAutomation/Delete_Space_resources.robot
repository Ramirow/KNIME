*** Settings ***
Documentation     Login Page
Library           SeleniumLibrary

*** Variables ***
${PublicSpace}     //*[@id="__layout"]/div/div[1]/main/section/div/div[2]/div/div/ul/li[3]/div/div/button[2]
${SpaceField}      //*[@id="__layout"]/div/div[1]/main/section[1]/div/div/div/div[1]/h3/div/div/textarea
${CreatedSpace}    //*[@id="__layout"]/div/div[1]/main/section/div/div[2]/div/div/ul/li[1]/a/div[2]
${Dots}           //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div[2]/div[3]/div/button
${Delete}         //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div[2]/div[3]/div/div/div[1]/div/button
${TextField}      //*[@id="confirmationForm"]/div/input
${Confirm}        //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div[2]/div[3]/div/div/div[1]/div[2]/div[2]/div/div[4]/button

*** Keywords ***
Delete the public space 
     ${URl}=   Get Location
     ${Check}=  Evaluate   "latest" in """${URl}"""
     Run Keyword Unless      ${Check}     Click Element    ${CreatedSpace}   
     sleep     2
     click Element      xpath=${Dots}
     click Button       ${Delete}
     Wait Until Element Is Visible     xpath=${TextField}
     Input Text    xpath=${TextField}      New Space
     Wait Until Element Is Visible     ${Confirm}
     click Button       ${Confirm}
     Page Should Not Contain       xpath=${TextField}