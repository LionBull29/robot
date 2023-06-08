*** Settings ***
Library    SeleniumLibrary
Resource  ../resources/resources.robot
*** Variables ***
${url}  https://www.saucedemo.com/
${browser}  Chrome

${standard_user}    standard_user
${locked_out_user}  locked_out_user
${problem_user}  problem_user
${performance_glitch_user}  performance_glitch_user
${Password}     secret_sauce

*** Test Cases ***
Тест-кейсы для проверки авторизации стандартам пользователем
    [Setup]    Открыть браузер на максимум   ${url}    ${browser}
    [Teardown]    close browser

    Авторизоваться в системе     ${standard_user}   ${Password}
    Ждать появления элемента    id: react-burger-menu-btn    1.1_Не повявилось меню   1.1_Не повявилось меню
    Ожидание и нажатие элемента     id: react-burger-menu-btn
    Ждать появления элемента   id:logout_sidebar_link   1.1_Пункт меню не появился      1.1_Пункт меню не появился
    Ожидание и нажатие элемента    id:logout_sidebar_link

Тест-кейсы для проверки попытки авторизации заблокированым пользователем
    [Setup]    Открыть браузер на максимум   ${url}    ${browser}
    [Teardown]    close browser

    input text   id:user-name    ${locked_out_user}
    input text  name:password   ${Password}
    ЛКМ в элемент страницы      id:login-button     1.2_Сообщение не закрывается    1.2_Сообщение не закрывается
    Ждать появления элемента    //div[contains(@class, "error-message-container")]      1.2_Сообщение о блокировки не появилось     1.2_Сообщение о блокировки не появилось
    ЛКМ в элемент страницы    class: error-button       1.2_Сообщение не закрывается    1.2_Сообщение не закрывается



Тест-кейсы для проверки авторизации проблемным пользователем
    [Setup]    Открыть браузер на максимум   ${url}    ${browser}
    [Teardown]    close browser
    Авторизоваться в системе     ${problem_user}   ${Password}
    Ждать появления элемента    id: react-burger-menu-btn       1.3_Не повявилось меню   1.3_Не повявилось меню
    ЛКМ в элемент страницы    id: react-burger-menu-btn     1.3_Нажатие по меню не произошло   1.3_Нажатие по меню не произошло
    Ждать появления элемента   id:logout_sidebar_link   1.3_Пункт меню не появился      1.3_Пункт меню не появился
    ЛКМ в элемент страницы    id:logout_sidebar_link    1.3_Кнопка не нажалась      1.3_Кнопка не нажалась

Тест-кейсы для проверки авторизации пользователем с плохим интернетом
    [Setup]    Открыть браузер на максимум   ${url}    ${browser}
    [Teardown]    close browser
    Авторизоваться в системе     ${performance_glitch_user}   ${Password}
    Ждать появления элемента    id: react-burger-menu-btn       1.4_Не повявилось меню   1.4_Не повявилось меню
    ЛКМ в элемент страницы    id: react-burger-menu-btn     1.4_Нажатие по меню не произошло   1.4_Нажатие по меню не произошло
    Ждать появления элемента   id:logout_sidebar_link   1.4_Пункт меню не появился      1.4_Пункт меню не появился
    ЛКМ в элемент страницы    id:logout_sidebar_link    1.4_Кнопка не нажалась      1.4_Кнопка не нажалась