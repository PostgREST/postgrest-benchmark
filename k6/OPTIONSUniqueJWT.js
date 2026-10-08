import { check } from 'k6';
import http from 'k6/http';

export const options = {
  thresholds: {
    'http_req_failed': ['rate<0.1'],
    'http_req_duration': ['p(95)<1000']
  }
};

// Generate a fresh JWT for every request, including during long benchmark runs.
export default function() {
  const params = {
    headers: {
      Authorization: `Bearer ${generateJWT({ unique: true })}`,
    },
  };

  let id =  Math.floor((Math.random() * 275) + 1);

  const response = http.options(`${URL}/artist?select=*&artist_id=eq.${id}`, params);
  check(response, {
    [`HTTP status ${response.status}`]: (r) => r.status >= 200 && r.status < 400,
  });
}
