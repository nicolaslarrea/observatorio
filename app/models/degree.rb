class Degree < ApplicationRecord
  has_many :subjects

  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, uniqueness: true
end
