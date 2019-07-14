class Inscripcion < ApplicationRecord

  validates :ano, presence: true
  validates :cuatrimestre, presence: true, uniqueness: { scope: :ano }
end
