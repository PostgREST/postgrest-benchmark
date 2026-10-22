`v16.4 | default | db-pipeline-mode = true` vs `pipeline-pgrst-2 | default | db-pipeline-mode = true`

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
