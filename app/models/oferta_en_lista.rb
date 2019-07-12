class OfertaEnLista < ApplicationRecord
  belongs_to :inscripcion
  belongs_to :catedra
  belongs_to :titular
end
