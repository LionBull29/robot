*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
open browser and maximize
    [Arguments]  ${UserUrl}   ${BrouserName}
    open browser  ${UserUrl}    ${BrouserName}
    maximize browser window
    log     BrouserName:${BrouserName}
    log     url:${UserUrl}

Login To Window

    [Arguments]  ${User}    ${Password}
    input text   id:user-name   ${User}
    input text  name:password   ${Password}
    click button    id:login-button
    page should not contain element   class:error-message-container
