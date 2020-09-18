import { Counter } from "k6/metrics";
import { check, group, sleep } from 'k6';
import http from 'k6/http';

const URL = "http://" + __ENV.URL;

export let options = {
  //throw: true, // for no WARN[0079] Request Failed in summary output
  vus: 250,
  stages: [
    { duration: "1.5m", target: 250 },
  ]
}


/*
* Tests to make:
* All albums with tracks and genres: /album?select=*,track(*,genre(*))
* An album with tracks and genres:   /album?select=*,track(*,genre(*))&artist_id=eq.127
* All tracks with media:             /track?select=*,media_type(*)
* A track with media:                /track?select=*,media_type(*)&composer=eq.Kurt%20Cobain
* Artists collaboration:             /artist?select=*,album(*,track(*))&album.track.composer=eq.Ludwig%20van%20Beethoven
* An artist:                         /artist?select=*&artist_id=eq.3
*/

let errors = new Counter("errors");

// Currently OOM killing pgrst on t2.nano
export default function() {
  let res = http.get(URL + "/album?select=*,track(*,genre(*))");
  if(res.status != 200) errors.add(1)
}

/*
export default function() {
  http.get(URL + "/artist");
}

export default function() {
  http.get(URL + "/artist?artist_id=eq.7");
}
*/
