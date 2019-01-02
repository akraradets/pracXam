class PaperReport < ApplicationRecord
  belongs_to :paper
  belongs_to :reporter, :class_name => 'User'

  validates :reporter, uniqueness: { scope: [:paper], message: "Duplicate Paper Report" }
end
