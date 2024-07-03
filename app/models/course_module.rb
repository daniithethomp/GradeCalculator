class CourseModule < ApplicationRecord
  belongs_to :year
  has_many :tests
end
