class Monster < ApplicationRecord
  validates :name, :birthdate, presence: true
  has_many :tweets
end
