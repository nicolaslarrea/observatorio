class Semester < ApplicationRecord
  validates :year, presence: true
  validates :number, presence: true, uniqueness: { scope: :year }

end
