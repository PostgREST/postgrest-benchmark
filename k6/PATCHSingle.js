import http from 'k6/http'

export const options = {
  thresholds: {
    'http_req_failed': ['rate<0.1'],
    'http_req_duration': ['p(95)<1000']
  }
};

export default function () {
  const body = { last_update: 'now' }
  const params = {
    headers: {
      'Content-Type': 'application/json',
    }
  }
  http.patch(`${URL}/actor?actor_id=eq.${Math.floor(Math.random() * 203 + 1)}`, JSON.stringify(body), params)
}
