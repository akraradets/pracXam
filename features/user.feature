Feature: User

  An action that a user can perform

  Scenario: Registration/Login

    All CSIM student can login without registering to the application.

    Given I am a new CSIM user
    When I visit '/'
    Then I should see the login form
    And I filled the CSIM username and password
    And I click 'Log in' button
    Then I should see paper page
    And my name should appear on the welcome section

  Scenario: I want to search a paper with the filter.

    I can find that paper by filtering with Subject.

    Given I am a CSIM user
    And I am logged into PracXam
    And I want to find a Paper
    When I visit '/papers'
    And I select the Subject of that paper
    And I click 'Search' button
    Then I should see that paper

  Scenario: I want to upload a paper.

    I have a new Paper and I want to upload it for my junior

    Given I am a CSIM user
    And I am logged into PracXam
    And I have a paper that I want to upload
    When I click 'Upload Exam' link
    Then I should see the 'New Page' form
    And I filled the required fields
    Then I uploaded the paper
    And I click 'Save' button
    Then I should see that paper is successfully created.


  Scenario: I want to view a paper and add a discussion.

    I am going in an exam and I need to practice on previous exam

    Given I am a CSIM user
    And I am logged into PracXam
    And I have a paper that I want to view
    When I visit '/'
    When I click that paper link
    Then I should see the subject of the paper
    And I should see the year and annual of the paper
    And I should see new discussion of the paper
    When I fill a discussion for that papers
    And I click 'Save' button
    Then I should see my discussion

  Scenario: I want to write a comment on the discussion.

    I am going to write my opinion in the comment on the discussion.

    Given I am a CSIM user
    And I am logged into PracXam
    And I have a paper that I want to view
    When I visit '/'
    When I click that paper link
    And I should see the discussion for that paper
    Then I comment on that discussion
    And I click 'Save' button
    Then I should see my comment
