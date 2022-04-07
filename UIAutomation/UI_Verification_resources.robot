*** Settings ***
Documentation     UI Verification
Library           SeleniumLibrary

*** Variables ***
${PublicArea}       //*[@id="__layout"]/div/div[1]/main/section/div/div[2]/div/div/ul/li[3]/div/div/button[2]
${TextField}       //*[@id="confirmationForm"]/div/input

*** Keywords ***
Verify clicking in the public space area  
       Wait Until Element Is Visible     ${PublicArea}
       sleep      10
       ${text}=    Get Text     ${PublicArea} 
       Run Keyword And Ignore Error     Should Be True      '''${text}''' =='Public space'  
       Click Element       ${PublicArea}
       sleep   2
       Page Should Contain       Seems like you haven’t uploaded anything to this space yet
