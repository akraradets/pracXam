Given("I am an admin") do
  @admin = FactoryBot.create :admin
end

Given("I am logged into admin panel") do
  visit '/admin'
  expect(page).to have_content('PracXam Admin Panel Login')
  fill_in('Username', with: 'admin')
  fill_in('Password', with: 'password')
  click_button('Login')
end

Given("I want to ban a user") do
  @user = FactoryBot.create :user
end