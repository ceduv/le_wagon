#=========== SCOPE ==============

The pg_search_scope method takes 2 arguments:

the first one is a Symbol and defines the name of the method you’ll call on your model to operate the search
the second one is a Hash to setup the search options
class Movie < ApplicationRecord
  # [...]
  include PgSearch
  pg_search_scope :search_by_title_and_syllabus, {
    against: [ :title, :syllabus ] <-- will lookup the search term in those columns
  }
end