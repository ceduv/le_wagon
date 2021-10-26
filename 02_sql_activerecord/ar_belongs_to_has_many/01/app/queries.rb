def reversed_sorted_artists
  Artist.all.order(name: :desc)
end

def love_tracks
  Track.where('name LIKE ?', '%love%')
end

def long_tracks(min_length)
  Track.where('milliseconds > ?', min_length * 60_000)
end

def top_five_artists(genre_name)
  # TODO: return the 5 artists with the most tracks of genre `genre_name`
  Artist.select('artists.*, COUNT(tracks.name) AS track_count')
        .joins(albums: { tracks: :genre })
        .where(genres: { name: genre_name })
        .group('artists.name')
        .order('track_count DESC')
        .limit(5)
end
