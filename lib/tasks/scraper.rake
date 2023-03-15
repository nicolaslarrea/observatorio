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

  current_semester = Semester.find_or_create_by(year: year, number: number)
  puts "Año #{current_semester.year} cuat #{current_semester.number}".yellow.bold
end

def get_subjects
  url = "http://academica.psi.uba.ar/Psi/"
  begin
    subjects_page = Nokogiri::HTML(URI.open("#{url}Ope154_.php"))
  rescue StandardError=>e
    puts "No pude conectar reintentando..."
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

          puts "  #{degree.abbreviation} - #{current_subject.code} #{current_subject.name} #{current_subject.chair}".green
        end
      }
    }
  end
end
