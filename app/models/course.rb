class Course < ApplicationRecord
  belongs_to :semester
  belongs_to :subject
end
