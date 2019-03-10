@frontoffice
Feature: Users outside of England are advised to register with appropriate authority
  As a waste holder
  I want to know where to register a waste activity exemption that is outside of England
  So that I know I am not making a mistake incorrectly registering in England

  Scenario: Choosing Wales as the waste activity location advises user to register with Natural Resources Wales
  	Given I start a new waste exemption registration
      And I choose Wales
     Then I will be advised to register with Natural Resources Wales
