class User < ApplicationRecord
    has_secure_password
    has_many :years, dependent: :destroy

    validates :username, presence: true
    validates :username, uniqueness: true
end
