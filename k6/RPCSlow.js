import http from 'k6/http';

const URL = 'http://pgrst';

export default function () {
  const urls = Array.from({ length: 100 }, () => `${URL}/rpc/sleep?seconds=30`);

  http.batch(urls);
}
