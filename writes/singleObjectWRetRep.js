import { Rate, Gauge } from "k6/metrics";
import { check, group, sleep } from 'k6';
import http from 'k6/http';

const URL = "http://" + __ENV.URL;

export let options = {
  discardResponseBodies: true,
  scenarios: {
    constant_request_rate: {
      executor: 'constant-arrival-rate',
      rate: 900, //setting 1000 leads to more dropped iterations
      timeUnit: '1s',
      duration: '30s',
      preAllocatedVUs: 100,
      maxVUs: 600,
    }
  },
  thresholds: {
    'failed requests': ['rate<0.1'],
    'http_req_duration': ['p(95)<1000']
  }
};

const myFailRate = new Rate('failed requests');

export default function() {
  let body = JSON.stringify({
    employee_id: __ITER + 100
  , first_name:  'Virtual ' + __ITER
  , last_name:   'User '    + __ITER
  , title:       'Load Tester'
  , reports_to:  1
  , birth_date:  '1920-01-01'
  , hire_date:   '2020-01-01'
  , address:     '666 10 Street SW'
  , city:        'Calgary'
  , state:       'AB'
  , country:     'Canada'
  , postal_code: 'T2P 5G'
  , phone:       '(403) 246-9887'
  , fax:         '+1 (403) 246-9899'
  , email:       'vu' + __ITER + '@chinookcorp.com'
  });
  let res = http.post(URL + "/employee", body, {headers: { 'Content-Type': 'application/json', 'Prefer': 'return=representation' }});
  myFailRate.add(res.status !== 201);
}

export function teardown(data) {
  http.del(URL + "/employee?title=eq.Load%20Tester", {}, {headers: { 'Prefer': 'count=exact' }});
}