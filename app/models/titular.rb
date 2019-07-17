class Titular < ApplicationRecord
  has_many :oferta_en_listas

  validates :nombre, presence: true, uniqueness: true
end
