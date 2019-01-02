FactoryBot.define do
  factory :admin, class: AdminUser do
    username 'admin'
    password 'password'
  end

  factory :user, class: User do
    id 100
    username 'username'
    password 'password'
    title 'CSIM Student'
    name 'Firstname Lastname'
    user_type 'Student'
    email 'user@email.com'
    score 50
    banned false
  end

  factory :paper, class: Paper do
    id 100
    year '2018'
    month 'January'
    annual 'Midterm'
    prof_name 'Prof.Matt'
    duration '180'
    open_book true
    open_network true
    user_id 100
    subject_id 100

  end

  factory :subject, class: Subject do
    id 100
    code 'A'
    name 'WAE'
  end

  factory :discussion, class: Discussion do
    id 100
    user_id 100
    paper_id 100
    content "Testing Discussion"
  end

  factory :discussion_comments, class: DiscussionComment do
    id 100
    user_id 100
    discussion_id 100
    content "Testing Comment"
  end
end
