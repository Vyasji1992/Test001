*** Settings ***
Library  Selenium2Library




*** Variables ***
${URL}          https://www.facebook.com/
${BROWSER}      Chrome
${UserName} 	9079180743
${Password}     02969222100
${Post_Comment}        Test Comment here Please Ignore This.
${UploadFiletest}           id=selectFiles
${AddFile}            C:/Users/nilesh/Pictures.jpg



*** Keywords ***

Open Browser with Login Screen
    Open Browser    ${URL}    ${BROWSER}
    maximize browser window


Input Username
    Input Text    id=email    ${UserName}

Input Password
    Input Text    id=pass   ${Password}
    Click element  xpath=//button[normalize-space()='Log In']
    sleep   15


Click on Post
     Press Keys  None  ESC
     Click element  xpath=//span[normalize-space()="What's on your mind, Nilesh?"]
     sleep    05
     Click element  xpath=//span[@class='d2edcug0 hpfvmrgz qv66sw1b c1et5uql lr9zc1uh a8c37x1j keod5gw0 nxhoafnm aigsh9s9 d3f4x2em fe6kdd0r mau55g9w c8b282yb iv3no6db jq4qci2q a3bd9o3v lrazzd5p oo9gr5id'][normalize-space()='Add to Your Post']
     sleep    05
     click element  xpath=//span[@class='d2edcug0 hpfvmrgz qv66sw1b c1et5uql lr9zc1uh a8c37x1j keod5gw0 nxhoafnm aigsh9s9 d3f4x2em fe6kdd0r mau55g9w c8b282yb mdeji52x a5q79mjw g1cxx5fr lrazzd5p oo9gr5id hzawbc8m'][normalize-space()='Photo/Video']
     sleep   05
     Choose File   my_upload_field   ${AddFile}

#Upload file
#    Scroll Element Into View     ${UploadFiletest}
#    sleep  05
#    Choose File    ${UploadFiletest}      ${AddFile}
#    Press Key   None   Enter


*** Test Cases ***
TC1: User Redirected to Gmail Login Screen
        Open Browser with Login Screen
        Title Should Be    Facebook – log in or sign up

TC2: Login with Valid Credential
        Input Username
        Input Password

#        Title Should Be   Facebook

TC3: Click on Post & add Comment
        click on post
#        Upload file


