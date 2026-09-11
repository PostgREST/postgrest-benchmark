import { Rate } from "k6/metrics";
import { check, group, sleep } from 'k6';
import http from 'k6/http';

export default function() {
  let res = http.get(URL + "/album?select=*,track(*,genre(*))");
}
