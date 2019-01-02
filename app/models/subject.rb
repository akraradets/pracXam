class Subject < ApplicationRecord
  scope :id, -> (id) { where id: id }
  scope :cs_required, -> (cs_required) { where cs_required: cs_required }
  scope :im_required, -> (im_required) { where im_required: im_required }
  # scope :location, -> (location_id) { where location_id: location_id }
  # scope :starts_with, -> (name) { where("name like ?", "#{name}%")}

  has_paper_trail
  has_many :papers

  validates :code, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true

  before_destroy do
    cannot_delete_with_papers
    throw(:abort) if errors.present?
  end
  
  def cannot_delete_with_papers
    errors.add(:base, "#{self.display} has #{self.papers.count} papers under it. Destroy is not permitted.") if papers.any?
  end

  def display
    "#{self.code} - #{self.name}"
  end
end
