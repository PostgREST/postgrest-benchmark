## `v16.4 | -N4 -A64m | default` vs `v16.4 | -N8 -A64m | default`

### Summary

| Mean change       | 400 VUs · m5a.8xlarge · Separate PG   |
|:------------------|:--------------------------------------|
| http_reqs (req/s) | +42.8%                                |
| p50               | -35.8%                                |
| p95               | -16.6%                                |

### http_reqs (req/s)

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | +0.0%                                 |
| GETSingle.js          | +44.6%                                |
| GETSingleEmbed.js     | +50.8%                                |
| GETSingleJWT.js       | +47.4%                                |
| GETSingleUniqueJWT.js | +47.1%                                |
| OPTIONSUniqueJWT.js   | +38.3%                                |
| PATCHSingle.js        | +46.2%                                |
| POSTBulk.js           | +47.1%                                |
| POSTSingle.js         | +51.3%                                |
| RPCGETSingle.js       | +41.6%                                |
| RPCGETSingleEmbed.js  | +54.8%                                |
| RPCSimple.js          | +44.7%                                |
| **Mean**              | **+42.8%**                            |

### failed requests

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | N/A                                   |
| GETSingle.js          | N/A                                   |
| GETSingleEmbed.js     | N/A                                   |
| GETSingleJWT.js       | N/A                                   |
| GETSingleUniqueJWT.js | N/A                                   |
| OPTIONSUniqueJWT.js   | N/A                                   |
| PATCHSingle.js        | N/A                                   |
| POSTBulk.js           | N/A                                   |
| POSTSingle.js         | N/A                                   |
| RPCGETSingle.js       | N/A                                   |
| RPCGETSingleEmbed.js  | N/A                                   |
| RPCSimple.js          | N/A                                   |
| **Mean**              | **N/A**                               |

### p50

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.3%                                 |
| GETSingle.js          | -31.4%                                |
| GETSingleEmbed.js     | -35.6%                                |
| GETSingleJWT.js       | -32.9%                                |
| GETSingleUniqueJWT.js | -35.7%                                |
| OPTIONSUniqueJWT.js   | -70.3%                                |
| PATCHSingle.js        | -33.8%                                |
| POSTBulk.js           | -44.5%                                |
| POSTSingle.js         | -36.0%                                |
| RPCGETSingle.js       | -31.0%                                |
| RPCGETSingleEmbed.js  | -45.8%                                |
| RPCSimple.js          | -32.4%                                |
| **Mean**              | **-35.8%**                            |

### p90

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.1%                                 |
| GETSingle.js          | -11.1%                                |
| GETSingleEmbed.js     | -19.9%                                |
| GETSingleJWT.js       | -13.3%                                |
| GETSingleUniqueJWT.js | -7.0%                                 |
| OPTIONSUniqueJWT.js   | -42.0%                                |
| PATCHSingle.js        | -14.8%                                |
| POSTBulk.js           | -34.5%                                |
| POSTSingle.js         | -21.5%                                |
| RPCGETSingle.js       | -11.9%                                |
| RPCGETSingleEmbed.js  | -23.6%                                |
| RPCSimple.js          | -17.9%                                |
| **Mean**              | **-18.1%**                            |

### p95

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.3%                                 |
| GETSingle.js          | -10.4%                                |
| GETSingleEmbed.js     | -19.4%                                |
| GETSingleJWT.js       | -13.7%                                |
| GETSingleUniqueJWT.js | -8.3%                                 |
| OPTIONSUniqueJWT.js   | -32.3%                                |
| PATCHSingle.js        | -12.3%                                |
| POSTBulk.js           | -34.6%                                |
| POSTSingle.js         | -20.6%                                |
| RPCGETSingle.js       | -8.5%                                 |
| RPCGETSingleEmbed.js  | -23.0%                                |
| RPCSimple.js          | -16.4%                                |
| **Mean**              | **-16.6%**                            |

## `v16.4 | -N4 -A64m | default` vs `v16.4 | -N16 -A64m | default`

### Summary

| Mean change       | 400 VUs · m5a.8xlarge · Separate PG   |
|:------------------|:--------------------------------------|
| http_reqs (req/s) | +39.6%                                |
| p50               | -32.5%                                |
| p95               | -6.9%                                 |

### http_reqs (req/s)

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | +0.1%                                 |
| GETSingle.js          | +33.9%                                |
| GETSingleEmbed.js     | +51.9%                                |
| GETSingleJWT.js       | +38.8%                                |
| GETSingleUniqueJWT.js | +48.4%                                |
| OPTIONSUniqueJWT.js   | +38.8%                                |
| PATCHSingle.js        | +42.7%                                |
| POSTBulk.js           | +59.7%                                |
| POSTSingle.js         | +49.4%                                |
| RPCGETSingle.js       | +25.7%                                |
| RPCGETSingleEmbed.js  | +57.5%                                |
| RPCSimple.js          | +28.7%                                |
| **Mean**              | **+39.6%**                            |

### failed requests

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | N/A                                   |
| GETSingle.js          | N/A                                   |
| GETSingleEmbed.js     | N/A                                   |
| GETSingleJWT.js       | N/A                                   |
| GETSingleUniqueJWT.js | N/A                                   |
| OPTIONSUniqueJWT.js   | N/A                                   |
| PATCHSingle.js        | N/A                                   |
| POSTBulk.js           | N/A                                   |
| POSTSingle.js         | N/A                                   |
| RPCGETSingle.js       | N/A                                   |
| RPCGETSingleEmbed.js  | N/A                                   |
| RPCSimple.js          | N/A                                   |
| **Mean**              | **N/A**                               |

### p50

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.2%                                 |
| GETSingle.js          | -24.4%                                |
| GETSingleEmbed.js     | -34.0%                                |
| GETSingleJWT.js       | -27.6%                                |
| GETSingleUniqueJWT.js | -33.4%                                |
| OPTIONSUniqueJWT.js   | -74.4%                                |
| PATCHSingle.js        | -30.6%                                |
| POSTBulk.js           | -46.3%                                |
| POSTSingle.js         | -33.5%                                |
| RPCGETSingle.js       | -20.3%                                |
| RPCGETSingleEmbed.js  | -43.6%                                |
| RPCSimple.js          | -21.4%                                |
| **Mean**              | **-32.5%**                            |

### p90

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.2%                                 |
| GETSingle.js          | -26.5%                                |
| GETSingleEmbed.js     | -19.0%                                |
| GETSingleJWT.js       | -27.9%                                |
| GETSingleUniqueJWT.js | -34.4%                                |
| OPTIONSUniqueJWT.js   | -43.3%                                |
| PATCHSingle.js        | -34.6%                                |
| POSTBulk.js           | -34.5%                                |
| POSTSingle.js         | -19.5%                                |
| RPCGETSingle.js       | -24.3%                                |
| RPCGETSingleEmbed.js  | -20.2%                                |
| RPCSimple.js          | -14.1%                                |
| **Mean**              | **-24.9%**                            |

### p95

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -1.3%                                 |
| GETSingle.js          | +1.1%                                 |
| GETSingleEmbed.js     | -8.9%                                 |
| GETSingleJWT.js       | +1.9%                                 |
| GETSingleUniqueJWT.js | +15.4%                                |
| OPTIONSUniqueJWT.js   | -35.5%                                |
| PATCHSingle.js        | -0.6%                                 |
| POSTBulk.js           | -39.2%                                |
| POSTSingle.js         | -9.2%                                 |
| RPCGETSingle.js       | +8.3%                                 |
| RPCGETSingleEmbed.js  | -15.3%                                |
| RPCSimple.js          | +0.9%                                 |
| **Mean**              | **-6.9%**                             |

## `v16.4 | -N4 -A64m | default` vs `v16.4 | -N32 -A64m | default`

### Summary

| Mean change       | 400 VUs · m5a.8xlarge · Separate PG   |
|:------------------|:--------------------------------------|
| http_reqs (req/s) | +35.3%                                |
| p50               | -28.8%                                |
| p95               | -4.6%                                 |

### http_reqs (req/s)

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | +0.2%                                 |
| GETSingle.js          | +28.4%                                |
| GETSingleEmbed.js     | +51.4%                                |
| GETSingleJWT.js       | +36.0%                                |
| GETSingleUniqueJWT.js | +48.4%                                |
| OPTIONSUniqueJWT.js   | +36.9%                                |
| PATCHSingle.js        | +34.5%                                |
| POSTBulk.js           | +36.6%                                |
| POSTSingle.js         | +48.7%                                |
| RPCGETSingle.js       | +19.0%                                |
| RPCGETSingleEmbed.js  | +59.6%                                |
| RPCSimple.js          | +24.3%                                |
| **Mean**              | **+35.3%**                            |

### failed requests

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | N/A                                   |
| GETSingle.js          | N/A                                   |
| GETSingleEmbed.js     | N/A                                   |
| GETSingleJWT.js       | N/A                                   |
| GETSingleUniqueJWT.js | N/A                                   |
| OPTIONSUniqueJWT.js   | N/A                                   |
| PATCHSingle.js        | N/A                                   |
| POSTBulk.js           | N/A                                   |
| POSTSingle.js         | N/A                                   |
| RPCGETSingle.js       | N/A                                   |
| RPCGETSingleEmbed.js  | N/A                                   |
| RPCSimple.js          | N/A                                   |
| **Mean**              | **N/A**                               |

### p50

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.9%                                 |
| GETSingle.js          | -18.9%                                |
| GETSingleEmbed.js     | -31.7%                                |
| GETSingleJWT.js       | -23.5%                                |
| GETSingleUniqueJWT.js | -31.0%                                |
| OPTIONSUniqueJWT.js   | -74.2%                                |
| PATCHSingle.js        | -25.0%                                |
| POSTBulk.js           | -38.9%                                |
| POSTSingle.js         | -31.1%                                |
| RPCGETSingle.js       | -12.0%                                |
| RPCGETSingleEmbed.js  | -41.8%                                |
| RPCSimple.js          | -15.9%                                |
| **Mean**              | **-28.8%**                            |

### p90

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.3%                                 |
| GETSingle.js          | -16.8%                                |
| GETSingleEmbed.js     | -23.9%                                |
| GETSingleJWT.js       | -20.8%                                |
| GETSingleUniqueJWT.js | -34.9%                                |
| OPTIONSUniqueJWT.js   | -42.1%                                |
| PATCHSingle.js        | -22.8%                                |
| POSTBulk.js           | -14.3%                                |
| POSTSingle.js         | -25.7%                                |
| RPCGETSingle.js       | -11.0%                                |
| RPCGETSingleEmbed.js  | -24.2%                                |
| RPCSimple.js          | -12.4%                                |
| **Mean**              | **-20.8%**                            |

### p95

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.9%                                 |
| GETSingle.js          | -3.0%                                 |
| GETSingleEmbed.js     | -5.2%                                 |
| GETSingleJWT.js       | -6.0%                                 |
| GETSingleUniqueJWT.js | +17.5%                                |
| OPTIONSUniqueJWT.js   | -33.6%                                |
| PATCHSingle.js        | -5.0%                                 |
| POSTBulk.js           | -9.6%                                 |
| POSTSingle.js         | -5.5%                                 |
| RPCGETSingle.js       | +1.7%                                 |
| RPCGETSingleEmbed.js  | -8.3%                                 |
| RPCSimple.js          | +3.3%                                 |
| **Mean**              | **-4.6%**                             |

## `v16.4 | -N8 -A64m | default` vs `v16.4 | -N16 -A64m | default`

### Summary

| Mean change       | 400 VUs · m5a.8xlarge · Separate PG   |
|:------------------|:--------------------------------------|
| http_reqs (req/s) | -2.2%                                 |
| p50               | +4.3%                                 |
| p95               | +11.1%                                |

### http_reqs (req/s)

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | +0.0%                                 |
| GETSingle.js          | -7.4%                                 |
| GETSingleEmbed.js     | +0.7%                                 |
| GETSingleJWT.js       | -5.8%                                 |
| GETSingleUniqueJWT.js | +0.8%                                 |
| OPTIONSUniqueJWT.js   | +0.4%                                 |
| PATCHSingle.js        | -2.3%                                 |
| POSTBulk.js           | +8.6%                                 |
| POSTSingle.js         | -1.2%                                 |
| RPCGETSingle.js       | -11.2%                                |
| RPCGETSingleEmbed.js  | +1.7%                                 |
| RPCSimple.js          | -11.0%                                |
| **Mean**              | **-2.2%**                             |

### failed requests

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | N/A                                   |
| GETSingle.js          | N/A                                   |
| GETSingleEmbed.js     | N/A                                   |
| GETSingleJWT.js       | N/A                                   |
| GETSingleUniqueJWT.js | N/A                                   |
| OPTIONSUniqueJWT.js   | N/A                                   |
| PATCHSingle.js        | N/A                                   |
| POSTBulk.js           | N/A                                   |
| POSTSingle.js         | N/A                                   |
| RPCGETSingle.js       | N/A                                   |
| RPCGETSingleEmbed.js  | N/A                                   |
| RPCSimple.js          | N/A                                   |
| **Mean**              | **N/A**                               |

### p50

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | +0.1%                                 |
| GETSingle.js          | +10.2%                                |
| GETSingleEmbed.js     | +2.5%                                 |
| GETSingleJWT.js       | +8.0%                                 |
| GETSingleUniqueJWT.js | +3.6%                                 |
| OPTIONSUniqueJWT.js   | -13.8%                                |
| PATCHSingle.js        | +4.9%                                 |
| POSTBulk.js           | -3.3%                                 |
| POSTSingle.js         | +3.9%                                 |
| RPCGETSingle.js       | +15.4%                                |
| RPCGETSingleEmbed.js  | +4.0%                                 |
| RPCSimple.js          | +16.3%                                |
| **Mean**              | **+4.3%**                             |

### p90

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.2%                                 |
| GETSingle.js          | -17.3%                                |
| GETSingleEmbed.js     | +1.2%                                 |
| GETSingleJWT.js       | -16.9%                                |
| GETSingleUniqueJWT.js | -29.5%                                |
| OPTIONSUniqueJWT.js   | -2.3%                                 |
| PATCHSingle.js        | -23.2%                                |
| POSTBulk.js           | +0.1%                                 |
| POSTSingle.js         | +2.6%                                 |
| RPCGETSingle.js       | -14.1%                                |
| RPCGETSingleEmbed.js  | +4.4%                                 |
| RPCSimple.js          | +4.5%                                 |
| **Mean**              | **-7.5%**                             |

### p95

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -1.0%                                 |
| GETSingle.js          | +12.8%                                |
| GETSingleEmbed.js     | +13.0%                                |
| GETSingleJWT.js       | +18.0%                                |
| GETSingleUniqueJWT.js | +25.9%                                |
| OPTIONSUniqueJWT.js   | -4.7%                                 |
| PATCHSingle.js        | +13.4%                                |
| POSTBulk.js           | -7.0%                                 |
| POSTSingle.js         | +14.3%                                |
| RPCGETSingle.js       | +18.4%                                |
| RPCGETSingleEmbed.js  | +10.0%                                |
| RPCSimple.js          | +20.7%                                |
| **Mean**              | **+11.1%**                            |

## `v16.4 | -N8 -A64m | default` vs `v16.4 | -N32 -A64m | default`

### Summary

| Mean change       | 400 VUs · m5a.8xlarge · Separate PG   |
|:------------------|:--------------------------------------|
| http_reqs (req/s) | -5.2%                                 |
| p50               | +10.2%                                |
| p95               | +15.0%                                |

### http_reqs (req/s)

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | +0.1%                                 |
| GETSingle.js          | -11.2%                                |
| GETSingleEmbed.js     | +0.4%                                 |
| GETSingleJWT.js       | -7.7%                                 |
| GETSingleUniqueJWT.js | +0.9%                                 |
| OPTIONSUniqueJWT.js   | -1.1%                                 |
| PATCHSingle.js        | -8.0%                                 |
| POSTBulk.js           | -7.1%                                 |
| POSTSingle.js         | -1.7%                                 |
| RPCGETSingle.js       | -16.0%                                |
| RPCGETSingleEmbed.js  | +3.1%                                 |
| RPCSimple.js          | -14.1%                                |
| **Mean**              | **-5.2%**                             |

### failed requests

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | N/A                                   |
| GETSingle.js          | N/A                                   |
| GETSingleEmbed.js     | N/A                                   |
| GETSingleJWT.js       | N/A                                   |
| GETSingleUniqueJWT.js | N/A                                   |
| OPTIONSUniqueJWT.js   | N/A                                   |
| PATCHSingle.js        | N/A                                   |
| POSTBulk.js           | N/A                                   |
| POSTSingle.js         | N/A                                   |
| RPCGETSingle.js       | N/A                                   |
| RPCGETSingleEmbed.js  | N/A                                   |
| RPCSimple.js          | N/A                                   |
| **Mean**              | **N/A**                               |

### p50

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.6%                                 |
| GETSingle.js          | +18.2%                                |
| GETSingleEmbed.js     | +6.0%                                 |
| GETSingleJWT.js       | +14.0%                                |
| GETSingleUniqueJWT.js | +7.4%                                 |
| OPTIONSUniqueJWT.js   | -12.9%                                |
| PATCHSingle.js        | +13.3%                                |
| POSTBulk.js           | +10.1%                                |
| POSTSingle.js         | +7.6%                                 |
| RPCGETSingle.js       | +27.4%                                |
| RPCGETSingleEmbed.js  | +7.4%                                 |
| RPCSimple.js          | +24.3%                                |
| **Mean**              | **+10.2%**                            |

### p90

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.3%                                 |
| GETSingle.js          | -6.4%                                 |
| GETSingleEmbed.js     | -5.0%                                 |
| GETSingleJWT.js       | -8.7%                                 |
| GETSingleUniqueJWT.js | -30.1%                                |
| OPTIONSUniqueJWT.js   | -0.2%                                 |
| PATCHSingle.js        | -9.4%                                 |
| POSTBulk.js           | +31.0%                                |
| POSTSingle.js         | -5.2%                                 |
| RPCGETSingle.js       | +1.0%                                 |
| RPCGETSingleEmbed.js  | -0.8%                                 |
| RPCSimple.js          | +6.6%                                 |
| **Mean**              | **-2.3%**                             |

### p95

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.5%                                 |
| GETSingle.js          | +8.2%                                 |
| GETSingleEmbed.js     | +17.6%                                |
| GETSingleJWT.js       | +8.8%                                 |
| GETSingleUniqueJWT.js | +28.1%                                |
| OPTIONSUniqueJWT.js   | -1.9%                                 |
| PATCHSingle.js        | +8.3%                                 |
| POSTBulk.js           | +38.3%                                |
| POSTSingle.js         | +19.0%                                |
| RPCGETSingle.js       | +11.2%                                |
| RPCGETSingleEmbed.js  | +19.0%                                |
| RPCSimple.js          | +23.5%                                |
| **Mean**              | **+15.0%**                            |

## `v16.4 | -N16 -A64m | default` vs `v16.4 | -N32 -A64m | default`

### Summary

| Mean change       | 400 VUs · m5a.8xlarge · Separate PG   |
|:------------------|:--------------------------------------|
| http_reqs (req/s) | -3.0%                                 |
| p50               | +5.5%                                 |
| p95               | +4.2%                                 |

### http_reqs (req/s)

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | +0.1%                                 |
| GETSingle.js          | -4.1%                                 |
| GETSingleEmbed.js     | -0.3%                                 |
| GETSingleJWT.js       | -2.0%                                 |
| GETSingleUniqueJWT.js | +0.0%                                 |
| OPTIONSUniqueJWT.js   | -1.4%                                 |
| PATCHSingle.js        | -5.8%                                 |
| POSTBulk.js           | -14.5%                                |
| POSTSingle.js         | -0.5%                                 |
| RPCGETSingle.js       | -5.3%                                 |
| RPCGETSingleEmbed.js  | +1.3%                                 |
| RPCSimple.js          | -3.4%                                 |
| **Mean**              | **-3.0%**                             |

### failed requests

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | N/A                                   |
| GETSingle.js          | N/A                                   |
| GETSingleEmbed.js     | N/A                                   |
| GETSingleJWT.js       | N/A                                   |
| GETSingleUniqueJWT.js | N/A                                   |
| OPTIONSUniqueJWT.js   | N/A                                   |
| PATCHSingle.js        | N/A                                   |
| POSTBulk.js           | N/A                                   |
| POSTSingle.js         | N/A                                   |
| RPCGETSingle.js       | N/A                                   |
| RPCGETSingleEmbed.js  | N/A                                   |
| RPCSimple.js          | N/A                                   |
| **Mean**              | **N/A**                               |

### p50

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.8%                                 |
| GETSingle.js          | +7.2%                                 |
| GETSingleEmbed.js     | +3.4%                                 |
| GETSingleJWT.js       | +5.6%                                 |
| GETSingleUniqueJWT.js | +3.7%                                 |
| OPTIONSUniqueJWT.js   | +1.0%                                 |
| PATCHSingle.js        | +8.0%                                 |
| POSTBulk.js           | +13.8%                                |
| POSTSingle.js         | +3.5%                                 |
| RPCGETSingle.js       | +10.4%                                |
| RPCGETSingleEmbed.js  | +3.3%                                 |
| RPCSimple.js          | +6.9%                                 |
| **Mean**              | **+5.5%**                             |

### p90

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | -0.1%                                 |
| GETSingle.js          | +13.1%                                |
| GETSingleEmbed.js     | -6.2%                                 |
| GETSingleJWT.js       | +9.8%                                 |
| GETSingleUniqueJWT.js | -0.8%                                 |
| OPTIONSUniqueJWT.js   | +2.1%                                 |
| PATCHSingle.js        | +18.0%                                |
| POSTBulk.js           | +30.8%                                |
| POSTSingle.js         | -7.6%                                 |
| RPCGETSingle.js       | +17.7%                                |
| RPCGETSingleEmbed.js  | -5.0%                                 |
| RPCSimple.js          | +2.0%                                 |
| **Mean**              | **+6.2%**                             |

### p95

| Test                  | 400 VUs · m5a.8xlarge · Separate PG   |
|:----------------------|:--------------------------------------|
| GETAllEmbed.js        | +0.4%                                 |
| GETSingle.js          | -4.1%                                 |
| GETSingleEmbed.js     | +4.1%                                 |
| GETSingleJWT.js       | -7.8%                                 |
| GETSingleUniqueJWT.js | +1.8%                                 |
| OPTIONSUniqueJWT.js   | +2.9%                                 |
| PATCHSingle.js        | -4.5%                                 |
| POSTBulk.js           | +48.6%                                |
| POSTSingle.js         | +4.1%                                 |
| RPCGETSingle.js       | -6.1%                                 |
| RPCGETSingleEmbed.js  | +8.2%                                 |
| RPCSimple.js          | +2.4%                                 |
| **Mean**              | **+4.2%**                             |