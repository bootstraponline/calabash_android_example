Feature: Navigation
  Users should be able to navigate the app

Background:
  Given I'm on LoginActivity
  Then I enter my "USERNAME" username
  Then I enter my "PASSWORD" password
  When I touch login
  Then I'm on HomeActivity
  Then I touch username

Scenario: Navigate to Gists
  When I touch gists
  Then I'm on GistsActivity

Scenario: Navigate to Issues
  When I touch issues
  Then I'm on IssueDashboardActivity

Scenario: Navigate to Bookmarks
  When I touch bookmarks
  Then I'm on FiltersViewActivity
