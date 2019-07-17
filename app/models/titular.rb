class Titular < ApplicationRecord
  has_many :oferta_en_listas

  validates :nombre, presence: true, uniqueness: true

  def display_name
    self.nombre
  end

end
