class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, :api_key

  has_secure_password

  has_many :favorites
end
