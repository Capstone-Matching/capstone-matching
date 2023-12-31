When("the user goes to the homepage") do
  visit root_path
end

Then("they should see {string}") do |content|
  expect(page).to have_content(content)
end

Then("they should see a {string} button") do |button_text|
  expect(page).to have_button(button_text)
end

When("the user clicks the Login with Google button") do
  click_button('Login with Google')
end

When("the user clicks the {string} button") do |button_text|
  click_button (button_text)
end

Then("they should be redirected to the sign in page") do
  visit google_login_path
  expect(page).to have_current_path(google_login_path)
end

Then("they should be redirected to the professor registration page") do
  visit profregistration_path
  expect(page).to have_current_path(profregistration_path)
end

When("the user scrolls to the footer") do
  # You may not need to perform any specific action here for this example.
end

Then("they should see the copyright information {string}") do |copyright_text|
  expect(page).to have_content(copyright_text)
end
