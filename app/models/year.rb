class Year < ApplicationRecord
  belongs_to :user
  has_many :course_modules, dependent: :destroy

  validates :year_number, presence: true, numericality: { only_integer: true}, comparison: { greater_than: 0}, uniqueness: { scope: :user_id }
end
