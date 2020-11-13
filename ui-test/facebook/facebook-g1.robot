*** Setting ***
Library    SeleniumLibrary

*** Variable ***
${email}    
${password}    

*** Test Cases ***
Test login and post Facebook
    เข้า Facebook.com
    Login เข้าไปใน Facebook
	ตรวจสอบชื่อว่าใช่เราใช่มั้ย
    กดช่องที่จะ Post
	พิมพ์ สวัสดี RobotFramework แล้ว Post

*** Keywords ***
เข้า Facebook.com
    ${options}=    Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method     ${options}    add_argument    --disable-notifications
    ${driver}=    Create Webdriver    Chrome    options=${options}
    Go To     https://facebook.com

Login เข้าไปใน Facebook
    Input text  id:email    ${email}
    Input text  id:pass    ${password}
    Press keys  None    RETURN

ตรวจสอบชื่อว่าใช่เราใช่มั้ย
    Page Should Contain    Champ Wikrom

กดช่องที่จะ Post
    Click Element	xpath: //*[contains(text(), "What's on your mind, Champ?")]

พิมพ์ สวัสดี RobotFramework แล้ว Post
    Wait Until Page Contains    Add to your post
    Press Keys    None    สวัสดี RobotFramework
    Click Element	xpath: //*[contains(text(), "Post")]
    Close Borwser