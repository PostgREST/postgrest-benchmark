## `v16.4 | default | db-pipeline-mode = true` vs `v16.4 | -A64m | db-pipeline-mode = true`

### Summary

| Mean change       | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:------------------|:--------------------------------------|:---------------------------------------|
| http_reqs (req/s) | +14.9%                                | +20.3%                                 |
| p50               | -30.8%                                | -36.6%                                 |
| p95               | +0.3%                                 | +1.3%                                  |

### http_reqs (req/s)

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -5.4%                                 | +1.9%                                  |
| GETSingle.js          | +19.6%                                | +31.6%                                 |
| GETSingleEmbed.js     | +7.4%                                 | +13.8%                                 |
| GETSingleJWT.js       | +24.0%                                | +31.3%                                 |
| GETSingleUniqueJWT.js | +21.9%                                | +31.1%                                 |
| OPTIONSUniqueJWT.js   | +5.8%                                 | +9.0%                                  |
| PATCHSingle.js        | +20.1%                                | +19.1%                                 |
| POSTBulk.js           | +7.7%                                 | +14.0%                                 |
| POSTSingle.js         | +29.5%                                | +30.6%                                 |
| RPCGETSingle.js       | +20.5%                                | +25.6%                                 |
| RPCGETSingleEmbed.js  | +11.0%                                | +13.4%                                 |
| RPCSimple.js          | +16.1%                                | +21.8%                                 |
| **Mean**              | **+14.9%**                            | **+20.3%**                             |

### failed requests

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | N/A                                   | N/A                                    |
| GETSingle.js          | N/A                                   | N/A                                    |
| GETSingleEmbed.js     | N/A                                   | N/A                                    |
| GETSingleJWT.js       | N/A                                   | N/A                                    |
| GETSingleUniqueJWT.js | N/A                                   | N/A                                    |
| OPTIONSUniqueJWT.js   | N/A                                   | N/A                                    |
| PATCHSingle.js        | N/A                                   | N/A                                    |
| POSTBulk.js           | N/A                                   | N/A                                    |
| POSTSingle.js         | N/A                                   | N/A                                    |
| RPCGETSingle.js       | N/A                                   | N/A                                    |
| RPCGETSingleEmbed.js  | N/A                                   | N/A                                    |
| RPCSimple.js          | N/A                                   | N/A                                    |
| **Mean**              | **N/A**                               | **N/A**                                |

### p50

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | +8.2%                                 | -3.9%                                  |
| GETSingle.js          | -43.4%                                | -52.5%                                 |
| GETSingleEmbed.js     | -12.1%                                | -27.7%                                 |
| GETSingleJWT.js       | -45.4%                                | -52.5%                                 |
| GETSingleUniqueJWT.js | -49.9%                                | -55.6%                                 |
| OPTIONSUniqueJWT.js   | +4.4%                                 | -1.2%                                  |
| PATCHSingle.js        | -35.7%                                | -36.4%                                 |
| POSTBulk.js           | -22.0%                                | -26.7%                                 |
| POSTSingle.js         | -48.7%                                | -47.4%                                 |
| RPCGETSingle.js       | -47.8%                                | -50.8%                                 |
| RPCGETSingleEmbed.js  | -35.2%                                | -35.3%                                 |
| RPCSimple.js          | -42.6%                                | -49.8%                                 |
| **Mean**              | **-30.8%**                            | **-36.6%**                             |

### p90

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | +13.7%                                | +12.2%                                 |
| GETSingle.js          | -2.4%                                 | -7.1%                                  |
| GETSingleEmbed.js     | -7.3%                                 | -4.7%                                  |
| GETSingleJWT.js       | -11.1%                                | -8.7%                                  |
| GETSingleUniqueJWT.js | -19.6%                                | -19.5%                                 |
| OPTIONSUniqueJWT.js   | -19.7%                                | -21.4%                                 |
| PATCHSingle.js        | -6.5%                                 | -3.8%                                  |
| POSTBulk.js           | -3.4%                                 | -3.5%                                  |
| POSTSingle.js         | -14.6%                                | -13.9%                                 |
| RPCGETSingle.js       | -3.9%                                 | +2.6%                                  |
| RPCGETSingleEmbed.js  | +0.0%                                 | +3.2%                                  |
| RPCSimple.js          | -2.9%                                 | +4.1%                                  |
| **Mean**              | **-6.5%**                             | **-5.0%**                              |

### p95

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | +16.3%                                | +17.4%                                 |
| GETSingle.js          | +6.2%                                 | +1.8%                                  |
| GETSingleEmbed.js     | -1.2%                                 | +4.5%                                  |
| GETSingleJWT.js       | -4.8%                                 | -0.8%                                  |
| GETSingleUniqueJWT.js | -17.7%                                | -15.6%                                 |
| OPTIONSUniqueJWT.js   | -35.1%                                | -37.3%                                 |
| PATCHSingle.js        | +1.5%                                 | +3.9%                                  |
| POSTBulk.js           | +30.2%                                | +6.6%                                  |
| POSTSingle.js         | -8.2%                                 | -7.9%                                  |
| RPCGETSingle.js       | +3.7%                                 | +13.0%                                 |
| RPCGETSingleEmbed.js  | +8.9%                                 | +16.3%                                 |
| RPCSimple.js          | +4.3%                                 | +13.2%                                 |
| **Mean**              | **+0.3%**                             | **+1.3%**                              |

## `v16.4 | default | db-pipeline-mode = true` vs `pipeline-pgrst-2 | default | db-pipeline-mode = true`

### Summary

| Mean change       | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:------------------|:--------------------------------------|:---------------------------------------|
| http_reqs (req/s) | +30.8%                                | +17.3%                                 |
| p50               | -46.1%                                | -40.6%                                 |
| p95               | +4.9%                                 | +14.7%                                 |

### http_reqs (req/s)

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | +0.5%                                 | +4.8%                                  |
| GETSingle.js          | +51.4%                                | +34.2%                                 |
| GETSingleEmbed.js     | +20.7%                                | +8.8%                                  |
| GETSingleJWT.js       | +42.6%                                | +25.2%                                 |
| GETSingleUniqueJWT.js | +33.5%                                | +28.4%                                 |
| OPTIONSUniqueJWT.js   | +6.0%                                 | +5.5%                                  |
| PATCHSingle.js        | +33.4%                                | +12.5%                                 |
| POSTBulk.js           | +24.6%                                | +13.2%                                 |
| POSTSingle.js         | +35.8%                                | +13.5%                                 |
| RPCGETSingle.js       | +46.3%                                | +24.5%                                 |
| RPCGETSingleEmbed.js  | +27.6%                                | +11.3%                                 |
| RPCSimple.js          | +47.0%                                | +26.2%                                 |
| **Mean**              | **+30.8%**                            | **+17.3%**                             |

### failed requests

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | N/A                                   | N/A                                    |
| GETSingle.js          | N/A                                   | N/A                                    |
| GETSingleEmbed.js     | N/A                                   | N/A                                    |
| GETSingleJWT.js       | N/A                                   | N/A                                    |
| GETSingleUniqueJWT.js | N/A                                   | N/A                                    |
| OPTIONSUniqueJWT.js   | N/A                                   | N/A                                    |
| PATCHSingle.js        | N/A                                   | N/A                                    |
| POSTBulk.js           | N/A                                   | N/A                                    |
| POSTSingle.js         | N/A                                   | N/A                                    |
| RPCGETSingle.js       | N/A                                   | N/A                                    |
| RPCGETSingleEmbed.js  | N/A                                   | N/A                                    |
| RPCSimple.js          | N/A                                   | N/A                                    |
| **Mean**              | **N/A**                               | **N/A**                                |

### p50

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | +0.2%                                 | -4.9%                                  |
| GETSingle.js          | -63.3%                                | -59.4%                                 |
| GETSingleEmbed.js     | -37.2%                                | -36.4%                                 |
| GETSingleJWT.js       | -62.5%                                | -55.6%                                 |
| GETSingleUniqueJWT.js | -63.5%                                | -61.4%                                 |
| OPTIONSUniqueJWT.js   | -0.6%                                 | -0.6%                                  |
| PATCHSingle.js        | -52.2%                                | -40.3%                                 |
| POSTBulk.js           | -32.2%                                | -21.1%                                 |
| POSTSingle.js         | -59.6%                                | -45.2%                                 |
| RPCGETSingle.js       | -64.0%                                | -58.6%                                 |
| RPCGETSingleEmbed.js  | -54.8%                                | -45.8%                                 |
| RPCSimple.js          | -63.7%                                | -58.3%                                 |
| **Mean**              | **-46.1%**                            | **-40.6%**                             |

### p90

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | +0.1%                                 | +3.3%                                  |
| GETSingle.js          | -1.5%                                 | +4.5%                                  |
| GETSingleEmbed.js     | +4.8%                                 | +19.9%                                 |
| GETSingleJWT.js       | -6.7%                                 | +5.7%                                  |
| GETSingleUniqueJWT.js | +2.4%                                 | +12.3%                                 |
| OPTIONSUniqueJWT.js   | -17.1%                                | -16.1%                                 |
| PATCHSingle.js        | -1.2%                                 | +15.4%                                 |
| POSTBulk.js           | -8.2%                                 | +7.4%                                  |
| POSTSingle.js         | -1.1%                                 | +14.3%                                 |
| RPCGETSingle.js       | -1.3%                                 | +21.0%                                 |
| RPCGETSingleEmbed.js  | +10.1%                                | +27.2%                                 |
| RPCSimple.js          | -2.1%                                 | +17.7%                                 |
| **Mean**              | **-1.8%**                             | **+11.0%**                             |

### p95

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | +2.3%                                 | +6.8%                                  |
| GETSingle.js          | +6.0%                                 | +11.6%                                 |
| GETSingleEmbed.js     | +11.7%                                | +26.3%                                 |
| GETSingleJWT.js       | -1.3%                                 | +10.6%                                 |
| GETSingleUniqueJWT.js | +25.9%                                | +27.9%                                 |
| OPTIONSUniqueJWT.js   | -30.7%                                | -31.0%                                 |
| PATCHSingle.js        | +6.1%                                 | +21.4%                                 |
| POSTBulk.js           | +0.9%                                 | -10.9%                                 |
| POSTSingle.js         | +6.7%                                 | +20.7%                                 |
| RPCGETSingle.js       | +7.5%                                 | +29.8%                                 |
| RPCGETSingleEmbed.js  | +18.3%                                | +39.0%                                 |
| RPCSimple.js          | +6.1%                                 | +24.9%                                 |
| **Mean**              | **+4.9%**                             | **+14.7%**                             |

## `v16.4 | default | db-pipeline-mode = true` vs `pipeline-pgrst-2 | -A64m | db-pipeline-mode = true`

### Summary

| Mean change       | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:------------------|:--------------------------------------|:---------------------------------------|
| http_reqs (req/s) | +30.9%                                | +18.4%                                 |
| p50               | -47.0%                                | -42.3%                                 |
| p95               | +8.2%                                 | +20.3%                                 |

### http_reqs (req/s)

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | +0.1%                                 | +6.2%                                  |
| GETSingle.js          | +51.2%                                | +28.4%                                 |
| GETSingleEmbed.js     | +25.4%                                | +8.6%                                  |
| GETSingleJWT.js       | +48.1%                                | +37.3%                                 |
| GETSingleUniqueJWT.js | +44.4%                                | +35.2%                                 |
| OPTIONSUniqueJWT.js   | +8.8%                                 | +7.4%                                  |
| PATCHSingle.js        | +40.4%                                | +15.7%                                 |
| POSTBulk.js           | +14.6%                                | +6.9%                                  |
| POSTSingle.js         | +47.6%                                | +23.3%                                 |
| RPCGETSingle.js       | +37.4%                                | +19.7%                                 |
| RPCGETSingleEmbed.js  | +19.3%                                | +1.7%                                  |
| RPCSimple.js          | +33.1%                                | +30.8%                                 |
| **Mean**              | **+30.9%**                            | **+18.4%**                             |

### failed requests

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | N/A                                   | N/A                                    |
| GETSingle.js          | N/A                                   | N/A                                    |
| GETSingleEmbed.js     | N/A                                   | N/A                                    |
| GETSingleJWT.js       | N/A                                   | N/A                                    |
| GETSingleUniqueJWT.js | N/A                                   | N/A                                    |
| OPTIONSUniqueJWT.js   | N/A                                   | N/A                                    |
| PATCHSingle.js        | N/A                                   | N/A                                    |
| POSTBulk.js           | N/A                                   | N/A                                    |
| POSTSingle.js         | N/A                                   | N/A                                    |
| RPCGETSingle.js       | N/A                                   | N/A                                    |
| RPCGETSingleEmbed.js  | N/A                                   | N/A                                    |
| RPCSimple.js          | N/A                                   | N/A                                    |
| **Mean**              | **N/A**                               | **N/A**                                |

### p50

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | +0.1%                                 | -8.0%                                  |
| GETSingle.js          | -62.5%                                | -59.9%                                 |
| GETSingleEmbed.js     | -40.3%                                | -37.4%                                 |
| GETSingleJWT.js       | -64.3%                                | -61.0%                                 |
| GETSingleUniqueJWT.js | -65.7%                                | -63.5%                                 |
| OPTIONSUniqueJWT.js   | -1.3%                                 | -1.0%                                  |
| PATCHSingle.js        | -63.5%                                | -50.2%                                 |
| POSTBulk.js           | -23.7%                                | -13.4%                                 |
| POSTSingle.js         | -67.6%                                | -54.6%                                 |
| RPCGETSingle.js       | -62.0%                                | -57.9%                                 |
| RPCGETSingleEmbed.js  | -52.6%                                | -41.1%                                 |
| RPCSimple.js          | -61.0%                                | -59.4%                                 |
| **Mean**              | **-47.0%**                            | **-42.3%**                             |

### p90

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -0.7%                                 | +10.7%                                 |
| GETSingle.js          | -2.3%                                 | +11.0%                                 |
| GETSingleEmbed.js     | +3.8%                                 | +19.6%                                 |
| GETSingleJWT.js       | -6.9%                                 | +1.3%                                  |
| GETSingleUniqueJWT.js | -19.4%                                | -10.3%                                 |
| OPTIONSUniqueJWT.js   | -22.2%                                | -20.5%                                 |
| PATCHSingle.js        | -2.1%                                 | +15.0%                                 |
| POSTBulk.js           | +0.3%                                 | +16.7%                                 |
| POSTSingle.js         | -9.5%                                 | +6.7%                                  |
| RPCGETSingle.js       | +4.9%                                 | +26.5%                                 |
| RPCGETSingleEmbed.js  | +15.0%                                | +37.6%                                 |
| RPCSimple.js          | +4.9%                                 | +16.7%                                 |
| **Mean**              | **-2.8%**                             | **+10.9%**                             |

### p95

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -0.6%                                 | +14.9%                                 |
| GETSingle.js          | +14.3%                                | +26.6%                                 |
| GETSingleEmbed.js     | +18.4%                                | +35.6%                                 |
| GETSingleJWT.js       | +7.4%                                 | +16.3%                                 |
| GETSingleUniqueJWT.js | -10.2%                                | -0.5%                                  |
| OPTIONSUniqueJWT.js   | -37.1%                                | -36.7%                                 |
| PATCHSingle.js        | +11.9%                                | +29.1%                                 |
| POSTBulk.js           | +18.0%                                | -0.9%                                  |
| POSTSingle.js         | +4.2%                                 | +20.0%                                 |
| RPCGETSingle.js       | +20.6%                                | +45.2%                                 |
| RPCGETSingleEmbed.js  | +31.4%                                | +58.2%                                 |
| RPCSimple.js          | +20.5%                                | +35.7%                                 |
| **Mean**              | **+8.2%**                             | **+20.3%**                             |

## `v16.4 | -A64m | db-pipeline-mode = true` vs `pipeline-pgrst-2 | default | db-pipeline-mode = true`

### Summary

| Mean change       | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:------------------|:--------------------------------------|:---------------------------------------|
| http_reqs (req/s) | +13.7%                                | -2.4%                                  |
| p50               | -24.4%                                | -7.5%                                  |
| p95               | +6.4%                                 | +14.2%                                 |

### http_reqs (req/s)

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | +6.3%                                 | +2.8%                                  |
| GETSingle.js          | +26.6%                                | +2.0%                                  |
| GETSingleEmbed.js     | +12.4%                                | -4.4%                                  |
| GETSingleJWT.js       | +15.0%                                | -4.6%                                  |
| GETSingleUniqueJWT.js | +9.5%                                 | -2.1%                                  |
| OPTIONSUniqueJWT.js   | +0.2%                                 | -3.3%                                  |
| PATCHSingle.js        | +11.1%                                | -5.6%                                  |
| POSTBulk.js           | +15.6%                                | -0.8%                                  |
| POSTSingle.js         | +4.9%                                 | -13.1%                                 |
| RPCGETSingle.js       | +21.4%                                | -0.9%                                  |
| RPCGETSingleEmbed.js  | +15.0%                                | -1.9%                                  |
| RPCSimple.js          | +26.6%                                | +3.6%                                  |
| **Mean**              | **+13.7%**                            | **-2.4%**                              |

### failed requests

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | N/A                                   | N/A                                    |
| GETSingle.js          | N/A                                   | N/A                                    |
| GETSingleEmbed.js     | N/A                                   | N/A                                    |
| GETSingleJWT.js       | N/A                                   | N/A                                    |
| GETSingleUniqueJWT.js | N/A                                   | N/A                                    |
| OPTIONSUniqueJWT.js   | N/A                                   | N/A                                    |
| PATCHSingle.js        | N/A                                   | N/A                                    |
| POSTBulk.js           | N/A                                   | N/A                                    |
| POSTSingle.js         | N/A                                   | N/A                                    |
| RPCGETSingle.js       | N/A                                   | N/A                                    |
| RPCGETSingleEmbed.js  | N/A                                   | N/A                                    |
| RPCSimple.js          | N/A                                   | N/A                                    |
| **Mean**              | **N/A**                               | **N/A**                                |

### p50

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -7.4%                                 | -1.0%                                  |
| GETSingle.js          | -35.2%                                | -14.6%                                 |
| GETSingleEmbed.js     | -28.5%                                | -12.0%                                 |
| GETSingleJWT.js       | -31.3%                                | -6.5%                                  |
| GETSingleUniqueJWT.js | -27.1%                                | -13.0%                                 |
| OPTIONSUniqueJWT.js   | -4.8%                                 | +0.6%                                  |
| PATCHSingle.js        | -25.6%                                | -6.1%                                  |
| POSTBulk.js           | -13.0%                                | +7.5%                                  |
| POSTSingle.js         | -21.3%                                | +4.2%                                  |
| RPCGETSingle.js       | -31.0%                                | -15.8%                                 |
| RPCGETSingleEmbed.js  | -30.2%                                | -16.3%                                 |
| RPCSimple.js          | -36.8%                                | -17.0%                                 |
| **Mean**              | **-24.4%**                            | **-7.5%**                              |

### p90

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -11.9%                                | -7.9%                                  |
| GETSingle.js          | +0.9%                                 | +12.5%                                 |
| GETSingleEmbed.js     | +13.0%                                | +25.8%                                 |
| GETSingleJWT.js       | +5.0%                                 | +15.8%                                 |
| GETSingleUniqueJWT.js | +27.3%                                | +39.4%                                 |
| OPTIONSUniqueJWT.js   | +3.2%                                 | +6.7%                                  |
| PATCHSingle.js        | +5.7%                                 | +19.9%                                 |
| POSTBulk.js           | -5.0%                                 | +11.2%                                 |
| POSTSingle.js         | +15.8%                                | +32.7%                                 |
| RPCGETSingle.js       | +2.7%                                 | +17.9%                                 |
| RPCGETSingleEmbed.js  | +10.1%                                | +23.2%                                 |
| RPCSimple.js          | +0.8%                                 | +13.0%                                 |
| **Mean**              | **+5.6%**                             | **+17.5%**                             |

### p95

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -12.0%                                | -9.0%                                  |
| GETSingle.js          | -0.2%                                 | +9.5%                                  |
| GETSingleEmbed.js     | +13.0%                                | +20.8%                                 |
| GETSingleJWT.js       | +3.8%                                 | +11.4%                                 |
| GETSingleUniqueJWT.js | +53.0%                                | +51.5%                                 |
| OPTIONSUniqueJWT.js   | +6.7%                                 | +10.0%                                 |
| PATCHSingle.js        | +4.5%                                 | +16.8%                                 |
| POSTBulk.js           | -22.5%                                | -16.4%                                 |
| POSTSingle.js         | +16.1%                                | +31.1%                                 |
| RPCGETSingle.js       | +3.6%                                 | +14.8%                                 |
| RPCGETSingleEmbed.js  | +8.7%                                 | +19.6%                                 |
| RPCSimple.js          | +1.7%                                 | +10.4%                                 |
| **Mean**              | **+6.4%**                             | **+14.2%**                             |

## `v16.4 | -A64m | db-pipeline-mode = true` vs `pipeline-pgrst-2 | -A64m | db-pipeline-mode = true`

### Summary

| Mean change       | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:------------------|:--------------------------------------|:---------------------------------------|
| http_reqs (req/s) | +13.6%                                | -1.6%                                  |
| p50               | -26.1%                                | -10.7%                                 |
| p95               | +8.2%                                 | +18.3%                                 |

### http_reqs (req/s)

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | +5.8%                                 | +4.3%                                  |
| GETSingle.js          | +26.4%                                | -2.4%                                  |
| GETSingleEmbed.js     | +16.7%                                | -4.6%                                  |
| GETSingleJWT.js       | +19.4%                                | +4.6%                                  |
| GETSingleUniqueJWT.js | +18.4%                                | +3.1%                                  |
| OPTIONSUniqueJWT.js   | +2.9%                                 | -1.4%                                  |
| PATCHSingle.js        | +16.9%                                | -2.9%                                  |
| POSTBulk.js           | +6.4%                                 | -6.3%                                  |
| POSTSingle.js         | +14.0%                                | -5.6%                                  |
| RPCGETSingle.js       | +14.0%                                | -4.7%                                  |
| RPCGETSingleEmbed.js  | +7.5%                                 | -10.4%                                 |
| RPCSimple.js          | +14.6%                                | +7.4%                                  |
| **Mean**              | **+13.6%**                            | **-1.6%**                              |

### failed requests

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | N/A                                   | N/A                                    |
| GETSingle.js          | N/A                                   | N/A                                    |
| GETSingleEmbed.js     | N/A                                   | N/A                                    |
| GETSingleJWT.js       | N/A                                   | N/A                                    |
| GETSingleUniqueJWT.js | N/A                                   | N/A                                    |
| OPTIONSUniqueJWT.js   | N/A                                   | N/A                                    |
| PATCHSingle.js        | N/A                                   | N/A                                    |
| POSTBulk.js           | N/A                                   | N/A                                    |
| POSTSingle.js         | N/A                                   | N/A                                    |
| RPCGETSingle.js       | N/A                                   | N/A                                    |
| RPCGETSingleEmbed.js  | N/A                                   | N/A                                    |
| RPCSimple.js          | N/A                                   | N/A                                    |
| **Mean**              | **N/A**                               | **N/A**                                |

### p50

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -7.4%                                 | -4.3%                                  |
| GETSingle.js          | -33.6%                                | -15.6%                                 |
| GETSingleEmbed.js     | -32.1%                                | -13.5%                                 |
| GETSingleJWT.js       | -34.6%                                | -17.9%                                 |
| GETSingleUniqueJWT.js | -31.4%                                | -17.9%                                 |
| OPTIONSUniqueJWT.js   | -5.4%                                 | +0.1%                                  |
| PATCHSingle.js        | -43.3%                                | -21.6%                                 |
| POSTBulk.js           | -2.1%                                 | +18.1%                                 |
| POSTSingle.js         | -36.8%                                | -13.7%                                 |
| RPCGETSingle.js       | -27.3%                                | -14.5%                                 |
| RPCGETSingleEmbed.js  | -26.9%                                | -9.0%                                  |
| RPCSimple.js          | -32.1%                                | -19.2%                                 |
| **Mean**              | **-26.1%**                            | **-10.7%**                             |

### p90

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -12.7%                                | -1.4%                                  |
| GETSingle.js          | +0.2%                                 | +19.5%                                 |
| GETSingleEmbed.js     | +12.0%                                | +25.6%                                 |
| GETSingleJWT.js       | +4.8%                                 | +11.0%                                 |
| GETSingleUniqueJWT.js | +0.2%                                 | +11.3%                                 |
| OPTIONSUniqueJWT.js   | -3.0%                                 | +1.1%                                  |
| PATCHSingle.js        | +4.7%                                 | +19.5%                                 |
| POSTBulk.js           | +3.8%                                 | +20.9%                                 |
| POSTSingle.js         | +6.0%                                 | +23.9%                                 |
| RPCGETSingle.js       | +9.1%                                 | +23.3%                                 |
| RPCGETSingleEmbed.js  | +15.0%                                | +33.3%                                 |
| RPCSimple.js          | +8.0%                                 | +12.1%                                 |
| **Mean**              | **+4.0%**                             | **+16.7%**                             |

### p95

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -14.5%                                | -2.1%                                  |
| GETSingle.js          | +7.6%                                 | +24.3%                                 |
| GETSingleEmbed.js     | +19.8%                                | +29.7%                                 |
| GETSingleJWT.js       | +12.8%                                | +17.2%                                 |
| GETSingleUniqueJWT.js | +9.1%                                 | +17.8%                                 |
| OPTIONSUniqueJWT.js   | -3.1%                                 | +0.9%                                  |
| PATCHSingle.js        | +10.2%                                | +24.2%                                 |
| POSTBulk.js           | -9.4%                                 | -7.0%                                  |
| POSTSingle.js         | +13.5%                                | +30.3%                                 |
| RPCGETSingle.js       | +16.3%                                | +28.4%                                 |
| RPCGETSingleEmbed.js  | +20.7%                                | +36.0%                                 |
| RPCSimple.js          | +15.5%                                | +19.9%                                 |
| **Mean**              | **+8.2%**                             | **+18.3%**                             |

## `pipeline-pgrst-2 | default | db-pipeline-mode = true` vs `pipeline-pgrst-2 | -A64m | db-pipeline-mode = true`

### Summary

| Mean change       | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:------------------|:--------------------------------------|:---------------------------------------|
| http_reqs (req/s) | +0.1%                                 | +0.9%                                  |
| p50               | -2.3%                                 | -3.4%                                  |
| p95               | +3.2%                                 | +4.5%                                  |

### http_reqs (req/s)

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -0.5%                                 | +1.4%                                  |
| GETSingle.js          | -0.1%                                 | -4.3%                                  |
| GETSingleEmbed.js     | +3.9%                                 | -0.3%                                  |
| GETSingleJWT.js       | +3.8%                                 | +9.7%                                  |
| GETSingleUniqueJWT.js | +8.1%                                 | +5.3%                                  |
| OPTIONSUniqueJWT.js   | +2.7%                                 | +1.9%                                  |
| PATCHSingle.js        | +5.3%                                 | +2.9%                                  |
| POSTBulk.js           | -8.0%                                 | -5.6%                                  |
| POSTSingle.js         | +8.7%                                 | +8.6%                                  |
| RPCGETSingle.js       | -6.1%                                 | -3.8%                                  |
| RPCGETSingleEmbed.js  | -6.5%                                 | -8.7%                                  |
| RPCSimple.js          | -9.5%                                 | +3.7%                                  |
| **Mean**              | **+0.1%**                             | **+0.9%**                              |

### failed requests

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | N/A                                   | N/A                                    |
| GETSingle.js          | N/A                                   | N/A                                    |
| GETSingleEmbed.js     | N/A                                   | N/A                                    |
| GETSingleJWT.js       | N/A                                   | N/A                                    |
| GETSingleUniqueJWT.js | N/A                                   | N/A                                    |
| OPTIONSUniqueJWT.js   | N/A                                   | N/A                                    |
| PATCHSingle.js        | N/A                                   | N/A                                    |
| POSTBulk.js           | N/A                                   | N/A                                    |
| POSTSingle.js         | N/A                                   | N/A                                    |
| RPCGETSingle.js       | N/A                                   | N/A                                    |
| RPCGETSingleEmbed.js  | N/A                                   | N/A                                    |
| RPCSimple.js          | N/A                                   | N/A                                    |
| **Mean**              | **N/A**                               | **N/A**                                |

### p50

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -0.0%                                 | -3.3%                                  |
| GETSingle.js          | +2.4%                                 | -1.1%                                  |
| GETSingleEmbed.js     | -5.0%                                 | -1.7%                                  |
| GETSingleJWT.js       | -4.8%                                 | -12.2%                                 |
| GETSingleUniqueJWT.js | -6.0%                                 | -5.6%                                  |
| OPTIONSUniqueJWT.js   | -0.7%                                 | -0.4%                                  |
| PATCHSingle.js        | -23.8%                                | -16.6%                                 |
| POSTBulk.js           | +12.5%                                | +9.8%                                  |
| POSTSingle.js         | -19.7%                                | -17.1%                                 |
| RPCGETSingle.js       | +5.5%                                 | +1.5%                                  |
| RPCGETSingleEmbed.js  | +4.8%                                 | +8.7%                                  |
| RPCSimple.js          | +7.4%                                 | -2.6%                                  |
| **Mean**              | **-2.3%**                             | **-3.4%**                              |

### p90

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -0.9%                                 | +7.1%                                  |
| GETSingle.js          | -0.7%                                 | +6.2%                                  |
| GETSingleEmbed.js     | -0.9%                                 | -0.2%                                  |
| GETSingleJWT.js       | -0.2%                                 | -4.1%                                  |
| GETSingleUniqueJWT.js | -21.3%                                | -20.2%                                 |
| OPTIONSUniqueJWT.js   | -6.1%                                 | -5.2%                                  |
| PATCHSingle.js        | -1.0%                                 | -0.3%                                  |
| POSTBulk.js           | +9.3%                                 | +8.7%                                  |
| POSTSingle.js         | -8.5%                                 | -6.7%                                  |
| RPCGETSingle.js       | +6.2%                                 | +4.6%                                  |
| RPCGETSingleEmbed.js  | +4.4%                                 | +8.2%                                  |
| RPCSimple.js          | +7.1%                                 | -0.8%                                  |
| **Mean**              | **-1.0%**                             | **-0.2%**                              |

### p95

| Test                  | 100 VUs · m5a.8xlarge · Separate PG   | 100 VUs · m5a.8xlarge · Colocated PG   |
|:----------------------|:--------------------------------------|:---------------------------------------|
| GETAllEmbed.js        | -2.8%                                 | +7.6%                                  |
| GETSingle.js          | +7.8%                                 | +13.5%                                 |
| GETSingleEmbed.js     | +6.0%                                 | +7.4%                                  |
| GETSingleJWT.js       | +8.7%                                 | +5.2%                                  |
| GETSingleUniqueJWT.js | -28.7%                                | -22.2%                                 |
| OPTIONSUniqueJWT.js   | -9.2%                                 | -8.2%                                  |
| PATCHSingle.js        | +5.5%                                 | +6.3%                                  |
| POSTBulk.js           | +16.9%                                | +11.3%                                 |
| POSTSingle.js         | -2.3%                                 | -0.6%                                  |
| RPCGETSingle.js       | +12.3%                                | +11.8%                                 |
| RPCGETSingleEmbed.js  | +11.0%                                | +13.8%                                 |
| RPCSimple.js          | +13.6%                                | +8.7%                                  |
| **Mean**              | **+3.2%**                             | **+4.5%**                              |