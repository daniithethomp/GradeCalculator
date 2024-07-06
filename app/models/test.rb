class Test < ApplicationRecord
  belongs_to :course_module

  attr_accessor :current_user_id

  validates :name, presence: true
  validates :course_module_id, presence: true, numericality: { only_integer: true }
  validate :validate_belongs_to_user

  def validate_belongs_to_user
    year = Year.find(CourseModule.find(self.course_module_id).year_id)
    errors.add(:course_module, "does not belong to the current user") unless year.user_id == current_user_id
  end
end
