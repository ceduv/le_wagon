require 'sqlite3'

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  db.execute("SELECT COUNT(*) FROM artists").flatten.first
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  db.execute("SELECT COUNT(*) FROM #{table_name}").flatten.first
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  db.execute("SELECT Name FROM artists ORDER BY Name").flatten
end

def love_tracks(db)
  # TODO: return array of love songs' names
  db.execute("SELECT Name FROM tracks WHERE Name LIKE '%love%' ORDER BY Name").flatten
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  query = <<-SQL
    SELECT Name FROM tracks
    WHERE milliseconds > #{min_length} * 60000
    ORDER BY milliseconds ASC
  SQL
  db.execute(query).flatten
end
