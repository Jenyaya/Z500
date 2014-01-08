#require '../support/capydriver'


Given /^opened "(.*)" page$/ do |url|
  visit url
end

When /^I click "(.*)" link$/ do |link|
  click_link link
end

Then /^I should see (Sign in) page$/ do |signin_page|
  page.should have_content(signin_page)
end

When /^I login$/ do
  fill_in 'Username', :with => 'unl'
  fill_in 'Password', :with => 'test1234'
  click_button('Sign in')
end


Then /^I should see the current date$/ do
  page.should have_content(Date.today)
end


When /I select "(.*)" option/ do |option|
  choose option
end


When /I enter "(.*)" to google search/ do |search|

  fill_in 'q', :with => search


end

When /^I click "(.*)" button$/ do |button|
  click_button(button)
end

When /^I login to VCM$/ do
  find(:xpath, "//input[@name='j_username']").set('vgnadmin')
  find(:xpath, "//input[@name='j_password']").set('vignette')
  click_button('Login')
end



When /^I fill fields with next data:$/ do |fields|

  fields.raw.each do |name, value|
    step %{I fill in "#{name}" with "#{value}"}
  end

end

When /^I fill in "(.*)" with "(.*)"$/ do |field, data|
  fill_in field, :with => data
end

When /^I reset session$/ do
  Capybara.reset_session!
end


