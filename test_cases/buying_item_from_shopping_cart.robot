*** Settings ***
Library    SeleniumLibrary
Resource  ../resources/resources.robot
*** Variables ***
${url}  https://www.saucedemo.com/
${browser}  Chrome

${standard_user}    standard_user
${Password}     secret_sauce

*** Test Cases ***
Тест-кейсы для проверки работоспособности взаимодейвия с корзиной
    [Setup]    open browser and maximize   ${url}    ${browser}
    [Teardown]    close browser
    Login To Window     ${standard_user}   ${Password}

    Click Button    id:add-to-cart-sauce-labs-bike-light
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id: checkout
    Wait Until Element Is Visible    xpath: //span[@class="title"]
    input text   id:first-name  Тест_имя
    input text  id:last-name   Тест_фамилия
    Input Text    id:postal-code    31400
    click button    id:continue
    Wait Until Element Is Visible    xpath: //span[@class="title"]
    Wait Until Element Is Visible    xpath: //div[@class="summary_info"]/div[1]
    Wait Until Element Is Visible    xpath: //div[@class="summary_info"]/div[2]
    Wait Until Element Is Visible    xpath: //div[@class="summary_info"]/div[3]
    Click Button    id:finish
    Wait Until Element Is Visible    xpath://img[@class="pony_express"]
    Click Button    id:back-to-products