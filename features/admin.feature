Feature: Admin

  An action admin can do in the admin panel

  Scenario: Ban a user

    In the admin panel, admin should be able to ban a user.

    Given I am an admin
    And I want to ban a user
    And I am logged into admin panel
    When I click 'Users' page
    Then I should see Users list
    When I click 'Edit' link for that user
    Then I should see user profile
    Then I should see ban checkbox
    When I ban the user
    Then I should see that user is banned

  Scenario: See recently registered users

    In the admin panel, admin should see all recently registered users.

    Given I am an admin
    And I am logged into admin panel
    When I click 'Users/Statistic' page
    And I should see the list of the recently registered users

  Scenario: See statistics on user registrations

    In the admin panel, admin should see the registering statistic.

    Given I am an admin
    And I am logged into admin panel
    When I click 'Users/Statistic' page
    Then I should see registering summary graph
