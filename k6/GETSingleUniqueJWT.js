// this is a modified version of GETSingleJWT.js which generates a new JWT on each request
import http from 'k6/http';
import { Rate } from 'k6/metrics';
const TOKEN_COUNT = 20000; // Pre-generated tokens

// Setup function executed once before the test run.
// It pre-generates tokens and passes them to the default function.
export function setup() {
  const tokens = [];
  for (let i = 0; i < TOKEN_COUNT; i++) {
    tokens.push(generateJWT({ unique: true }));
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

  http.get(`${URL}/artist?select=*&artist_id=eq.${id}`, params);
}
