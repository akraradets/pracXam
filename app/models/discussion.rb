class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :paper
  has_many :comments, dependent: :destroy, :class_name => 'DiscussionComment', :foreign_key => 'discussion'
  has_many :upvotes,  dependent: :destroy, :class_name => 'DiscussionUpvote', :foreign_key => 'discussion'
  validates :content, presence: true
  def owner_name
  	self.user.name
  end

	def is_owner? check_user
    self.user == check_user
  end

  def display_created_at
  	self.created_at.strftime('%H:%M:%S %d/%m/%Y')
  end
end
