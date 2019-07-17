class Docente < ApplicationRecord
  has_many :cursos

  def display_name
    self.nombre
  end

end
