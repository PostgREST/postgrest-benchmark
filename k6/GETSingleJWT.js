import { Rate } from "k6/metrics";
import http from 'k6/http';

export default function() {
  const params = {
    headers: {
      Authorization: `Bearer ${generateJWT({ iat: Math.floor(Date.now() / 1000) })}`,
    },
  };
  let id =  Math.floor((Math.random() * 275) + 1);
  let res = http.get(URL + "/artist?select=*&artist_id=eq." + id, params);
}
