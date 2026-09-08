import http from 'k6/http';

export default function () {
  const urls = Array.from({ length: 100 }, () => `${URL}/rpc/sleep?seconds=30`);

  http.batch(urls);
}
