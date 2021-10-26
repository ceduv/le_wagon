require 'sqlite3'
db = SQLite3::Database.new("lib/db/jukebox.sqlite")

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  db.execute("SELECT tracks.name, albums.title, artists.name
    FROM albums
    JOIN tracks ON tracks.album_id = albums.id
    JOIN artists ON artists.id = albums.artist_id")
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
