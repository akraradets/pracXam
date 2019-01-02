Given("I am a new CSIM user") do
  @user = FactoryBot.build :user
end

Given("I am a CSIM user") do
  @user = FactoryBot.create :user
end

Given("I am logged into PracXam") do
  visit '/users/sign_in'
  expect(page).to have_content('Log in')
  fill_in :user_username, with: @user.username
  fill_in :user_password, with: @user.password
  click_button('Log in')
end

Given("I want to find a Paper") do
  @subject = FactoryBot.create :subject
  @paper = FactoryBot.create :paper
end

Given("I have a paper that I want to upload") do
  @subject = FactoryBot.create :subject
  @paper = FactoryBot.build :paper
end

Given("I have a paper that I want to view") do
  @subject = FactoryBot.create :subject
  @paper = FactoryBot.create :paper
  @discussion = FactoryBot.create :discussion
end
