# Define your list of tracks (replace with actual track URIs)
variable "track_uris" {
  type    = list(string)
  default = [
    "spotify:track:34XwFfq1XGOF0HHyVQl1nx?si=e011f5edd0a84927", #https://open.spotify.com/track/34XwFfq1XGOF0HHyVQl1nx?si=e011f5edd0a84927 #https://open.spotify.com/episode/7wZADfPEagWXZc10pApE7l?si=IJGYJHD6Rk2RBR-WUQpygg
    "spotify:track:0WtM2NBVQNNJLh6scP13H8?si=baab4b58ecff44be", #spotify:track:TRACK_URI_1 #https://open.spotify.com/track/0WtM2NBVQNNJLh6scP13H8?si=baab4b58ecff44be
    "spotify:track:0CQPPHjPpG4kAzvfOcKvh8?si=26047b4113d14b1f", 3https://open.spotify.com/track/0CQPPHjPpG4kAzvfOcKvh8?si=26047b4113d14b1f
    # Add more track URIs here
  ]
}

# Create a Spotify playlist
resource "spotify_playlist" "greatest_hits" {
  name        = "Greatest Hits"
  description = "Your greatest hits playlist"
  public      = false  # You can set this to true if you want the playlist to be public
}

# Loop through the track URIs and add them to the playlist
resource "spotify_playlist_track" "playlist_tracks" {
  count       = length(var.track_uris)
  playlist_id = spotify_playlist.greatest_hits.id
  track_uris  = [var.track_uris[count.index]]
}
