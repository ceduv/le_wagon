#============ PG SEARCH ===============

doc: https://github.com/Casecommons/pg_search

PG SEARCH
pg_search gem
github.com/Casecommons/pg_search

# Gemfile
gem 'pg_search', '~> 2.3.0'
Searching one model (scope)
class Movie < ApplicationRecord
  # [...]
  include PgSearch::Model
  pg_search_scope :search_by_title_and_synopsis,
    against: [ :title, :synopsis ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
# rails c
> Movie.search_by_title_and_synopsis("superman batm")
You can add weighting
to each field searched.

Searching through association
We want chris nolan to return Nolan’s movies:

class Movie < ApplicationRecord
  belongs_to :director
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :synopsis ],
    associated_against: {
      director: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
What about our tv_shows table 🤔

Multi-search - Setup
rails g pg_search:migration:multisearch
rails db:migrate
class Movie < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :synopsis]
end

class TvShow < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :synopsis]
end
Multi-search - Usage
# rails c
PgSearch::Multisearch.rebuild(Movie)
PgSearch::Multisearch.rebuild(TvShow)
results = PgSearch.multisearch('superman')

results.each do |result|
  puts result.searchable
end
Returns a polymorphic collection, watch out when you handle them in your views