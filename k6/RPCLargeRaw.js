import http from 'k6/http';

// 2 MiB, past PostgREST's request stream threshold, 1 MiB by default
const body = 'x'.repeat(2 * 1024 * 1024);

export default function() {
  http.post(URL + "/rpc/bytea_length", body, {headers: { 'Content-Type': 'application/octet-stream' }});
}
