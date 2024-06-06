class CourseModule < ApplicationRecord
  belongs_to :year
  has_many :test, dependent: :destroy
end
