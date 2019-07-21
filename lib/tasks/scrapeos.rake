require 'csv'
require 'colorize'
require 'pry'

namespace :scrapeos do
  desc 'Cargar en la base de datos los scrapeos'
  task cargar: :environment do
    Dir.glob('*', base: 'data') do |inscripcion|
      # Extrae la información desde el nombre de la carpeta
      datos = inscripcion.split(' - ')
      ano = datos.first
      cuatrimestre = datos.second[0]

      # Trata de crear una instancia de Inscripcion
      nueva_inscripcion = Inscripcion.find_or_create_by(cuatrimestre: cuatrimestre, ano: ano)
      puts inscripcion.colorize(:green)

      Dir.glob('*', base: "data/#{inscripcion}") do |fecha_de_scrapeo|
        puts "  L #{fecha_de_scrapeo}".colorize(:light_blue)

        Dir.glob('*', base: "data/#{inscripcion}/#{fecha_de_scrapeo}") do |csv_de_catedra|
          # En la lista hay una materia que da error, porque usan el guion 
          # en el nombre. Para eso .sub('co - Fo', 'co-Fo').
          datos_de_catedra = csv_de_catedra[0...-30].sub(' - - - ', ' - - ').sub('co - Fo', 'co-Fo').sub('vo - Co', 'vo-Co').split('- ')
          abreviatura_de_carrera = datos_de_catedra[0].try :strip
          codigo_de_catedra = datos_de_catedra[1].try :strip
          nombre_de_materia = datos_de_catedra[2].try :strip
          numero_de_catedra = datos_de_catedra[3].try :strip
          nombre_del_titular = datos_de_catedra[4].try :strip

          # Las carreras se crean con el seed.
          carrera = Carrera.find_by(abreviatura: abreviatura_de_carrera)
          materia = carrera.materias.find_or_create_by(nombre: nombre_de_materia)
          catedra = materia.catedras.create_with(numero: numero_de_catedra).find_or_create_by(codigo: codigo_de_catedra)
          titular = Titular.find_or_create_by(nombre: nombre_del_titular)
          oferta_en_lista = OfertaEnLista.create_with(titular_id: titular.id).find_or_create_by(inscripcion_id: nueva_inscripcion.id, catedra_id: catedra.id)
          puts "    L #{csv_de_catedra}".colorize(:yellow)

          cursos = CSV.read("data/#{inscripcion}/#{fecha_de_scrapeo}/#{csv_de_catedra}")

          cursos.drop(1).each do |curso|
            docente = Docente.find_or_create_by(nombre: curso[5])
            nuevo_curso = Curso.create_with(
              aula: curso[8],
              obligatorio: curso[7],
              observaciones: curso[9]
            ).find_or_create_by(
              docente_id: docente.id,
              oferta_en_lista_id: oferta_en_lista.id,
              tipo: curso[4],
              numero: curso[0],
              dia: curso[1],
              inicio: curso[2],
              fin: curso[3],
              obligatorio: curso[7]
            )
            nuevo_curso.vacantes.create(
              numero: curso[6],
              fecha: fecha_de_scrapeo
            )
            print '.'
          end
        end
      end
    end
  end
end
