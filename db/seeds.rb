# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Creates the fixed Degrees needed to be able to Scrap.
[['Lic. en Psicología','PS'],['Prof. en Psicología','PR'],['Lic. en Musicoterapia','LM'],['Lic. en Terapia Ocupacional','TE']].each do | name, abbreviation|
  Degree.create(name: name , abbreviation: abbreviation )
end
