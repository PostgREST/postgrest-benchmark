import { check, group, sleep } from 'k6';
import http from 'k6/http';

export default function() {
  let id =  Math.floor((Math.random() * 347) + 1);
  http.get(URL + "/rpc/ret_albums?select=album_id,title,artist_id,track(*,genre(*))&artist_id=eq." + id);
}
