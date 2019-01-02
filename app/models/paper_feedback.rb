class PaperFeedback < ApplicationRecord
  belongs_to :paper
  belongs_to :provider, :class_name => 'User'
end
