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
    [Setup]    open browser and maximize   ${url}    ${browser}
    [Teardown]    close browser
    Login To Window     ${standard_user}   ${Password}
    Wait Until Element Is Visible    id: react-burger-menu-btn
    Click Button    id: react-burger-menu-btn
    Wait Until Element Is Visible    id:logout_sidebar_link
    Click Element    id:logout_sidebar_link

Тест-кейсы для проверки попытки авторизации заблокированым пользователем
    [Setup]    open browser and maximize   ${url}    ${browser}
    [Teardown]    close browser
    input text   id:user-name    ${locked_out_user}
    input text  name:password   ${Password}
    click button    id:login-button
    Wait Until Element Is Visible    xpath://*[@id="login_button_container"]/div/form/div[3]/h3
    Click Button    class: error-button
    Capture Page Screenshot


Тест-кейсы для проверки авторизации проблемным пользователем
    [Setup]    open browser and maximize   ${url}    ${browser}
    [Teardown]    close browser
    Login To Window     ${problem_user}   ${Password}
    Wait Until Element Is Visible    id: react-burger-menu-btn
    Click Button    id: react-burger-menu-btn
    Wait Until Element Is Visible    id:logout_sidebar_link
    Click Element    id:logout_sidebar_link

Тест-кейсы для проверки авторизации пользователем с плохим интернетом
    [Setup]    open browser and maximize   ${url}    ${browser}
    [Teardown]    close browser
    Login To Window     ${performance_glitch_user}   ${Password}
    Wait Until Element Is Visible    id: react-burger-menu-btn
    Click Button    id: react-burger-menu-btn
    Wait Until Element Is Visible    id:logout_sidebar_link
    Click Element    id:logout_sidebar_link