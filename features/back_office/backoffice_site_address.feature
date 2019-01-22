@backoffice
Feature: National grid reference and site area details are found from site postcode
  As a back office user
  I want to know the National grid refence (NGR) and area
  So that I can check the activity location for exemption restrictions

  Background:
    Given I sign in as a super agent
      

  @happy_path
  Scenario Outline: Registration by a NCCC user using a postcode for site address - NGR and area is added to registration
     When I complete a registration using postcode <postcode> for the site address
     Then I will see the EA admin area is set to <area>
      And I will see the national grid reference is set to <ngr>

     Examples:
     | postcode | area                                         | ngr          |
     | BS1 5AH  | Wessex                                       | ST5813072687 |
     | CV35 9ES | Staffordshire Warwickshire and West Midlands | SP2604755720 |
     | SA17 5AF | Outside England                              | SN4104108640 |

  @happy_path
  Scenario Outline: Registration by a NCCC user using a National Grid reference (NGR) for site address - area is added to registration
     When I complete a registration using a national grid reference <ngr> for the site address
     Then I will see the EA admin area is set to <area>

     Examples:
     | ngr           | area                                       |
     | SD4261205201  | Cumbria and Lancashire                     |
     | SJ6206087294  | Greater Manchester Merseyside and Cheshire |
