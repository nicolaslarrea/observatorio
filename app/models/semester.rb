class Semester < ApplicationRecord
  has_many :courses
  
  validates :year, presence: true
  validates :number, presence: true, uniqueness: { scope: :year }

end
