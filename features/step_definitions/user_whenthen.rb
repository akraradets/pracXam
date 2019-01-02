When("I visit {string}") do |string|
  visit string
end

When("I click {string} link") do |string|
  click_link string
end


Then("I should see the login form") do
  expect(page).to have_content "Log in"
end

Then("I filled the CSIM username and password") do
  fill_in :user_username, with: @user.username
  fill_in :user_password, with: @user.password
end

Then("I click {string} button") do |string|
  click_button string
end

Then("I should see paper page") do
  expect(page).to have_css '#paper_list'
end

Then("my name should appear on the welcome section") do
  expect(page).to have_content 'Firstname Lastname'
end

When("I select the Subject of that paper") do
  select("#{@paper.subject.code} - #{@paper.subject.name}", from: 'subject_id')
end

Then("I should see that paper") do
  expect(page).to have_content ("#{@paper.display}")
end


Then("I should see the {string} form") do |string|
  expect(page).to have_content 'New Paper'
end

Then("I filled the required fields") do
  select("#{@paper.subject.code} - #{@paper.subject.name}", from: 'paper_subject_id')
  fill_in :paper_year, with: @paper.year
  select("#{@paper.annual}", from:'paper_annual')
  select("#{@paper.month}", from:'paper_month')
  fill_in :paper_prof_name, with: @paper.prof_name
  fill_in :paper_duration, with: @paper.duration
end

Then("I uploaded the paper") do
  attach_file('paper_document', Rails.root.join('features','support','attachment','proposal.pdf'))
end


Then("I should see that paper is successfully created.") do
  expect(page).to have_content 'Paper was successfully created.'
end

When("I click that paper link") do
  find("a[href='#{paper_path(@paper)}']" , text: "#{@paper.display}").click
end

Then("I should see the subject of the paper") do
  expect(page).to have_content ("#{@paper.subject.code} - #{@paper.subject.name}")
end

Then("I should see the year and annual of the paper") do
  expect(page).to have_content ("#{@paper.year} - #{@paper.annual}")
end

Then("I should see new discussion of the paper") do
  expect(page).to have_content 'New Discussion'
end

When("I fill a discussion for that papers") do
  fill_in :discussion_content, with: @discussion.content
end

Then("I should see my discussion") do
  expect(page).to have_content ("#{@discussion.user.name}")
end

When("I should see the discussion for that paper") do
  expect(page).to have_content ("#{@discussion.content}")
end

Then("I comment on that discussion") do
  @discussion_comments = FactoryBot.build :discussion_comments
  fill_in :discussion_comment_content, with: @discussion_comments.content
end

Then("I should see my comment") do
  expect(page).to have_content ("#{@discussion_comments.user.name}")
end
