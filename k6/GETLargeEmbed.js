import http from 'k6/http';

// Every track, with what it's in: about 1.5 MB, past PostgREST's response
// stream threshold, 1 MiB by default
export default function() {
  http.get(URL + "/track?select=*,album(*,artist(*)),genre(*),media_type(*),playlist_track(*)");
}
