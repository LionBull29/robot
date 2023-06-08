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

    ЛКМ в элемент страницы    id:add-to-cart-sauce-labs-bike-light  2.1_Не повявилось меню   2.1_Не повявилось меню
    Ожидание и нажатие элемента    xpath://a[@class="shopping_cart_link"]
    Ожидание и нажатие элемента    id: checkout
    Ждать появления элемента   xpath: //span[@class="title"]   2.1_Заголовок не появился      2.1_Заголовок не появился
    input text   id:first-name  Тест_имя
    input text  id:last-name   Тест_фамилия
    input text    id:postal-code    31400
    Ожидание и нажатие элемента    id:continue
    Ждать появления элемента   xpath: //span[@class="title"]   2.1_Заголовок не появился      2.1_Заголовок не появился
    Ждать появления элемента    xpath: //div[@class="summary_info"]/div[1]      2.1_Платежная информация не отображается    2.1_Платежная информация не отображается
    Ждать появления элемента    xpath: //div[@class="summary_info"]/div[2]      2.1_Информация о доставке не отображается    2.1_Информация о доставке не отображается
    Ждать появления элемента    xpath: //div[@class="summary_info"]/div[3]      2.1_Общая цена не отображается    2.1_Общая цена не отображается
    Ожидание и нажатие элемента    id:finish
    Ждать появления элемента    xpath://img[@class="pony_express"]      2.1_Подтвержение оформление заказа не отображается    2.1_ОПодтвержение оформление заказа не отображается
    Ожидание и нажатие элемента    id:back-to-products