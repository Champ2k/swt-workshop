*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers


*** Variables ***

*** Test Cases ***
user ซื้อของเล่นให้ลูกสาว เลือกวิธีจัดส่งเป็น kerry ชำระเงินด้วยบัตรเครดิต visa และชำระเงินสำเร็จ
    แสดงสินค้า
    แสดงรายละเอียดสินค้า
    ระบุจำนวนสินค้าที่จะซื้อ
    นำสินค้าใส่ตระกร้า
    ยืนยันการสั่งซื้อและชำระเงินด้วยบัตร Credit-Visa Card
    ขอบคุณ

*** Keywords ***
แสดงสินค้า
    Open Browser    https://www.dminer.in.th/Product-list.html    chrome
    Element Should Contain    id=productName-1    expected=43 Piece Dinner Set
    Element Should Contain    id=productPrice-1    expected=12.95 USD

แสดงรายละเอียดสินค้า
    Click Button    id=viewMore-1

ระบุจำนวนสินค้าที่จะซื้อ
    Wait Until Page Contains    Add to Cart
    Element Should Contain    id=productName    expected=43 Piece dinner Set
    Element Should Contain    id=productBrand    expected=CoolKidz
    Element Should Contain    id=productPrice    expected=12.95 USD
    Input Text    id=productQuantity    1

นำสินค้าใส่ตระกร้า
    Click Button    id=addToCart

ยืนยันการสั่งซื้อและชำระเงินด้วยบัตร Credit-Visa Card
    Wait Until Page Contains    ยืนยันคำสั่งซื้อและชำระเงิน
    Element Should Contain    id=receiverName    expected=ณัฐญา ชุติบุตร
    Element Should Contain    id=recevierAddress    expected=405/37 ถ.มหิดล ต.ท่าศาลา อ.เมือง จ.เชียงใหม่ 50000
    Element Should Contain    id=recevierPhonenumber    expected=0970809292
    Element Should Contain    id=totalProductPrice    expected=12.95 USD
    Element Should Contain    id=totalShippingCharge   expected=2.00 USD
    Element Should Contain    id=totalAmount    expected=14.95 USD
    Element Should Contain    id=productName-1    expected=43 Piece dinner Set
    Element Attribute Value Should Be    id=productQuantity-1    attribute=value    expected=1
    Click Button    id=confirmPayment
    Wait Until Page Contains     ยืนยันการชำระเงิน
    Input Text    cardNumber    4719700591590995
    Input Text    expiredMonth    7
    Input Text    expiredYear    20
    Input Text    cvv    752
    Input Text    cardName    Karnwat Wongudom
    Click Button    Payment

ขอบคุณ
    Wait Until Page Contains    กลับไปหน้าหลัก
    Element Should Contain    id=title    expected=ชำระเงินสำเร็จ
    Element Should Contain    id=notify    expected=วันเวลาที่ชำระเงิน 1/3/2563 13:30:00 หมายเลขคำสั่งซื้อ 8004359103 คุณสามารถติดตามสินค้าผ่านช่องทาง Kerry ด้วยหมายเลข 1785261900

