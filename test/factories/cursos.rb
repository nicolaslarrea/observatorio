FactoryBot.define do
  factory :curso do
    oferta_en_lista { nil }
    docente { nil }
    tipo { "MyString" }
    numero { "MyString" }
    dia { "MyString" }
    inicio { "MyString" }
    fin { "MyString" }
    obligatorio { "MyString" }
    aula { "MyString" }
    observaciones { "MyString" }
  end
end
