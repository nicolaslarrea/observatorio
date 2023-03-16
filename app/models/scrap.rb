class Scrap < ApplicationRecord
  belongs_to :semester
  has_many :courses
end
