# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'net/http'

uri = URI('http://localhost:3000/posts/create')
puts "Create 5000 post. Each post - one insert.Very-very slow ~3min."
i=1
loop do
  data =  "{\"title\":\"nazvanie1#{rand(1..10000)}\",\"text\":\"test_text\",\"login\":\"user#{rand(1..100)}\",\"user_ip\":\"192.168.100.#{rand(1..50)}\",\"middle_rating\":\"#{rand(1..5)}\",\"num_of_voices\":\"#{rand(1..30)}\"}"
  Net::HTTP.post_form(uri, post: data)
  i+=1
  break if i == 5000
end
