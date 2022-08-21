*** Settings ***
Library    SeleniumLibrary
Resource  ../resources/resources.robot
*** Variables ***
${url}  https://www.saucedemo.com/
${browser}  Chrome

${standard_user}    standard_user
${Password}     secret_sauce

*** Test Cases ***
Тест-кейсы для проверки работоспособности фильтрации католога товаров
    [Setup]    open browser and maximize   ${url}    ${browser}
    [Teardown]    close browser
    Login To Window     ${standard_user}   ${Password}

    Wait Until Element Is Visible   class: product_sort_container
    Click Element        class: product_sort_container
    Click Element    xpath: //div[@class="header_secondary_container"]
    Click Element    xpath://option[2]
    Wait Until Element Is Visible   xpath: //a[@id="item_3_img_link"]/img[@class="inventory_item_img"]
    Capture Page Screenshot
    Sleep    2
    Click Element    xpath: //div[@class="header_secondary_container"]
    Click Element    xpath://option[3]
    Wait Until Element Is Visible   xpath: //a[@id="item_2_img_link"]/img[@class="inventory_item_img"]
    Capture Page Screenshot
    Sleep    2
    Click Element    xpath: //div[@class="header_secondary_container"]
    Click Element    xpath://option[4]
    Wait Until Element Is Visible   xpath: //a[@id="item_5_img_link"]/img[@class="inventory_item_img"]
    Capture Page Screenshot
    Sleep    2
    Click Element    xpath: //div[@class="header_secondary_container"]
    Click Element    xpath://option[1]
    Wait Until Element Is Visible   xpath: //a[@id="item_4_img_link"]/img[@class="inventory_item_img"]
    Capture Page Screenshot
    Sleep    2
