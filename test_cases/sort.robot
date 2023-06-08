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
    [Setup]    Открыть браузер на максимум   ${url}    ${browser}
    [Teardown]    close browser

    Авторизоваться в системе     ${standard_user}   ${Password}

    Ждать появления элемента   class: product_sort_container    3.1_Выподающий список сортировки не отображается    3.1_Выподающий список сортировки не отображается
    Ожидание и нажатие элемента        class: product_sort_container
    Ожидание и нажатие элемента    xpath: //div[@class="header_secondary_container"]
    Ожидание и нажатие элемента    xpath://option[2]
    Ждать появления элемента   xpath: //a[@id="item_3_img_link"]/img[@class="inventory_item_img"]   3.1_Карточка товара не отображается    3.1_Карточка товара не отображается
    Ожидание и нажатие элемента    xpath: //div[@class="header_secondary_container"]
    Ожидание и нажатие элемента    xpath://option[3]
    Ждать появления элемента   xpath: //a[@id="item_2_img_link"]/img[@class="inventory_item_img"]   3.1_Карточка товара не отображается    3.1_Карточка товара не отображается
    Ожидание и нажатие элемента    xpath: //div[@class="header_secondary_container"]
    Ожидание и нажатие элемента    xpath://option[4]
    Ждать появления элемента   xpath: //a[@id="item_5_img_link"]/img[@class="inventory_item_img"]       3.1_Карточка товара не отображается    3.1_Карточка товара не отображается
    Ожидание и нажатие элемента    xpath: //div[@class="header_secondary_container"]
    Ожидание и нажатие элемента    xpath://option[1]
    Ждать появления элемента   xpath: //a[@id="item_4_img_link"]/img[@class="inventory_item_img"]       3.1_Карточка товара не отображается    3.1_Карточка товара не отображается

