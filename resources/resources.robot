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
    Sleep    2
    input text  name:password   ${Password}
    Sleep    2
    click button    id:login-button
    Sleep    2
    page should not contain element   class:error-message-container
    element should contain   class:footer_copy   © 2022 Sauce Labs. All Rights Reserved. Terms of Service | Privacy Policy