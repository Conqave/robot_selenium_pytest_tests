*** Settings ***
Documentation       This script automates the process of verifying Nokia's founding year by performing a Google search, navigating to Wikipedia, and capturing a screenshot of the relevant page.

Library             SeleniumLibrary    timeout=30 seconds
Library             String

Suite Setup         Open Browser And Handle Consent
Suite Teardown      Close Browser


*** Variables ***
${BROWSER}                  firefox
${URL}                      https://www.google.com
${SEARCH_TERM}              nokia wikipedia
${EXPECTED_YEAR}            1865
${XPATH_FOUNDING_YEAR}      //th[contains(text(),'Data założenia') or contains(text(),'Founded')]//following-sibling::td//a[contains(@href,'/wiki/1865')]
${SCREENSHOT_FILE}          nokia_wikipedia_page.png
${GECKODRIVER_PATH}         /usr/local/bin/geckodriver
${ENTER_KEY}                \\13


*** Test Cases ***
Verify Nokia Founding Year
    Perform Google Search
    Click On Wikipedia Link
    Verify Founding Year


*** Keywords ***
Open Browser And Handle Consent
    [Documentation]    Opens Firefox, handles Google consent, and maximizes the browser window.
    Open Browser    ${URL}    ${BROWSER}    executable_path=${GECKODRIVER_PATH}
    Maximize Browser Window
    Handle Google Consent

Handle Google Consent
    [Documentation]    Accepts all cookies by clicking the button with the specific id attribute.
    Wait Until Element Is Visible    id=L2AGLb    timeout=10 seconds
    Click Element    id=L2AGLb

Perform Google Search
    [Documentation]    Searches Google for the specified term.
    Input Text    name=q    ${SEARCH_TERM}
    Press Key    name=q    ${ENTER_KEY}
    Wait Until Element Is Visible    xpath=//div[@id='search']    timeout=10 seconds

Click On Wikipedia Link
    [Documentation]    Clicks on the first Nokia-related Wikipedia link in the search results.
    ${wikipedia_links}=    Get WebElements
    ...    xpath=//a[.//h3[contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'wikipedia')] and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'nokia')] | //a[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'wikipedia') and contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'nokia')]
    IF    '${wikipedia_links}' == '[]'    Fail    "No Wikipedia link found."
    Click Element    ${wikipedia_links[0]}

Verify Founding Year
    [Documentation]    Verifies Nokia's founding year on the Wikipedia page and captures a screenshot.
    Wait Until Page Contains Element    ${XPATH_FOUNDING_YEAR}    timeout=60 seconds
    ${title}=    Get Title
    Should Contain    ${title}    Nokia
    ${founding_year_text}=    Get Text    ${XPATH_FOUNDING_YEAR}
    ${founding_year}=    Convert To Integer    ${founding_year_text}
    Should Be Equal As Numbers    ${founding_year}    ${EXPECTED_YEAR}
    Capture Page Screenshot    ${SCREENSHOT_FILE}
