class Subject < ApplicationRecord
  belongs_to :degree
  has_many :courses

  validates :code, presence: true, uniqueness: { scope: :degree }
  validates :name, presence: true

end
