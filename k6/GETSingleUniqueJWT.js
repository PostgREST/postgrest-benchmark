// Generate a fresh JWT for every request so authentication cannot reuse cached tokens.
import { check } from 'k6';
import http from 'k6/http';

export default function() {
  const params = {
    headers: {
      Authorization: `Bearer ${generateJWT({ unique: true })}`,
    },
  };

  let id =  Math.floor((Math.random() * 275) + 1);

  const response = http.get(`${URL}/artist?select=*&artist_id=eq.${id}`, params);
  check(response, {
    [`HTTP status ${response.status}`]: (r) => r.status >= 200 && r.status < 400,
  });
}
