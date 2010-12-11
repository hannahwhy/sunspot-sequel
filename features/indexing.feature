Feature: Indexing Sequel models
  In order to conveniently index Sequel models using Sunspot
  Users of this library
  Need to be able to send messages to Sequel models to initiate indexing

  Scenario: #index indexes a Sequel model without committing the changes
    Given a widget with the attributes
      | name | description |
      | Bell | A shiny toy |

    When I index that widget
    And I search for a widget with "Bell"

    Then I should receive no results
    But if I call Sunspot.commit
    And I search for a widget with "Bell"
    Then I should receive the results
      | name | description |
      | Bell | A shiny toy |

  Scenario: #index! indexes a Sequel model and commits changes
    Given a widget with the attributes
      | name | description |
      | Bell | A shiny toy |

    When I index that widget and commit changes
    And I search for a widget with "Bell"

    Then I should receive the results
      | name | description |
      | Bell | A shiny toy |

  Scenario: Multiple model classes can be indexed
    Given a widget with the attributes
      | name | description |
      | Bell | A shiny toy |
    And a gadget with the attributes
      | name        | distraction |
      | Smart phone | Ridiculous  |

    When I index that widget
    And I index that gadget
    And I call Sunspot.commit
    And I search for a widget with "Bell"

    Then I should receive the results
      | name | description |
      | Bell | A shiny toy |
    And if I search for a gadget with "phone"
    Then I should receive the results
      | name        | distraction |
      | Smart phone | Ridiculous  |
