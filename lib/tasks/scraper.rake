require 'nokogiri'
require 'open-uri'

namespace :scraper do
  desc 'Scrapear y pasar a Db'

  task run: :environment do
    get_inscription
  end
end

def get_inscription
  year = Time.now.year
  semester = Time.now.month <= 6 ? 1 : 2

  Inscription.find_or_create_by(year: year, semester: semester)
end
