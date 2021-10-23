require 'sqlite3'
db = SQLite3::Database.new("lib/db/jukebox.sqlite")

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  db.execute("SELECT * FROM artists").count
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  db.execute("SELECT * FROM #{table_name}").count
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  db.execute("SELECT name FROM artists ORDER BY name ASC").flatten
end

def love_tracks(db)
  # TODO: return array of love songs' names
  db.execute("SELECT name FROM tracks WHERE name LIKE '%love%'").flatten
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  db.execute("SELECT name FROM tracks WHERE milliseconds > '#{min_length * 60_000}' ORDER BY milliseconds ASC").flatten
end
