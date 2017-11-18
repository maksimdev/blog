# README

Blog.
-Ruby 2.3.1p112
-Rails 5.0.6
-PostgreSQL 9.5

Install:
# Create and migrate database.
  rake db:create && rake db:migrate
# Start puma
  rails s
# Create fake data in database.
  rake db:seed

Curl:
# Get sorted list by middle_rating
  curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://localhost:3000/posts/index?number=4
# Get list with uniq ip and ununiq users
  curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://localhost:3000/posts/list
# Create post
  curl -i -X POST -H "Content-Type: application/json" -d "{\"post\":\"{\\"\"login\\"\":\\"\"newuser\\"\",\\"\"title\\"\":\\"\"FirstTitle\\"\",\\"\"text\\"\":\\"\"helloworld\\"\"}\"}" http://localhost:3000/posts/create
# Set rating
  curl -i -X POST -H "Content-Type: application/json" -d "{\"data\":\"{\\"\"id\\"\":\\"\"1\\"\",\\"\"rating\\"\":\\"3\\"}\"}" http://localhost:3000/ratings/create

