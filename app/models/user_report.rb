class UserReport < ApplicationRecord
  belongs_to :user
  belongs_to :reporter, :class_name => 'User'
end
