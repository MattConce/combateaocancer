# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#arquivo csv encontra-se em /lib/seeds
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'recomendations.csv'))
csv = CSV.parse(csv_text, :headers=>true, :encoding=>'ISO-8859-1')

csv.each do |row|
  t = Recomendation.new
  t.type_cancer = row['type_cancer']
  t.info = row['info']
  t.save
  puts "#{t.type_cancer}, salvo"
end
