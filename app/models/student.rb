class Student < ApplicationRecord
  has_many :ducks

  validates :name, presence: true
  
end
