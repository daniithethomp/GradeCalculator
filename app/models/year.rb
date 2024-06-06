class Year < ApplicationRecord
  belongs_to :user
  has_many :module, dependent: :destroy

  validates :number, presence: true
  validates :number, numericality: { only_integer: true }
  validates :number, uniqueness: { scope: :user_id }
end
