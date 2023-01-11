# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

load(File.expand_path('../seeds/countries.rb', __FILE__))
load(File.expand_path('../seeds/cities.rb', __FILE__))
load(File.expand_path('../seeds/accounts.rb', __FILE__))


