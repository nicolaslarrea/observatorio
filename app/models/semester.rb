class Semester < ApplicationRecord
  has_many :courses
  has_many :scraps

  validates :year, presence: true
  validates :number, presence: true, uniqueness: { scope: :year }

end
