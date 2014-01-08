

When /^(.*) in the window/ do |step_def|
  step step_def
  main_window = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window main_window

  sleep(10)
end

