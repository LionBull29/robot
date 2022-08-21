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
    Click Button    id:add-to-cart-sauce-labs-backpack
    Click Button    id:add-to-cart-sauce-labs-bolt-t-shirt
    Click Button    id:add-to-cart-sauce-labs-fleece-jacket
    Click Button    id:add-to-cart-sauce-labs-onesie
    Click Button    id:add-to-cart-test.allthethings()-t-shirt-(red)
    Click Element    xpath://a[@class="shopping_cart_link"]
    Wait Until Element Is Visible    xpath://a[@id="item_4_title_link"]/div[@class="inventory_item_name"]
    Scroll Element Into View    xpath://div[@class="footer_copy"]
    Click Button    id:remove-test.allthethings()-t-shirt-(red)
    Click Button    id:remove-sauce-labs-onesie
    Click Button    id:remove-sauce-labs-bolt-t-shirt
    Click Button    id:remove-sauce-labs-fleece-jacket
    Click Button    id:remove-sauce-labs-bike-light
    Go Back