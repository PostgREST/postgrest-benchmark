import { check, group, sleep } from 'k6';
import http from 'k6/http';

export const options = {
  thresholds: {
    'http_req_failed': ['rate<0.1'],
    'http_req_duration': ['p(95)<1000']
  }
};

export default function() {
  let num =  Math.floor((Math.random() * 347) + 1);
  http.get(URL + `/rpc/add_them?a=${num}&b=${num+1}&c=${num+2}&d=${num+3}&e=${num+4}`);
}
