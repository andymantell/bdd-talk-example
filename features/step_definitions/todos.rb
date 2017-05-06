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
