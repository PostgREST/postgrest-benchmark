import { check, group, sleep } from 'k6';
import http from 'k6/http';

export const options = {
  thresholds: {
    'http_req_failed': ['rate<0.1'],
    'http_req_duration': ['p(95)<1000']
  }
};

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
  http.post(URL + "/employee", body, {headers: { 'Content-Type': 'application/json' }});
}

export function teardown(data) {
  http.del(URL + "/employee?title=eq.Load%20Tester", {}, {headers: { 'Prefer': 'count=exact' }});
}
