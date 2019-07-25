class Carrera < ApplicationRecord

  has_many :materias

  validates :nombre, presence: true, uniqueness: true
  validates :abreviatura, presence: true, uniqueness: true

  def display_name
    self.nombre
  end

end
