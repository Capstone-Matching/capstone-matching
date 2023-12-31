Given("I am on the new project page") do
  visit addProjects_path
end

When("I fill in {string} with {string}") do |field, value|
  first(:field, field).set(value)
end

And("I press {string}") do |button|
  click_button button
end

Then("I should see {string}") do |content|
  expect(page).to have_content(content)
end

Then("I should be on the home page") do
  expect(current_path).to eq("/projects")
end

And(/^I check the database for "([^"]*)"$/) do |arg|
  project = Project.find_by(name: arg)
  expect(project).to be_present
end