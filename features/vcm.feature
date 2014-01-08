Feature: VCM

  Scenario: Create a Hero Row

    Given opened "http://vcm.test.sp.bskyb.com/AppConsole/common/login.jsp" page
    When I login to VCM
    When I click "Sites" link
    When I open "SVOD/Home/Content Navigation/SKYENTERTAINMENT/Browse by Channel/Sky Living/Browse Sky Living" folder in grid

    When I click new "Channel" icon
    Then I should see "New Channel" window opened
    When I fill fields with next data:
      | Channel Name: | New 2Auto Channel |
    When I click "OK" button in the window

#    When I click "SVOD" link in grid
#    When I click "Home" link in grid
#    When I click "Content Navigation" link in grid

#   When I open "SVOD/Home/Content Navigation/SKYENTERTAINMENT/Browse by Channel/Sky Living/Browse Sky Living/Reality" folder in grid


