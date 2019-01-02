class DiscussionComment < ApplicationRecord
  belongs_to :user
  belongs_to :discussion
  validates :content, presence: true
	def owner_name
  	self.user.name
  end

	def is_owner? check_user
    self.user == check_user
  end

end
