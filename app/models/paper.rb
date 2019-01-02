class Paper < ApplicationRecord
  scope :subject, -> (subject_id) {where subject_id: subject_id}
  scope :year, -> (year) { where year: year }
  scope :annual, -> (annual) { where annual: annual }
  scope :month, -> (month) { where month: month }

  has_attached_file :document, :url => '/system/:class/:attachment/:id/:filename'
  validates :document, :attachment_content_type => { :content_type => ["application/pdf"]}

  has_paper_trail 
  has_many :reports,      dependent: :destroy, :class_name => 'PaperReport', :foreign_key => 'paper_id'
  has_many :difficulties, dependent: :destroy, :class_name => 'PaperDifficulty', :foreign_key => 'paper_id'
  has_many :feedbacks,    dependent: :destroy, :class_name => 'PaperFeedback', :foreign_key => 'paper_id'
  has_many :discussions,  dependent: :destroy
  belongs_to :user 
  belongs_to :subject

  validates :year, :month, :annual, :prof_name, :duration, presence: true
  validates :subject, uniqueness: { scope: [:year, :month, :annual], message: "Duplicate Paper" }

  def count_difficulty
    self.difficulties.group(:rate).count
  end

  def avg_difficulty
    avg = self.difficulties.average(:rate)
    if avg.nil?
      return 0
    else
      return avg.to_d.round
    end
  end

  def map_difficulty(value)
    difMap =  ["No Rating", "Super Easy",  "Easy",  "Fair",  "Hard",  "Too Hard"]
    return difMap[value]
  end

  def count_feedback
    self.feedbacks.group(:feedback).count
  end

  def is_owner? check_user
    self.user == check_user
  end

  def display
    "#{self.year} - #{self.month} - #{self.annual}"
  end
end
