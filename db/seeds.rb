# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Category.table_name)
categories = %w(games education business lifestyle entertainment utilities travel books music productivity health sports photo news finance food medical social_networking navigation)
categories.each do |category_name|
  Category.find_or_create_by(name: category_name)
end

json_data = open("lib/assets/product_seed_data.txt").first
rubified_data = JSON.parse(json_data, symbolize_names: true)
posts = rubified_data[:posts]
posts.each do |post|
  puts post[:name]
  puts post[:tagline]
end
