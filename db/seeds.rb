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

if Product.count < 20
  developer_token = "71726e638c1ff0d9989da4fee0e2029a8a452ae7bf93edfa3f1eb962e5fed0cd"
  post_names = []
  (0..10).each do |days_ago|
    product_api_url = "https://api.producthunt.com/v1/posts?access_token=#{developer_token}&days_ago=#{days_ago.to_s}"
    response = HTTParty.get(product_api_url)
    response["posts"].each do |post|
      post_names << post["name"]
      id = post["id"]
      name = post["name"]
      tagline =  post["tagline"]
      created_at = DateTime.strptime(post["created_at"].split(".")[0],'%Y-%m-%dT%H:%M:%S')
      screenshot_url = post["screenshot_url"]["850px"].truncate(255)
      begin
        Product.create(id: id, name: name, tagline: tagline, created_at: created_at, screenshot_url: screenshot_url, approved: 1)
      rescue => e
        puts "#{e} \n"
      end
    end
  end
end

open("lib/assets/user_seed_data.txt").each do |line|
  line = line.split(",")
  User.create(user_name: line[0], upvotes_count: line[1], name: line[2], score: line[3], followers_count: line[4], comments_count: line[5], password: "password", email: "#{line[0]}@producthunt.com")
end


Product.create([
  {name: "Product Hunt", tagline: "The best new products, every day", product_url: "http://www.producthunt.com/", linked_in_url: "http://www.linkedin.com/in/ryanrhoover", crunchbase_url: "http://www.crunchbase.com/organization/product-hunt", location:"San Francisco, CA", screenshot_url:"http://i.imgur.com/KkWFxl5.png"}
])

