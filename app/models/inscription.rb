class Inscription < ApplicationRecord
  validates :year, presence: true
  validates :semester, presence: true, uniqueness: { scope: :year }

end
