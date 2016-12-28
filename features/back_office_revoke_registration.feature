Feature: Back office user registers a customers new waste exemption activity
 As an back office user
 I want to revoke a waste exemption
 So that I can deregister the exemption activity 

 Background:
 Given I am an internal user
 And I complete a registration

 @backoffice @happy_path @wip
 Scenario: Revoking registration by NCCC user
 When I revoke a registration
 Then I will be informed the registration is revoked
