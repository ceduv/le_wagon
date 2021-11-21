#=========== ELASTIK ============

Elasticsearch
When use it?
You need one or more of these features:

Scoring complexity (boost some fields)
Misspelling
Suggestions
Highlighting
Aggregations
Autocomplete
Geo-aware search
Infrastructure
You need to install ElasticSearch on each developer’s workstation + on Heroku.


# OSX
brew install elasticsearch
brew services start elasticsearch
or Ubuntu
https://kitt.lewagon.com/knowledge/tutorials/elasticsearch_ubuntu

On Heroku
You can use the Bonsai addon.

heroku addons:create bonsai
heroku config:set ELASTICSEARCH_URL=`heroku config:get BONSAI_URL`
searchkick gem
github.com/ankane/searchkick

# Gemfile
gem 'elasticsearch', "< 7.14" # to use a supported version of the Elasticsearch Ruby client
gem 'searchkick', '~> 4.0'
bundle install
# app/models/movie.rb
class Movie < ApplicationRecord
  searchkick
  # [...]
end
# Launch a `rails c`
Movie.reindex
results = Movie.search("superman")
results.size
results.any?
results.each do |result|
  # [...]
end