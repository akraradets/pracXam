class DiscussionUpvote < ApplicationRecord
  belongs_to :discussion
  belongs_to :voter, :class_name => 'User'
end
