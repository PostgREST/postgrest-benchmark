import { check, group, sleep } from 'k6';
import http from 'k6/http';

export default function() {
  let num =  Math.floor((Math.random() * 347) + 1);
  http.get(URL + `/rpc/add_them?a=${num}&b=${num+1}&c=${num+2}&d=${num+3}&e=${num+4}`);
}
