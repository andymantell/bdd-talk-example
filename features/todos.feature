Feature: Basic todo list manipulation

  Scenario: Entering a single todo item
    Given I am viewing the TodoMVC Vue example
    When I enter a todo
    Then I see my todo in the list

  Scenario: Deleting a todo item
    Given I am viewing the TodoMVC Vue example
    And I have 1 todo items in the list
    When I delete 1 todo items
    Then I see 0 todo items in the list

  Scenario: Deleting several todo items
    Given I am viewing the TodoMVC Vue example
    And I have 7 todo items in the list
    When I delete 4 todo items
    Then I see 3 todo items in the list

  Scenario Outline: Deleting a todo item
    Given I am viewing the TodoMVC Vue example
    And I have <start> todo items in the list
    When I delete <delete> todo items
    Then I see <result> todo items in the list

    Examples:
      | start | delete | result |
      | 1     | 1      | 0      |
      | 5     | 5      | 0      |
      | 10    | 5      | 5      |
      | 7     | 4      | 3      |
      | 100   | 99     | 1      |
