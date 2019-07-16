class Catedra < ApplicationRecord
  belongs_to :materia
  has_many :oferta_en_listas
  has_many :inscripciones, through: :oferta_en_listas

  validates :codigo, presence: true, uniqueness: true
end
