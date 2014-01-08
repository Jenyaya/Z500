Feature: Demo

  Scenario: open web page and login

    Given opened "http://www.sky.com/" page
    When I click "Sign In" link
    Then I should see Sign in page
    When I login
    When I select "No Sky TV, Broadband or Talk" option





