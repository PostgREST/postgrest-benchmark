import { Rate } from "k6/metrics";
import { check, group, sleep } from 'k6';
import http from 'k6/http';

const URL = "http://" + __ENV.HOST;

const RATE = (function(){
  if(__ENV.VERSION == 'v701'){
    switch(__ENV.HOST){
      case 'c5xlarge':  return 2400;
      case 'c4xlarge':  return 2000;
      case 't3axlarge': return 1600;
      case 't3alarge':  return 1400;
      case 't3amedium': return 1400;
      case 't3amicro':  return 1400;
      case 't3anano':   return 1400;
      case 't2nano':    return 1100;
      default:          return 1000;
    }
  }
  else switch(__ENV.HOST){
      case 'c5xlarge':  return 3000;
      case 'c4xlarge':  return 2500;
      case 't3axlarge': return 2300;
      case 't3alarge':  return 2100;
      case 't3amedium': return 2100;
      case 't3amicro':  return 2100;
      case 't3anano':   return 2100;
      case 't2nano':    return 1600;
      default:          return 1000;
    }
})();

export let options = {
  discardResponseBodies: true,
  scenarios: {
    constant_request_rate: {
      executor: 'constant-arrival-rate',
      rate: RATE,
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
  let res = http.get(URL + "/artist?select=*&artist_id=eq.3");
  myFailRate.add(res.status !== 200);
}
