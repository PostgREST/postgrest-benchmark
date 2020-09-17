//https://medium.com/swlh/beginners-guide-to-load-testing-with-k6-ff155885b6db
import { Counter } from "k6/metrics";
import { check, group, sleep } from 'k6';
import http from 'k6/http';

const URL = __ENV.URL;

export let options = {
  //throw: true, // for no WARN[0079] Request Failed in summary output
  //max_vus: 100,
  vus: 250,
  stages: [
    { duration: "1.5m", target: 250 },
    //{ duration: "30s", target: 10 },
    //{ duration: "4m", target: 100 },
    //{ duration: "30s", target: 0 }
  ],
  //thresholds: {
    //"RTT": ["avg<500"]
  //}
}

//All albums with tracks and genres http://ec2-3-12-99-177.us-east-2.compute.amazonaws.com/album?select=*,track(*,genre(*))
//An album with tracks and genres http://ec2-3-12-99-177.us-east-2.compute.amazonaws.com/album?select=*,track(*,genre(*))&artist_id=eq.127
//All tracks with media http://ec2-3-12-99-177.us-east-2.compute.amazonaws.com/track?select=*,media_type(*)
//A track with media http://ec2-3-12-99-177.us-east-2.compute.amazonaws.com/track?select=*,media_type(*)&composer=eq.Kurt%20Cobain
//Artists collaboration http://ec2-3-12-99-177.us-east-2.compute.amazonaws.com/artist?select=*,album(*,track(*))&album.track.composer=eq.Ludwig%20van%20Beethoven
//An artist http://ec2-3-12-99-177.us-east-2.compute.amazonaws.com/artist?select=*&artist_id=eq.3

let errors = new Counter("errors");

export default function() {
  let res = http.get(URL + "/album?select=*,track(*,genre(*))");
  if(res.status != 200) errors.add(1)
}

//export default function() {
  //http.get(URL + "/artist");
//}

//export default function() {
  //http.get(URL + "/artist?artist_id=eq.7");
//}
