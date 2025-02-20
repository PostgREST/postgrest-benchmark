import { Rate } from "k6/metrics";
import http from 'k6/http';

const URL = "http://pgrst";
const JWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJyb2xlIjoicG9zdGdyZXMiLCJjdXN0b20iOnsiZW1haWwiOiJlbWFpbEBtYWlsLmNvbSIsInBob25lIjoiKzc3MTIzLTU1NTUiLCJjb21wYW55IjoiQWNtZSIsInV1aWQiOiJiYTFhOGU0Yy0yYzc4LTRmZTgtYjM5Yi1lY2M3NmRkYTU1M2QifX0.D2L71px3mDVb9TQREGpBUEu2YQiVjSLH4qrTyqLd8fQ";
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
      Authorization: `Bearer ${JWT}`,
    },
  };
  let id =  Math.floor((Math.random() * 275) + 1);
  let res = http.get(URL + "/artist?select=*&artist_id=eq." + id, params);
}
