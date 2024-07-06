class CourseModule < ApplicationRecord
  belongs_to :year
  has_many :tests

  validates :module_name, presence: true
  validates :year_id, presence: true, numericality: { only_integer: true }
end
