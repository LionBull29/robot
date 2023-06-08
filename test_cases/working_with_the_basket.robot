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
    [Setup]    Открыть браузер на максимум   ${url}    ${browser}
    [Teardown]    close browser
    Авторизоваться в системе     ${standard_user}   ${Password}
    Ожидание и нажатие элемента    id:add-to-cart-sauce-labs-bike-light
    Ожидание и нажатие элемента    id:add-to-cart-sauce-labs-backpack
    Ожидание и нажатие элемента    id:add-to-cart-sauce-labs-bolt-t-shirt
    Ожидание и нажатие элемента    id:add-to-cart-sauce-labs-fleece-jacket
    Ожидание и нажатие элемента    id:add-to-cart-sauce-labs-onesie
    Ожидание и нажатие элемента    id:add-to-cart-test.allthethings()-t-shirt-(red)
    Ожидание и нажатие элемента    xpath://a[@class="shopping_cart_link"]
    Ждать появления элемента    xpath://a[@id="item_4_title_link"]/div[@class="inventory_item_name"]       4.1_Карточка товара не отображается    4.1_Карточка товара не отображается
    Скролл до элемента      xpath://div[@class="footer_copy"]   4.1_Карточка товара не отображается    4.1_Карточка товара не отображается
    Ожидание и нажатие элемента    id:remove-test.allthethings()-t-shirt-(red)
    Ожидание и нажатие элемента    id:remove-sauce-labs-onesie
    Ожидание и нажатие элемента    id:remove-sauce-labs-bolt-t-shirt
    Ожидание и нажатие элемента    id:remove-sauce-labs-fleece-jacket
    Ожидание и нажатие элемента    id:remove-sauce-labs-bike-light
    Go Back