class Test < ApplicationRecord
  belongs_to :course_module

  attr_accessor :current_user_id

  validates :name, presence: true
  validates :course_module_id, presence: true, numericality: { only_integer: true }
  validate :validate_belongs_to_user
  validates :earned_score, comparison: { less_than_or_equal_to: :max_score }, unless: ->(test) { !test.max_score.present? }
  validate :threshold_or_not
  validates :weight, presence: true, numericality:
 
  def validate_belongs_to_user
    year = Year.find(CourseModule.find(self.course_module_id).year_id)
    errors.add(:course_module, "does not belong to the current user") unless year.user_id == current_user_id
  end

  def threshold_or_not
    return if is_threshold || max_score.present?
    errors.add(:base, "Either enter a max score for this test or select threshold test")
  end
end
