class PaperDifficulty < ApplicationRecord
  validates :rater, uniqueness: { scope: [:paper], message: "Duplicate Rate" }

  belongs_to :paper
  belongs_to :rater, :class_name => 'User'
end
