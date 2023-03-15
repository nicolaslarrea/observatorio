namespace :scraper do
  desc 'Scraps and updates Db'

  task run: :environment do
    get_semester

    get_subjects
  end
end

def get_semester
  year = Time.now.year
  number = Time.now.month <= 6 ? 1 : 2

  @current_semester = Semester.find_or_create_by(year: year, number: number)
  puts "Año #{@current_semester.year} cuat #{@current_semester.number}".yellow.bold
end

def get_subjects
  url = "http://academica.psi.uba.ar/Psi/"
  begin
    subjects_page = Nokogiri::HTML(URI.open("#{url}Ope154_.php"))
  rescue StandardError=>e
    puts "No pude conectar con la página #{subjects_page} reintentando..."
    sleep 1
    retry
  else
    Degree.all.each {|degree|
      subjects_page.css("##{degree.abbreviation}").search('tr').map {|row|
        if row.search('td').count == 4
          code = row.search('td')[0].content.strip
          name = row.search('td')[1].content.gsub("/","-").strip
          chair = row.search('td')[2].content.strip 

          current_subject = Subject.find_or_create_by(code: code, name: name, degree: degree) do |subject|
            subject.chair = chair
          end

          print "  #{degree.abbreviation} - #{current_subject.code} #{current_subject.name} #{current_subject.chair}".green
          get_courses(current_subject)
        end
      }
    }
  end
end

def get_courses(subject)
  begin
    courses_page = Nokogiri::HTML(URI.open("http://academica.psi.uba.ar/Psi/Ver154_.php?catedra=#{subject.code}"))
  rescue StandardError=>e
    puts "No pude encontrar la materia #{subject.code}, reintentando..."
    sleep 1
    retry
  else
    courses_page.css('table').search('tr').each {|row|
      if row.search('td').count == 10
        Course.create(     
        number: row.search('td')[0].content.gsub(/[[:space:]]/," ").strip,
        day: row.search('td')[1].content.gsub(/[[:space:]]/," ").strip,
        starts_at: row.search('td')[2].content.gsub(/[[:space:]]/," ").strip,
        ends_at: row.search('td')[3].content.gsub(/[[:space:]]/," ").strip,
        kind: row.search('td')[4].content.gsub(/[[:space:]]/," ").strip,
        teacher: row.search('td')[5].content.gsub(/[[:space:]]/," ").strip, 
        vacancy: row.search('td')[6].content.gsub(/[[:space:]]/," ").strip,
        mandatory: row.search('td')[7].content.gsub(/[[:space:]]/," ").strip,
        classroom: row.search('td')[8].content.gsub(/[[:space:]]/," ").strip,
        observations: row.search('td')[9].content.gsub(/[[:space:]]/," ").strip,
        subject: subject,
        semester: @current_semester
        )     
        print ".".green
      end
    }
    puts
  end
end