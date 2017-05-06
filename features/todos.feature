Feature: Basic todo list manipulation

  Scenario: Entering a single todo item
    Given I am viewing the TodoMVC Vue example
    When I enter a todo
    Then I see my todo in the list
