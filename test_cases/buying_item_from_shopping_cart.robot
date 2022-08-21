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
   Sleep    1
    Click Button    id:add-to-cart-sauce-labs-bike-light
   Sleep    1
    Click Element    xpath://a[@class="shopping_cart_link"]
   Sleep    1
    Click Button    id: checkout
   Sleep    1
    Wait Until Element Is Visible    xpath: //span[@class="title"]
   Sleep    1
    input text   id:first-name  Тест_имя
   Sleep    1
    input text  id:last-name   Тест_фамилия
   Sleep    1
    Input Text    id:postal-code    31400
   Sleep    1
    click button    id:continue
   Sleep    1
    Wait Until Element Is Visible    xpath: //span[@class="title"]
   Sleep    1
    Wait Until Element Is Visible    xpath: //div[@class="summary_info"]/div[1]
   Sleep    1
    Wait Until Element Is Visible    xpath: //div[@class="summary_info"]/div[2]
   Sleep    1
    Wait Until Element Is Visible    xpath: //div[@class="summary_info"]/div[3]
   Sleep    1
    Click Button    id:finish
    Wait Until Element Is Visible    xpath://img[@class="pony_express"]
    Click Button    id:back-to-products
   Sleep    1