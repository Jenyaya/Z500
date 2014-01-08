When /^I open "(.*)" folder in grid$/ do |path|
  path = path.split('/')
  within('#table_gridList_VignConsoleForm') do
    path.each { |link| click_link link }
  end

end

Then /^I should see "(.*)" window opened$/ do |window|
  new_window = nil
  new_window = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window new_window
  page.should have_css('h1', :text => window)
end

When /I click new "(.*)" icon/ do |link|
  page.execute_script("document.getElementById('href_commonimagestoolbaraddgifChannel_VignConsoleForm').click()")
end