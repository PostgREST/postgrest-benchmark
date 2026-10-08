import { hmac } from 'k6/crypto';
import { b64encode } from 'k6/encoding';

const SECRET = 'reallyreallyreallyreallyverysafe';
const URL = 'http://pgrst';

function base64UrlEncode(input) {
  return b64encode(input, 'rawurl');
}

function generateJWT({ unique = false, iat = Math.floor(Date.now() / 1000) } = {}) {
  const header = {
    alg: 'HS256',
    typ: 'JWT'
  };
  const payload = {
    sub: unique ? `user_${Math.floor(Math.random() * 1e6)}` : '1234567890',
    name: 'John Doe',
    iat,
    role: 'postgres',
    custom: {
      email: unique
        ? `email_${Math.floor(Math.random() * 1e6)}@mail.com`
        : 'email@mail.com',
      phone: '+77123-5555',
      company: 'Acme',
      uuid: 'ba1a8e4c-2c78-4fe8-b39b-ecc76dda553d'
    }
  };

  if (unique) {
    payload.exp = iat + 30;
  }

  const encodedHeader = base64UrlEncode(JSON.stringify(header));
  const encodedPayload = base64UrlEncode(JSON.stringify(payload));
  const toSign = `${encodedHeader}.${encodedPayload}`;
  const signature = base64UrlEncode(hmac('sha256', SECRET, toSign, 'binary'));

  return `${toSign}.${signature}`;
}

function truncateEmployee() {
  const response = http.post(URL + "/rpc/truncate_employee");
  if (response.status !== 204) {
    throw new Error(`Teardown failed: HTTP ${response.status}: ${response.body}`);
  }
}

function handleSummary(data) {
  delete data.setup_data;
  data.K6_SCRIPT = __ENV.K6_SCRIPT || null;
  data.POSTGREST_VERSION = __ENV.POSTGREST_VERSION || null;
  data.PGRSTBENCH_EC2_PGRST_INSTANCE_TYPE =
    __ENV.PGRSTBENCH_EC2_PGRST_INSTANCE_TYPE || null;
  data.PGRSTBENCH_GHC_RTS = __ENV.PGRSTBENCH_GHC_RTS || null;
  data.PGRSTBENCH_PGRST_EXTRA_CONFIG =
    __ENV.PGRSTBENCH_PGRST_EXTRA_CONFIG || null;

  return {
    stdout: JSON.stringify(data) + '\n'
  };
}

export { handleSummary };
