*** Settings ***
Documentation     Automation Testing for KNIME
Resource      ./Login_resources.robot
Resource     ./Hub_resources.robot
Resource     ./Create_Space_resources.robot
Resource     ./Delete_Space_resources.robot
Resource     ./UI_Verification_resources.robot

*** Variables ***

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

Navigate to Spaces page
    [Documentation]  We expect the user to navigate from HUB page to spaces page     
    Navigate to Spaces 
Create a public space
    [Documentation]  We expect the user to create a public space
    Create the public space
Delete a public space
    [Documentation]  We expect the user to delete a public space
    Delete the public space         
     
Verify the UI of space page
     Verify the public space area 
     Verify the private space area 
     Verify clicking on create public space button
     Verify clicking on create private space button