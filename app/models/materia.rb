class Materia < ApplicationRecord
  belongs_to :carrera
  has_many :catedras

  validates :nombre, presence: true, uniqueness: { scope: :carrera }
end
