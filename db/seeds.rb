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
  {name: "Product Hunt", tagline: "The best new products, every day", product_url: "http://www.producthunt.com/", linked_in_url: "http://www.linkedin.com/in/ryanrhoover", crunchbase_url: "http://www.crunchbase.com/organization/product-hunt", location:"San Francisco, CA", screenshot_url:"http://i.imgur.com/KkWFxl5.png", product_logo:"http://i.imgur.com/w9iAxEd.png"},
  {name: "Facebook", tagline: "Social utility that connects people with friends", product_url: "http://www.facebook.com/", linked_in_url: "", crunchbase_url: "http://www.crunchbase.com/", location:"", screenshot_url:"http://i.imgur.com/KkWFxl5.png", product_logo:""},
  {name: "Twitter", tagline: "Connect with your friends", product_url: "http://www.twitter.com/", linked_in_url: "https://www.linkedin.com/", crunchbase_url: "http://www.crunchbase.com/", location:"", screenshot_url:"http://i.imgur.com/KkWFxl5.png", product_logo:""},
  {name: "Sendgrid", tagline: "World's largest Email Infrastructure as a Service provider", product_url: "http://www.sendgrid.com/", linked_in_url: "https://www.linkedin.com/", crunchbase_url: "http://www.crunchbase.com/", location:"", screenshot_url:"http://i.imgur.com/KkWFxl5.png", product_logo:""},
  {name: "Apple", tagline: "Creates the iPhone, iPad, Mac notebooks and desktop computers", product_url: "http://www.apple.com/", linked_in_url: "https://www.linkedin.com/", crunchbase_url: "http://www.crunchbase.com/", location:"", screenshot_url:"http://i.imgur.com/KkWFxl5.png", product_logo:""},
  {name: "Reddit", tagline: "User-generated news links", product_url: "http://www.reddit.com/", linked_in_url: "https://www.linkedin.com/", crunchbase_url: "http://www.crunchbase.com/", location:"", screenshot_url:"http://i.imgur.com/KkWFxl5.png", product_logo:""},
  {name: "YC Combinator", tagline: "Created a new model for funding early stage startups", product_url: "http://www.ycombinator.com/", linked_in_url: "https://www.linkedin.com/", crunchbase_url: "http://www.crunchbase.com/", location:"", screenshot_url:"http://i.imgur.com/KkWFxl5.png", product_logo:""},
  {name: "Firefox", tagline: "Free Web browser", product_url: "http://www.firefox.com/", linked_in_url: "https://www.linkedin.com/", crunchbase_url: "http://www.crunchbase.com/", location:"", screenshot_url:"http://i.imgur.com/KkWFxl5.png", product_logo:""},
  {name: "Google", tagline: "Search the world's information", product_url: "http://www.google.com/", linked_in_url: "https://www.linkedin.com/", crunchbase_url: "http://www.crunchbase.com/", location:"", screenshot_url:"http://i.imgur.com/KkWFxl5.png", product_logo:""},
  {name: "Yahoo", tagline: "Discover the news and information", product_url: "http://www.yahoo.com/", linked_in_url: "https://www.linkedin.com/", crunchbase_url: "http://www.crunchbase.com/", location:"", screenshot_url:"http://i.imgur.com/KkWFxl5.png", product_logo:""}
])

