$init_script_run = false

Before do |scenario|
  unless $init_script_run
    $init_script_run = true

    FileUtils.rm_rf(Dir.glob('screenshots/*'))
  end

  begin
    visit('http://todomvc.com/page-that-doesnt-exist')
    page.execute_script('localStorage.clear()')
  rescue Capybara::Poltergeist::JavascriptError
  end
end

After do |scenario|
  if scenario.failed?
    p "Scenario failed, screenshot generated."
    time = Time.now.strftime('%Y_%m_%d_%H_%M_%S_')
    name_of_scenario = time + scenario.name.gsub(/\s+/, "_").gsub("/","_")
    save_screenshot("screenshots/#{name_of_scenario}.png", full: true)
  end
end
