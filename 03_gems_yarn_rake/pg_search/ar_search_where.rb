#=============== AR =================

PLAIN ACTIVERECORD
Search form
Let’s add an input to filter movies in our index:

<!-- [...] -->
<%= form_tag movies_path, method: :get do %>
  <%= text_field_tag :query,
    params[:query],
    class: "form-control",
    placeholder: "Find a movie"
  %>
  <%= submit_tag "Search", class: "btn btn-primary" %>
<% end %>
<!-- the list of movies -->
Where
Let’s find movies by title:

class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.where(title: params[:query])
    else
      @movies = Movie.all
    end
  end
end
But super wont return Superman Returns

Where ILIKE
We want super to return movies with Superman in its title:

class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
I stands for case Insensitive

Searching multiple columns - Or
The term might be in the movie’s title or in its synopsis…

class MoviesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR synopsis ILIKE :query"
      @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
Searching through association - Joins
The term might also be in the director’s name:

class MoviesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        movies.title ILIKE :query \
        OR movies.synopsis ILIKE :query \
        OR directors.first_name ILIKE :query \
        OR directors.last_name ILIKE :query \
      "
      @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
Searching multiple terms - @@
If a user looks for superman batman, ILIKE won’t return anything.

class MoviesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        movies.title @@ :query \
        OR movies.synopsis @@ :query \
        OR directors.first_name @@ :query \
        OR directors.last_name @@ :query \
      "
      @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
Posgresql’s full text search with @@ to the rescue!

Searching multiple terms - @@
But superman batm won’t return anything either…

We need something stronger!