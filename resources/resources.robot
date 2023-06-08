*** Settings ***
Library    SeleniumLibrary      screenshot_root_directory=${CURDIR}/report/Screenshot/
Library         Process
Library         BuiltIn
Library         DateTime
Library         OperatingSystem
Library         String
Library         Collections

*** Keywords ***
Открыть браузер на максимум
    [Arguments]  ${UserUrl}   ${BrouserName}
    open browser  ${UserUrl}    ${BrouserName}
    maximize browser window
    log     BrouserName:${BrouserName}
    log     url:${UserUrl}

Авторизоваться в системе

    [Arguments]  ${User}    ${Password}
    input text   id:user-name   ${User}
    input text  name:password   ${Password}
    click button    id:login-button
    page should not contain element   class:error-message-container

 ЛКМ в элемент страницы

    [Arguments]                             ${locator}  ${screen}   ${message}
    ${status}	        ${value} =       Run Keyword And Ignore Error       Wait Until Element Is Enabled           ${locator}
    Run Keyword If	    '${status}' == 'FAIL'           Сделать снимок экрана         ${CURDIR}/report/Screenshot/error_${screen}.png
    Run Keyword If	    '${status}' == 'FAIL'           FAIL                ${message}
    #Scroll Element Into View         ${locator}
    ${status}	        ${value} =       Run Keyword And Ignore Error       Click Element                           ${locator}
    Run Keyword If	    '${status}' == 'FAIL'           Сделать снимок экрана         ${CURDIR}/report/Screenshot/error_${screen}.png
    Run Keyword If	    '${status}' == 'FAIL'           FAIL                ${message}

ПКМ в элемент страницы
    [Arguments]                             ${locator}  ${screen}   ${message}
    ${status}	        ${value} =       Run Keyword And Ignore Error       right_click_element                   ${locator}
    Run Keyword If	    '${status}' == 'FAIL'           Сделать снимок экрана         ${CURDIR}/report/Screenshot/error_${screen}.png
    Run Keyword If	    '${status}' == 'FAIL'           FAIL                ${message}

Ожидание и нажатие элемента
    [Arguments]                             ${locator}
    Wait Until Element Is Visible           ${locator}
    Click Element                           ${locator}

Проверка установленного чекбокса
    [Arguments]     ${локатор}   ${screen}     ${message}
    ${status}	        ${value} =       Run Keyword And Ignore Error   Get Value     ${локатор}
    Run Keyword If      '${value}'=='false' or '${status}' == 'FAIL'             Сделать снимок экрана         ${CURDIR}/report/Screenshot/error_${screen}.png
    Run Keyword If      '${value}'=='false' or '${status}' == 'FAIL'             FAIL                ${message}

Проверка снятого чекбокса
    [Arguments]     ${локатор}   ${screen}     ${message}
    ${status}	        ${value} =       Run Keyword And Ignore Error   Get Value     ${локатор}
    Run Keyword If      '${value}'=='true' or '${status}' == 'FAIL'             Сделать снимок экрана         ${CURDIR}/report/Screenshot/error_${screen}.png
    Run Keyword If      '${value}'=='true' or '${status}' == 'FAIL'             FAIL                ${message}

Ждать исчезновения элемента
    [Arguments]     ${локатор}   ${timeout}  ${screen}     ${message}
    Run Keyword And Ignore Error   Wait Until Element Is Visible       ${локатор}
    ${status}	        ${value} =       Run Keyword And Ignore Error   Wait Until Element Is Not Visible       ${локатор}  ${timeout}
    Run Keyword If	    '${status}' == 'FAIL'           Сделать снимок экрана         ${CURDIR}/report/Screenshot/error_${screen}.png
    Run Keyword If	    '${status}' == 'FAIL'           FAIL                ${message}

Ждать появления элемента
    [Arguments]     ${локатор}   ${screen}     ${message}  ${timeout}=5 sec
    ${status}	        ${value} =       Run Keyword And Ignore Error   Wait Until Element Is Visible           ${локатор}  ${timeout}
    Run Keyword If	    '${status}' == 'FAIL'           Сделать снимок экрана         ${CURDIR}/report/Screenshot/error_${screen}.png
    Run Keyword If	    '${status}' == 'FAIL'           FAIL                ${message}

Проверка доступности элемента
    [Arguments]                     ${локатор}             ${скрин}         ${текст_ошибки}
    ${status}	        ${value} =       Run Keyword And Ignore Error       Click Element                 ${локатор}
    Run Keyword If	    '${status}' == 'FAIL'           Сделать снимок экрана         ${CURDIR}/report/Screenshot/error_${скрин}.png
    Run Keyword If	    '${status}' == 'FAIL'           FAIL                ${текст_ошибки}

Скролл до элемента
    [Arguments]     ${locator}   ${screen}     ${message}
    ${status}	        ${value} =       Run Keyword And Ignore Error       Wait Until Element Is Enabled           ${locator}
    Run Keyword If	    '${status}' == 'FAIL'           Сделать снимок экрана         ${EXECDIR}/report/Screenshot/error_${screen}.png
    Run Keyword If	    '${status}' == 'FAIL'           FAIL                ${message}
    ${status}	        ${value} =       Run Keyword And Ignore Error       Scroll Element Into View        ${locator}
    Run Keyword If	    '${status}' == 'FAIL'           Сделать снимок экрана         ${EXECDIR}/report/Screenshot/error_${screen}.png
    Run Keyword If	    '${status}' == 'FAIL'           FAIL                ${message}