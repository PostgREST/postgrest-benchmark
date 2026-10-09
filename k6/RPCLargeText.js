import http from 'k6/http';

// One value of 2 MiB, past PostgREST's response stream threshold, 1 MiB by
// default
export default function() {
  http.get(URL + "/rpc/large_text?size=" + 2 * 1024 * 1024);
}
