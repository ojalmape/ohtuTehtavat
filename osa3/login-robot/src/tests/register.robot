*** Settings ***
Resource    resource.robot

*** Test Cases ***
Register With Valid Username And Password
    Input New Command
    Input Credentials    matilda    salasana123
    Output Should Contain    New user registered

Register With Already Taken Username And Valid Password
    Create User  kalle  kalle123
    Input New Command
    Input Credentials  kalle  salasana123
    Output Should Contain  Username already exists

Register With Too Short Username And Valid Password
    Input New Command
    Input Credentials  ma  ma123456
    Output Should Contain  Username is too short

Register With Enough Long But Invalid Username And Valid Password
    Input New Command
    Input Credentials  maa1  salasana12
    Output Should Contain  Invalid username

Register With Valid Username And Too Short Password
    Input New Command
    Input Credentials  kalle  kalle1
    Output Should Contain  Password is too short

Register With Valid Username And Long Enough Password Containing Only Letters
    Input New Command
    Input Credentials  kalle  salasana
    Output Should Contain  Invalid password