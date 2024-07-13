class CourseModule < ApplicationRecord
  belongs_to :year
  has_many :tests, dependent: :destroy

  attr_accessor :current_user_id

  validates :module_name, presence: true
  validates :year_id, presence: true, numericality: { only_integer: true }
  validate :validate_belongs_to_user

  def validate_belongs_to_user
    year = Year.find(self.year_id)
    errors.add(:year, "does not belong to the current user") unless year.user_id == current_user_id
  end
end
