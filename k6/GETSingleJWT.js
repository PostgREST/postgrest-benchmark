import { Rate } from "k6/metrics";
import http from 'k6/http';
import { hmac } from 'k6/crypto';
import { b64encode } from 'k6/encoding';

const URL = "http://pgrst";
const SECRET = 'reallyreallyreallyreallyverysafe';

function generateJWT(iat) {
  const header = {
    alg: 'HS256',
    typ: 'JWT'
  };
  const payload = {
    sub: '1234567890',
    name: 'John Doe',
    iat,
    role: 'postgres',
    custom: {
      email: 'email@mail.com',
      phone: '+77123-5555',
      company: 'Acme',
      uuid: 'ba1a8e4c-2c78-4fe8-b39b-ecc76dda553d'
    }
  };

  const encodedHeader = b64encode(JSON.stringify(header), 'rawurl');
  const encodedPayload = b64encode(JSON.stringify(payload), 'rawurl');
  const toSign = `${encodedHeader}.${encodedPayload}`;
  const signature = b64encode(hmac('sha256', SECRET, toSign, 'binary'), 'rawurl');

  return `${toSign}.${signature}`;
}

function getJWT() {
  return generateJWT(Math.floor(Date.now() / 1000));
}
// JWT is:
/*
 *{
 *  "sub": "1234567890",
 *  "name": "John Doe",
 *  "iat": 1516239022,
 *  "role": "postgres",
 *  "custom": {
 *    "email": "email@mail.com",
 *    "phone": "+77123-5555",
 *    "company": "Acme",
 *    "uuid": "ba1a8e4c-2c78-4fe8-b39b-ecc76dda553d"
 *  }
 *}
 */

export const options = {
  thresholds: {
    'http_req_failed': ['rate<0.1'],
    'http_req_duration': ['p(95)<1000']
  }
};

export default function() {
  const params = {
    headers: {
      Authorization: `Bearer ${getJWT()}`,
    },
  };
  let id =  Math.floor((Math.random() * 275) + 1);
  let res = http.get(URL + "/artist?select=*&artist_id=eq." + id, params);
}
