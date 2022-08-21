*** Settings ***
Library    SeleniumLibrary
Resource  ../resources/resources.robot
*** Variables ***
${url}  https://www.saucedemo.com/
${browser}  Chrome

${standard_user}    standard_user
${Password}     secret_sauce

*** Test Cases ***
Первый текст-кейс
    [Setup]    open browser and maximize   ${url}    ${browser}
    [Teardown]    close browser
    #select radio button  add_type   Home
    #select checkbox     name:terms
    #unselect checkbox  name:terms
    #click link      xpath:
    #clear element text    name:user-name
    #go back
    Login To Window     ${standard_user}   ${Password}
    Click Button    xpath: //*[@id="add-to-cart-sauce-labs-backpack"]
    Sleep    2
    Click Button    xpath: //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Sleep    2
    Capture Page Screenshot




#Второй текст-кейс


