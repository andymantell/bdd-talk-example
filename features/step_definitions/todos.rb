Given(/^I am viewing the TodoMVC Vue example$/) do
  visit('http://todomvc.com/examples/vue/')
end

When(/^I enter a todo$/) do
  input = find('.new-todo')
  input.set('Write Futuresync slides')
  input.native.send_keys(:return)
end

Then(/^I see my todo in the list$/) do
  find('.todo-list .todo label', :text => 'Write Futuresync slides')
end

Given(/^I have (\d+) todo items in the list$/) do |number|
  input = find('.new-todo')

  number.to_i.times do
    input.set("Todo item #{number}")
    input.native.send_keys(:return)
  end

  page.assert_selector('.todo', :count => number)
end

When(/^I delete (\d+) todo items$/) do |number|
  number.to_i.times do
    first('.destroy', :visible => false, :wait => true).trigger('click')
  end
end

Then(/^I see (\d+) todo items in the list$/) do |number|
  page.assert_selector('.todo', :count => number)
end
