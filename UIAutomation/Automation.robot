*** Settings ***
Documentation     Automation Testing for KNIME
Resource      ./Login_resources.robot

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