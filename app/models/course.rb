class Course < ApplicationRecord
  belongs_to :semester
  belongs_to :subject
  belongs_to :scrap
end
