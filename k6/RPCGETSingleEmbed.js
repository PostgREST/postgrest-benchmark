import { check, group, sleep } from 'k6';
import http from 'k6/http';

export const options = {
  thresholds: {
    'http_req_failed': ['rate<0.1'],
    'http_req_duration': ['p(95)<1000']
  }
};

export default function() {
  let id =  Math.floor((Math.random() * 347) + 1);
  http.get(URL + "/rpc/ret_albums?select=album_id,title,artist_id,track(*,genre(*))&artist_id=eq." + id);
}
