class Subject < ApplicationRecord
  belongs_to :degree

  validates :code, presence: true, uniqueness: { scope: :degree }
  validates :name, presence: true

end
