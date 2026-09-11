import http from 'k6/http'

export default function () {
  const body = { last_update: 'now' }
  const params = {
    headers: {
      'Content-Type': 'application/json',
    }
  }
  http.patch(`${URL}/actor?actor_id=eq.${Math.floor(Math.random() * 203 + 1)}`, JSON.stringify(body), params)
}
