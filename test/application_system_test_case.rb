require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
  #Capybara.javascript_driver = :selenium_chrome_headless

  #Capybara.register_driver :chrome do |app|
  #    Capybara::Selenium::Driver.new(app, browser: :chrome)
  #end

  #Capybara.register_driver :headless_chrome do |app|
  #    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
  #    chromeOptions: { args: %w[headless disable-gpu window-size=1440,900] },
  #)

  #Capybara::Selenium::Driver.new app,
  #    browser: :chrome,
  #    url: "http://chromedriver:4444/",
  #    desired_capabilities: capabilities
  #end

end
