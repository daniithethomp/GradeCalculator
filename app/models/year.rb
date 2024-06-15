class Year < ApplicationRecord
  belongs_to :user
  has_many :course_modules
end
