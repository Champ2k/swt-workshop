*** Variable ***
${URL}    https://www.google.com
${Browser}     chrome
${Keyword}    USElection2020
${Expected_Result}    US Election 2020 - BBC News

*** Keywords ***
พิมพ์ google.com
    Open Browser    ${URL}   ${Browser}

พิมพ์คำค้น
    Input Text    name:q    ${Keyword}

กด Enter
    Press Keys    name:q    RETURN
 
ตรวจสอบผลการค้นหา
    Page Should Contain     ${Expected_Result}
    Close Browser