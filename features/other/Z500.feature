Feature: Z500

  Scenario: Download projects in PDF from z500.pl

    Given opened "http://www.z500.pl/domy.html" page
  #    When I set search filter with:
  #      | tylko parterowe | yes |

  #  When I click 'Szukaj' button
    Then I should see list of plans
    When I parse HTML
    #Then I download PDFs

When I browse search pages




