Before do |scenario|
  begin
    visit('http://todomvc.com/')
    page.execute_script('localStorage.clear()')
  rescue Capybara::Poltergeist::JavascriptError
  end
end

