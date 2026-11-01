import http from 'k6/http';

// 2 MiB, past PostgREST's request stream threshold, 1 MiB by default
const body = JSON.stringify({ body: 'x'.repeat(2 * 1024 * 1024) });

export default function() {
  http.post(URL + "/rpc/text_length?columns=body", body, {headers: { 'Content-Type': 'application/json' }});
}
