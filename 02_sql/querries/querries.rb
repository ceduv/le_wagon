require 'sqlite3'
db = SQLite3::Database.new("lib/db/jukebox.sqlite")
#  "albums" (
#   `id`    INTEGER NOT NULL,
#   `title` NVARCHAR(160) NOT NULL,
#   `artist_id`     INTEGER NOT NULL,
#   PRIMARY KEY(id)
# );
#  "artists" (
#   `id`    INTEGER NOT NULL,
#   `name`  NVARCHAR(120),
#   PRIMARY KEY(id)
# );
#  "genres" (
#   `id`    INTEGER NOT NULL,
#   `name`  NVARCHAR(120),
#   PRIMARY KEY(id)
# );
#  "media_types" (
#   `id`    INTEGER NOT NULL,
#   `name`  NVARCHAR(120),
#   PRIMARY KEY(id)
# );
#  "tracks" (
#   `id`    INTEGER NOT NULL,
#   `album_id`      INTEGER,
#   `media_type_id` INTEGER NOT NULL,
#   `genre_id`      INTEGER,
#   `name`  NVARCHAR(200) NOT NULL,
#   `composer`      NVARCHAR(220),
#   `milliseconds`  INTEGER NOT NULL,
#   `bytes` INTEGER,
#   `unit_price`    NUMERIC(10,2) NOT NULL,
#   PRIMARY KEY(id)

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

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  db.execute("SELECT tracks.name, albums.title, artists.name FROM albums JOIN tracks ON tracks.album_id = albums.id JOIN artists ON artists.id = albums.artist_id")
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  result = db.execute("SELECT genres.name, COUNT(tracks.id), AVG(tracks.milliseconds)
  FROM tracks
  JOIN genres ON genres.id = tracks.genre_id
  WHERE genres.name = '#{genre_name}'").flatten
  avg = result[2] / 60_000
  hash = { avg_length: avg.round(2), category: result[0], number_of_songs: result[1] }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  db.execute("SELECT artists.id, artists.name, COUNT(tracks.id) as cnt
  FROM tracks
  JOIN genres ON genres.id = tracks.genre_id
  JOIN albums ON albums.id = tracks.album_id
  JOIN artists ON artists.id = albums.artist_id
  WHERE genres.name LIKE '#{genre_name}'
  GROUP BY artists.name
  ORDER BY cnt DESC
  LIMIT 5")
end