require 'capybara/cucumber'
require 'capybara/poltergeist'

include Capybara::DSL

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    {
      :phantomjs_logger => "/dev/null"
    }
  )
end
