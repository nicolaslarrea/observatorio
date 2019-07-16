# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Crear las carreras que no pueden ser generadas por scrapeo.
[['Lic. en Psicología','PS'],['Prof. en Psicología','PR'],['Lic. en Musicoterapia','LM'],['Lic. en Terapia Ocupacional','TE']].each do | nombre, abreviatura|
  Carrera.create(nombre: nombre , abreviatura: abreviatura )
end
