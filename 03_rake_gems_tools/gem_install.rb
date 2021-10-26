#========== GEM ============

bundle install              # list les gems


#--------------
#   ByeBug

gem install pry             # require "pry"
gem install pry-byebug      # require "pry-byebug"

#--------------
#   Sqlite3

gem install sqlite3

#--------------
# ActiveRecord

gem install activerecord -v 6.0

#---------------
# Bunch of data

gem install faker
#---
# https://github.com/faker-ruby/faker#faker
# https://kitt.lewagon.com/camps/730/lectures/03-AR-Database%2F03-ActiveRecord-Basics#source
Faker::Address / Faker::Name / Faker::Lorem
Faker::Business / Faker::Commerce / Faker::Company
Faker::Internet / Faker::Number / Faker::PhoneNumber
#---

gem install rest-client
#---
require "json"
require "rest-client"
response = RestClient.get "https://api.github.com/users/lewagon/repos"
repos = JSON.parse(response)    # => repos is an `Array` of `Hashes`.
repos.size
#---