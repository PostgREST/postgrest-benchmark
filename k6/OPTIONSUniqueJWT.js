import http from 'k6/http';
import { Rate } from 'k6/metrics';
import { hmac } from 'k6/crypto';
import { b64encode } from 'k6/encoding';

const URL = "http://pgrst";
const SECRET = 'reallyreallyreallyreallyverysafe';
const TOKEN_COUNT = 20000; // Pre-generated tokens

export const options = {
  thresholds: {
    'http_req_failed': ['rate<0.1'],
    'http_req_duration': ['p(95)<1000']
  }
};

function base64UrlEncode(input) {
  // "rawurl" avoids +, /, and = by default,
  // which is exactly what JWT needs
  return b64encode(input, 'rawurl');
}

function generateJWT() {
  const header = {
    alg: 'HS256',
    typ: 'JWT'
  };

  const now = Math.floor(Date.now() / 1000);
  const payload = {
    sub: `user_${Math.floor(Math.random() * 1e6)}`, // random sub claim
    name: 'John Doe',
    iat: now,
    exp: now + 30,
    role: 'postgres',
    custom: {
      email: `email_${Math.floor(Math.random() * 1e6)}@mail.com`,
      phone: '+77123-5555',
      company: 'Acme',
      uuid: 'ba1a8e4c-2c78-4fe8-b39b-ecc76dda553d'
    }
  };

  // Encode header and payload
  const encodedHeader = base64UrlEncode(JSON.stringify(header));
  const encodedPayload = base64UrlEncode(JSON.stringify(payload));

  // Sign the header and payload
  const toSign = `${encodedHeader}.${encodedPayload}`;
  // Produce the signature as binary, then encode that as base64-url
  const signature = hmac('sha256', SECRET, toSign, 'binary');
  const encodedSignature = base64UrlEncode(signature);

  // Final JWT
  return `${encodedHeader}.${encodedPayload}.${encodedSignature}`;
}

// Setup function executed once before the test run.
// It pre-generates tokens and passes them to the default function.
export function setup() {
  const tokens = [];
  for (let i = 0; i < TOKEN_COUNT; i++) {
    tokens.push(generateJWT());
  }

  return { tokens };
}

// Default function: runs on each virtual user iteration.
export default function(data) {
  // Select a random token from the pre-generated pool
  const tokens = data.tokens;
  const token = tokens[Math.floor(Math.random() * tokens.length)];

  const params = {
    headers: {
      Authorization: `Bearer ${token}`,
    },
  };

  let id =  Math.floor((Math.random() * 275) + 1);

  http.options(`${URL}/artist?select=*&artist_id=eq.${id}`, params);
}
