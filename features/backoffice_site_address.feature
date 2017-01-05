@backoffice @wip
Feature: National grid reference and site area details are found from site postcode
  As a back office user
  I want to know the National grid refence (NGR) and area
  So that I can check the activity location for exemption restrictions

  Background:
    Given I am an internal user
      And I have a valid username and password

  @happy_path
  Scenario Outline: Registration by a NCCC user using a postcode for site address - NGR and area is added to registration
     When I complete a registration using postcode <postcode> for the site address
     Then I will see the site's National Grid Reference has been automatically found to be <ngr>
     And I will see the EA admin area is set to <area>

     Examples:
     | postcode | ngr           | area                                         |
     | BS1 5AH  | ST5813072687  | wessex                                       |
     | CV35 9ES | SP2518455455  | Staffordshire Warwickshire and West Midlands |
     | SA17 5AF | SN4104108640  | Outside England                              |
