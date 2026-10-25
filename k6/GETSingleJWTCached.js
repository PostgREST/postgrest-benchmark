// A JWT for every request, drawn uniformly from a pool of
// PGRSTBENCH_JWT_POOL_SIZE distinct, pre-signed tokens (10000 by default), so
// that a JWT cache holding a share of the pool hits about that share of the
// requests: 8000 entries, 80% of the pool, hit about 80%.
import { check } from 'k6';
import { SharedArray } from 'k6/data';
import http from 'k6/http';

const size = parseInt(__ENV.PGRSTBENCH_JWT_POOL_SIZE || '10000');
const iat = Math.floor(Date.now() / 1000);

// signed once, and shared by all the VUs
const tokens = new SharedArray('JWT pool', () => Array.from({ length: size }, (_, i) => {
  const header = base64UrlEncode(JSON.stringify({ alg: 'HS256', typ: 'JWT' }));
  const payload = base64UrlEncode(JSON.stringify({
    sub: `user_${i}`,
    name: 'John Doe',
    iat,
    role: 'postgres',
    custom: {
      email: `email_${i}@mail.com`,
      phone: '+77123-5555',
      company: 'Acme',
      uuid: 'ba1a8e4c-2c78-4fe8-b39b-ecc76dda553d'
    }
  }));
  const toSign = `${header}.${payload}`;
  return `${toSign}.${base64UrlEncode(hmac('sha256', SECRET, toSign, 'binary'))}`;
}));

export default function() {
  const params = {
    headers: {
      Authorization: `Bearer ${tokens[Math.floor(Math.random() * tokens.length)]}`,
    },
  };

  let id =  Math.floor((Math.random() * 275) + 1);

  const response = http.get(`${URL}/artist?select=*&artist_id=eq.${id}`, params);
  check(response, {
    [`HTTP status ${response.status}`]: (r) => r.status >= 200 && r.status < 400,
  });
}
