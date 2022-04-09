*** Settings ***
Documentation     UI Verification
Library           SeleniumLibrary

*** Variables ***
${PublicArea}       //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div/div/ul/li[1]/a
${TextField}       //*[@id="confirmationForm"]/div/input
${Spaces}                //*[@id="__layout"]/div/div[1]/section/nav/ul/li[3]
${PrivateArea}      //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div/div/ul/li[2]/a
${PubButton}     //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div/div/ul/li[3]/div/div/button[2]
${PriButton}      //*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div/div/ul/li[4]/div/div/button[1]


*** Keywords ***
Verify the public space area  
       Wait Until Element Is Visible     ${PublicArea}
       sleep      2
       ${text}=    Get Text     ${PublicArea} 
       Run Keyword And Ignore Error     Should Contain      '''${text}'''     Public  
       Click Element       ${PublicArea} 
       sleep   2
       Page Should Contain       Seems like you haven’t uploaded anything to this space yet

Verify the private space area
       Go Back
       Wait Until Element Is Visible     ${PrivateArea}
       sleep      2
       ${text}=    Get Text     ${PrivateArea} 
       Run Keyword And Ignore Error     Should contain      '''${text}'''     Private  
       Click Element       ${PrivateArea} 
       sleep   2
       Page Should Contain       Seems like you haven’t uploaded anything to this space yet

Verify clicking on create public space button
       Go Back
       click Button     ${PubButton} 
       sleep    2
       Page Should Contain       Seems like you haven’t uploaded anything to this space yet
       Go Back

Verify clicking on create private space button
       Wait Until Element Is Visible       ${PriButton}
       Run Keyword And Ignore Error      
       ...   Run Keywords
       ...   click Button      ${PriButton} 
       ...   AND   sleep   2
       ...   AND   Page Should Contain       Seems like you haven’t uploaded anything to this space yet    
       [Teardown]    Close Browser  