Then("I should see admin dashboard") do
  expect(page).to have_content('PracXam Admin Panel')
  expect(page).to have_content('Dashboard')
end

Then("I should see the list of the recently registered users") do
  expect(page).to have_content('Your New Users')
end

When("I click {string} page") do |string|
  # enter the root page
  if string.split('/').count == 1
    click_link string
  else
  # enter the sub page
    # href="/admin/user_statistic"
    s = string.split '/'
    find_link(href: "/admin/#{s[0]}_#{s[1]}".downcase).click
  end
end

When("I click {string} link for that user") do |string|
  find_link(string, href: "/admin/users/"+@user.id.to_s+"/edit").click
end

Then("I should see Users list") do
  expect(page).to have_selector('table#index_table_users')
end

Then("I should see user profile") do
  expect(page).to have_content 'Edit User'
  expect(page).to have_content(@user.name)
end

Then("I should see ban checkbox") do
  expect(page).to have_content 'Banned'
  expect(page).to have_selector('input#user_banned')
end

When("I ban the user") do
  find(:css, "input#user_banned").set(true)
  click_button 'Update User'
end

Then("I should see that user is banned") do
  expect(page).to have_selector('tr.row-banned td span.yes')
end

Then("I should see registering summary graph") do
  expect(page).to have_content "Registering Summary"
end
