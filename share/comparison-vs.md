## `-A64m · db-pipeline-mode = true · devel` vs `-A64m · db-pipeline-mode = true · postgrest-pipeline-pool-fix`

### Summary

| Mean change       | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:------------------|:---------------------------------------------|:--------------------------------------------|
| http_reqs (req/s) | +22.0%                                       | +17.0%                                      |
| p50               | -23.1%                                       | -14.0%                                      |
| p95               | -15.4%                                       | -13.4%                                      |

### http_reqs (req/s)

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -1.6%                                        | +0.5%                                       |
| GETSingle.js          | +33.5%                                       | +23.6%                                      |
| GETSingleEmbed.js     | +25.7%                                       | +11.7%                                      |
| GETSingleJWT.js       | +34.3%                                       | +27.5%                                      |
| GETSingleUniqueJWT.js | +32.0%                                       | +29.0%                                      |
| OPTIONSUniqueJWT.js   | -1.6%                                        | +0.1%                                       |
| PATCHSingle.js        | +12.5%                                       | +29.4%                                      |
| POSTBulk.js           | +22.0%                                       | +3.8%                                       |
| POSTSingle.js         | +19.2%                                       | +35.9%                                      |
| RPCGETSingle.js       | +38.4%                                       | +19.6%                                      |
| RPCGETSingleEmbed.js  | +14.4%                                       | +7.6%                                       |
| RPCSimple.js          | +35.2%                                       | +14.7%                                      |
| **Mean**              | **+22.0%**                                   | **+17.0%**                                  |

### failed requests

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | N/A                                          | +5.5%                                       |
| GETSingle.js          | N/A                                          | N/A                                         |
| GETSingleEmbed.js     | N/A                                          | N/A                                         |
| GETSingleJWT.js       | N/A                                          | N/A                                         |
| GETSingleUniqueJWT.js | N/A                                          | N/A                                         |
| OPTIONSUniqueJWT.js   | N/A                                          | N/A                                         |
| PATCHSingle.js        | N/A                                          | N/A                                         |
| POSTBulk.js           | N/A                                          | N/A                                         |
| POSTSingle.js         | N/A                                          | N/A                                         |
| RPCGETSingle.js       | N/A                                          | N/A                                         |
| RPCGETSingleEmbed.js  | N/A                                          | N/A                                         |
| RPCSimple.js          | N/A                                          | N/A                                         |
| **Mean**              | **N/A**                                      | **+5.5%**                                   |

### p50

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | +1.1%                                        | -0.8%                                       |
| GETSingle.js          | -29.4%                                       | -14.5%                                      |
| GETSingleEmbed.js     | -22.0%                                       | -2.4%                                       |
| GETSingleJWT.js       | -22.9%                                       | -20.0%                                      |
| GETSingleUniqueJWT.js | -22.0%                                       | -16.1%                                      |
| OPTIONSUniqueJWT.js   | +3.8%                                        | -0.6%                                       |
| PATCHSingle.js        | -23.6%                                       | -36.2%                                      |
| POSTBulk.js           | -58.8%                                       | -7.1%                                       |
| POSTSingle.js         | -27.7%                                       | -23.8%                                      |
| RPCGETSingle.js       | -27.4%                                       | -17.7%                                      |
| RPCGETSingleEmbed.js  | -21.0%                                       | -9.1%                                       |
| RPCSimple.js          | -27.8%                                       | -20.2%                                      |
| **Mean**              | **-23.1%**                                   | **-14.0%**                                  |

### p90

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | +14.2%                                       | +0.3%                                       |
| GETSingle.js          | -30.0%                                       | -10.0%                                      |
| GETSingleEmbed.js     | -10.5%                                       | +34.7%                                      |
| GETSingleJWT.js       | -21.6%                                       | -15.3%                                      |
| GETSingleUniqueJWT.js | -23.7%                                       | -8.7%                                       |
| OPTIONSUniqueJWT.js   | +4.6%                                        | +0.7%                                       |
| PATCHSingle.js        | -19.3%                                       | -66.1%                                      |
| POSTBulk.js           | +0.2%                                        | +1.0%                                       |
| POSTSingle.js         | -16.4%                                       | -36.1%                                      |
| RPCGETSingle.js       | -33.6%                                       | -9.1%                                       |
| RPCGETSingleEmbed.js  | -3.5%                                        | +27.8%                                      |
| RPCSimple.js          | -32.4%                                       | -8.9%                                       |
| **Mean**              | **-14.3%**                                   | **-7.5%**                                   |

### p95

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | +3.4%                                        | -0.1%                                       |
| GETSingle.js          | -21.4%                                       | -21.5%                                      |
| GETSingleEmbed.js     | -7.4%                                        | -13.2%                                      |
| GETSingleJWT.js       | -8.3%                                        | -28.5%                                      |
| GETSingleUniqueJWT.js | -17.6%                                       | -12.4%                                      |
| OPTIONSUniqueJWT.js   | +7.0%                                        | +1.6%                                       |
| PATCHSingle.js        | -66.3%                                       | +9.3%                                       |
| POSTBulk.js           | +41.7%                                       | +10.2%                                      |
| POSTSingle.js         | -57.4%                                       | -58.2%                                      |
| RPCGETSingle.js       | -28.9%                                       | -24.2%                                      |
| RPCGETSingleEmbed.js  | -0.6%                                        | -3.6%                                       |
| RPCSimple.js          | -28.6%                                       | -20.0%                                      |
| **Mean**              | **-15.4%**                                   | **-13.4%**                                  |

## `-A64m · db-pipeline-mode = true · devel` vs `-A64m · db-pipeline-mode = true
  db-pre-request = "custom_headers" · devel`

### Summary

| Mean change       | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:------------------|:---------------------------------------------|:--------------------------------------------|
| http_reqs (req/s) | -2.3%                                        | -11.3%                                      |
| p50               | +4.8%                                        | +6.0%                                       |
| p95               | -4.4%                                        | -5.8%                                       |

### http_reqs (req/s)

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -1.5%                                        | -0.3%                                       |
| GETSingle.js          | -14.5%                                       | -21.2%                                      |
| GETSingleEmbed.js     | -0.1%                                        | -19.7%                                      |
| GETSingleJWT.js       | -12.9%                                       | -17.9%                                      |
| GETSingleUniqueJWT.js | -0.9%                                        | -3.2%                                       |
| OPTIONSUniqueJWT.js   | -0.2%                                        | -0.8%                                       |
| PATCHSingle.js        | +1.5%                                        | -1.6%                                       |
| POSTBulk.js           | +19.8%                                       | -7.7%                                       |
| POSTSingle.js         | +10.6%                                       | +0.5%                                       |
| RPCGETSingle.js       | -10.5%                                       | -22.4%                                      |
| RPCGETSingleEmbed.js  | -7.0%                                        | -17.7%                                      |
| RPCSimple.js          | -12.2%                                       | -23.7%                                      |
| **Mean**              | **-2.3%**                                    | **-11.3%**                                  |

### failed requests

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | N/A                                          | +4.2%                                       |
| GETSingle.js          | N/A                                          | N/A                                         |
| GETSingleEmbed.js     | N/A                                          | N/A                                         |
| GETSingleJWT.js       | N/A                                          | N/A                                         |
| GETSingleUniqueJWT.js | N/A                                          | N/A                                         |
| OPTIONSUniqueJWT.js   | N/A                                          | N/A                                         |
| PATCHSingle.js        | N/A                                          | N/A                                         |
| POSTBulk.js           | N/A                                          | N/A                                         |
| POSTSingle.js         | N/A                                          | N/A                                         |
| RPCGETSingle.js       | N/A                                          | N/A                                         |
| RPCGETSingleEmbed.js  | N/A                                          | N/A                                         |
| RPCSimple.js          | N/A                                          | N/A                                         |
| **Mean**              | **N/A**                                      | **+4.2%**                                   |

### p50

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -0.3%                                        | +0.5%                                       |
| GETSingle.js          | +12.3%                                       | +14.1%                                      |
| GETSingleEmbed.js     | +12.4%                                       | +4.8%                                       |
| GETSingleJWT.js       | +16.0%                                       | +9.0%                                       |
| GETSingleUniqueJWT.js | +21.1%                                       | +14.5%                                      |
| OPTIONSUniqueJWT.js   | +3.2%                                        | +0.2%                                       |
| PATCHSingle.js        | +7.4%                                        | -7.8%                                       |
| POSTBulk.js           | -57.8%                                       | +13.1%                                      |
| POSTSingle.js         | +3.7%                                        | +4.4%                                       |
| RPCGETSingle.js       | +15.2%                                       | +8.5%                                       |
| RPCGETSingleEmbed.js  | +13.6%                                       | -1.0%                                       |
| RPCSimple.js          | +11.0%                                       | +12.0%                                      |
| **Mean**              | **+4.8%**                                    | **+6.0%**                                   |

### p90

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | +52.1%                                       | +0.7%                                       |
| GETSingle.js          | +4.6%                                        | +4.3%                                       |
| GETSingleEmbed.js     | +5.1%                                        | -0.7%                                       |
| GETSingleJWT.js       | +7.7%                                        | -8.1%                                       |
| GETSingleUniqueJWT.js | +0.5%                                        | -17.8%                                      |
| OPTIONSUniqueJWT.js   | +2.6%                                        | +0.8%                                       |
| PATCHSingle.js        | -14.0%                                       | -8.1%                                       |
| POSTBulk.js           | +1.7%                                        | +6.7%                                       |
| POSTSingle.js         | -34.9%                                       | +18.0%                                      |
| RPCGETSingle.js       | -4.8%                                        | -2.0%                                       |
| RPCGETSingleEmbed.js  | +9.2%                                        | -6.6%                                       |
| RPCSimple.js          | -2.0%                                        | +5.9%                                       |
| **Mean**              | **+2.3%**                                    | **-0.6%**                                   |

### p95

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -9.2%                                        | +0.4%                                       |
| GETSingle.js          | -1.3%                                        | -7.8%                                       |
| GETSingleEmbed.js     | +3.3%                                        | -7.9%                                       |
| GETSingleJWT.js       | +1.5%                                        | -18.9%                                      |
| GETSingleUniqueJWT.js | +0.1%                                        | -15.2%                                      |
| OPTIONSUniqueJWT.js   | +3.6%                                        | +1.5%                                       |
| PATCHSingle.js        | -25.6%                                       | +3.0%                                       |
| POSTBulk.js           | +50.1%                                       | +10.6%                                      |
| POSTSingle.js         | -65.3%                                       | -3.3%                                       |
| RPCGETSingle.js       | -10.8%                                       | -18.2%                                      |
| RPCGETSingleEmbed.js  | +10.5%                                       | -4.6%                                       |
| RPCSimple.js          | -9.5%                                        | -9.3%                                       |
| **Mean**              | **-4.4%**                                    | **-5.8%**                                   |

## `-A64m · db-pipeline-mode = true · devel` vs `-A64m · db-pipeline-mode = true
  db-pre-request = "custom_headers" · postgrest-pipeline-pool-fix`

### Summary

| Mean change       | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:------------------|:---------------------------------------------|:--------------------------------------------|
| http_reqs (req/s) | +13.7%                                       | +8.4%                                       |
| p50               | -18.4%                                       | -5.2%                                       |
| p95               | -12.8%                                       | -9.1%                                       |

### http_reqs (req/s)

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -2.4%                                        | +0.3%                                       |
| GETSingle.js          | +12.7%                                       | +7.7%                                       |
| GETSingleEmbed.js     | +18.4%                                       | +4.8%                                       |
| GETSingleJWT.js       | +14.0%                                       | +8.4%                                       |
| GETSingleUniqueJWT.js | +19.7%                                       | +8.0%                                       |
| OPTIONSUniqueJWT.js   | -1.2%                                        | -0.1%                                       |
| PATCHSingle.js        | +15.9%                                       | +36.3%                                      |
| POSTBulk.js           | +20.1%                                       | -1.9%                                       |
| POSTSingle.js         | +27.7%                                       | +35.9%                                      |
| RPCGETSingle.js       | +18.6%                                       | +1.3%                                       |
| RPCGETSingleEmbed.js  | +4.7%                                        | -2.9%                                       |
| RPCSimple.js          | +15.7%                                       | +2.6%                                       |
| **Mean**              | **+13.7%**                                   | **+8.4%**                                   |

### failed requests

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | N/A                                          | +9.6%                                       |
| GETSingle.js          | N/A                                          | N/A                                         |
| GETSingleEmbed.js     | N/A                                          | N/A                                         |
| GETSingleJWT.js       | N/A                                          | N/A                                         |
| GETSingleUniqueJWT.js | N/A                                          | N/A                                         |
| OPTIONSUniqueJWT.js   | N/A                                          | N/A                                         |
| PATCHSingle.js        | N/A                                          | N/A                                         |
| POSTBulk.js           | N/A                                          | N/A                                         |
| POSTSingle.js         | N/A                                          | N/A                                         |
| RPCGETSingle.js       | N/A                                          | N/A                                         |
| RPCGETSingleEmbed.js  | N/A                                          | N/A                                         |
| RPCSimple.js          | N/A                                          | N/A                                         |
| **Mean**              | **N/A**                                      | **+9.6%**                                   |

### p50

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | +2.4%                                        | -0.3%                                       |
| GETSingle.js          | -14.1%                                       | +4.2%                                       |
| GETSingleEmbed.js     | -14.9%                                       | +9.6%                                       |
| GETSingleJWT.js       | -17.3%                                       | +4.2%                                       |
| GETSingleUniqueJWT.js | -17.9%                                       | +1.1%                                       |
| OPTIONSUniqueJWT.js   | +2.7%                                        | +0.1%                                       |
| PATCHSingle.js        | -23.0%                                       | -37.9%                                      |
| POSTBulk.js           | -66.6%                                       | -21.5%                                      |
| POSTSingle.js         | -27.9%                                       | -23.8%                                      |
| RPCGETSingle.js       | -11.2%                                       | +0.4%                                       |
| RPCGETSingleEmbed.js  | -15.6%                                       | +1.6%                                       |
| RPCSimple.js          | -17.5%                                       | -0.1%                                       |
| **Mean**              | **-18.4%**                                   | **-5.2%**                                   |

### p90

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | +12.2%                                       | +0.7%                                       |
| GETSingle.js          | -5.8%                                        | +31.1%                                      |
| GETSingleEmbed.js     | -3.8%                                        | +51.1%                                      |
| GETSingleJWT.js       | -8.1%                                        | +15.6%                                      |
| GETSingleUniqueJWT.js | -22.0%                                       | +24.9%                                      |
| OPTIONSUniqueJWT.js   | +2.4%                                        | +0.9%                                       |
| PATCHSingle.js        | -28.1%                                       | -62.3%                                      |
| POSTBulk.js           | -16.3%                                       | +7.5%                                       |
| POSTSingle.js         | -45.3%                                       | -38.3%                                      |
| RPCGETSingle.js       | -7.7%                                        | +27.1%                                      |
| RPCGETSingleEmbed.js  | +10.4%                                       | +43.5%                                      |
| RPCSimple.js          | -14.0%                                       | +35.4%                                      |
| **Mean**              | **-10.5%**                                   | **+11.4%**                                  |

### p95

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -8.1%                                        | -0.5%                                       |
| GETSingle.js          | -11.1%                                       | -9.6%                                       |
| GETSingleEmbed.js     | -2.7%                                        | -11.4%                                      |
| GETSingleJWT.js       | -6.6%                                        | -20.5%                                      |
| GETSingleUniqueJWT.js | -20.4%                                       | -9.0%                                       |
| OPTIONSUniqueJWT.js   | +3.3%                                        | +1.2%                                       |
| PATCHSingle.js        | -68.3%                                       | -1.5%                                       |
| POSTBulk.js           | +60.5%                                       | +24.0%                                      |
| POSTSingle.js         | -65.9%                                       | -60.9%                                      |
| RPCGETSingle.js       | -20.5%                                       | -12.0%                                      |
| RPCGETSingleEmbed.js  | +10.8%                                       | -1.2%                                       |
| RPCSimple.js          | -24.5%                                       | -7.5%                                       |
| **Mean**              | **-12.8%**                                   | **-9.1%**                                   |

## `-A64m · db-pipeline-mode = true · postgrest-pipeline-pool-fix` vs `-A64m · db-pipeline-mode = true
  db-pre-request = "custom_headers" · devel`

### Summary

| Mean change       | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:------------------|:---------------------------------------------|:--------------------------------------------|
| http_reqs (req/s) | -18.6%                                       | -23.3%                                      |
| p50               | +37.4%                                       | +25.0%                                      |
| p95               | +18.8%                                       | +15.1%                                      |

### http_reqs (req/s)

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | +0.1%                                        | -0.8%                                       |
| GETSingle.js          | -35.9%                                       | -36.3%                                      |
| GETSingleEmbed.js     | -20.5%                                       | -28.1%                                      |
| GETSingleJWT.js       | -35.1%                                       | -35.6%                                      |
| GETSingleUniqueJWT.js | -24.9%                                       | -25.0%                                      |
| OPTIONSUniqueJWT.js   | +1.4%                                        | -0.9%                                       |
| PATCHSingle.js        | -9.7%                                        | -24.0%                                      |
| POSTBulk.js           | -1.7%                                        | -11.1%                                      |
| POSTSingle.js         | -7.1%                                        | -26.0%                                      |
| RPCGETSingle.js       | -35.3%                                       | -35.1%                                      |
| RPCGETSingleEmbed.js  | -18.7%                                       | -23.5%                                      |
| RPCSimple.js          | -35.1%                                       | -33.5%                                      |
| **Mean**              | **-18.6%**                                   | **-23.3%**                                  |

### failed requests

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | N/A                                          | -1.2%                                       |
| GETSingle.js          | N/A                                          | N/A                                         |
| GETSingleEmbed.js     | N/A                                          | N/A                                         |
| GETSingleJWT.js       | N/A                                          | N/A                                         |
| GETSingleUniqueJWT.js | N/A                                          | N/A                                         |
| OPTIONSUniqueJWT.js   | N/A                                          | N/A                                         |
| PATCHSingle.js        | N/A                                          | N/A                                         |
| POSTBulk.js           | N/A                                          | N/A                                         |
| POSTSingle.js         | N/A                                          | N/A                                         |
| RPCGETSingle.js       | N/A                                          | N/A                                         |
| RPCGETSingleEmbed.js  | N/A                                          | N/A                                         |
| RPCSimple.js          | N/A                                          | N/A                                         |
| **Mean**              | **N/A**                                      | **-1.2%**                                   |

### p50

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -1.4%                                        | +1.3%                                       |
| GETSingle.js          | +59.0%                                       | +33.4%                                      |
| GETSingleEmbed.js     | +44.1%                                       | +7.4%                                       |
| GETSingleJWT.js       | +50.4%                                       | +36.3%                                      |
| GETSingleUniqueJWT.js | +55.2%                                       | +36.4%                                      |
| OPTIONSUniqueJWT.js   | -0.6%                                        | +0.8%                                       |
| PATCHSingle.js        | +40.5%                                       | +44.6%                                      |
| POSTBulk.js           | +2.4%                                        | +21.7%                                      |
| POSTSingle.js         | +43.5%                                       | +37.0%                                      |
| RPCGETSingle.js       | +58.6%                                       | +31.8%                                      |
| RPCGETSingleEmbed.js  | +43.8%                                       | +8.9%                                       |
| RPCSimple.js          | +53.7%                                       | +40.4%                                      |
| **Mean**              | **+37.4%**                                   | **+25.0%**                                  |

### p90

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | +33.1%                                       | +0.4%                                       |
| GETSingle.js          | +49.5%                                       | +15.9%                                      |
| GETSingleEmbed.js     | +17.4%                                       | -26.3%                                      |
| GETSingleJWT.js       | +37.4%                                       | +8.5%                                       |
| GETSingleUniqueJWT.js | +31.7%                                       | -9.9%                                       |
| OPTIONSUniqueJWT.js   | -2.0%                                        | +0.1%                                       |
| PATCHSingle.js        | +6.5%                                        | +170.8%                                     |
| POSTBulk.js           | +1.5%                                        | +5.6%                                       |
| POSTSingle.js         | -22.1%                                       | +84.6%                                      |
| RPCGETSingle.js       | +43.3%                                       | +7.8%                                       |
| RPCGETSingleEmbed.js  | +13.1%                                       | -27.0%                                      |
| RPCSimple.js          | +45.1%                                       | +16.2%                                      |
| **Mean**              | **+21.2%**                                   | **+20.6%**                                  |

### p95

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -12.2%                                       | +0.6%                                       |
| GETSingle.js          | +25.6%                                       | +17.5%                                      |
| GETSingleEmbed.js     | +11.6%                                       | +6.1%                                       |
| GETSingleJWT.js       | +10.8%                                       | +13.4%                                      |
| GETSingleUniqueJWT.js | +21.5%                                       | -3.3%                                       |
| OPTIONSUniqueJWT.js   | -3.1%                                        | -0.0%                                       |
| PATCHSingle.js        | +121.0%                                      | -5.8%                                       |
| POSTBulk.js           | +5.9%                                        | +0.4%                                       |
| POSTSingle.js         | -18.7%                                       | +131.6%                                     |
| RPCGETSingle.js       | +25.5%                                       | +7.9%                                       |
| RPCGETSingleEmbed.js  | +11.1%                                       | -1.0%                                       |
| RPCSimple.js          | +26.6%                                       | +13.4%                                      |
| **Mean**              | **+18.8%**                                   | **+15.1%**                                  |

## `-A64m · db-pipeline-mode = true · postgrest-pipeline-pool-fix` vs `-A64m · db-pipeline-mode = true
  db-pre-request = "custom_headers" · postgrest-pipeline-pool-fix`

### Summary

| Mean change       | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:------------------|:---------------------------------------------|:--------------------------------------------|
| http_reqs (req/s) | -6.2%                                        | -7.2%                                       |
| p50               | +5.7%                                        | +10.6%                                      |
| p95               | +1.5%                                        | +5.2%                                       |

### http_reqs (req/s)

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -0.8%                                        | -0.2%                                       |
| GETSingle.js          | -15.5%                                       | -12.9%                                      |
| GETSingleEmbed.js     | -5.8%                                        | -6.2%                                       |
| GETSingleJWT.js       | -15.1%                                       | -15.0%                                      |
| GETSingleUniqueJWT.js | -9.3%                                        | -16.3%                                      |
| OPTIONSUniqueJWT.js   | +0.4%                                        | -0.2%                                       |
| PATCHSingle.js        | +3.0%                                        | +5.4%                                       |
| POSTBulk.js           | -1.5%                                        | -5.5%                                       |
| POSTSingle.js         | +7.2%                                        | -0.0%                                       |
| RPCGETSingle.js       | -14.3%                                       | -15.4%                                      |
| RPCGETSingleEmbed.js  | -8.5%                                        | -9.7%                                       |
| RPCSimple.js          | -14.4%                                       | -10.5%                                      |
| **Mean**              | **-6.2%**                                    | **-7.2%**                                   |

### failed requests

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | N/A                                          | +4.0%                                       |
| GETSingle.js          | N/A                                          | N/A                                         |
| GETSingleEmbed.js     | N/A                                          | N/A                                         |
| GETSingleJWT.js       | N/A                                          | N/A                                         |
| GETSingleUniqueJWT.js | N/A                                          | N/A                                         |
| OPTIONSUniqueJWT.js   | N/A                                          | N/A                                         |
| PATCHSingle.js        | N/A                                          | N/A                                         |
| POSTBulk.js           | N/A                                          | N/A                                         |
| POSTSingle.js         | N/A                                          | N/A                                         |
| RPCGETSingle.js       | N/A                                          | N/A                                         |
| RPCGETSingleEmbed.js  | N/A                                          | N/A                                         |
| RPCSimple.js          | N/A                                          | N/A                                         |
| **Mean**              | **N/A**                                      | **+4.0%**                                   |

### p50

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | +1.3%                                        | +0.5%                                       |
| GETSingle.js          | +21.6%                                       | +21.9%                                      |
| GETSingleEmbed.js     | +9.1%                                        | +12.3%                                      |
| GETSingleJWT.js       | +7.2%                                        | +30.3%                                      |
| GETSingleUniqueJWT.js | +5.2%                                        | +20.5%                                      |
| OPTIONSUniqueJWT.js   | -1.1%                                        | +0.7%                                       |
| PATCHSingle.js        | +0.8%                                        | -2.6%                                       |
| POSTBulk.js           | -19.0%                                       | -15.5%                                      |
| POSTSingle.js         | -0.2%                                        | +0.1%                                       |
| RPCGETSingle.js       | +22.2%                                       | +22.0%                                      |
| RPCGETSingleEmbed.js  | +6.8%                                        | +11.7%                                      |
| RPCSimple.js          | +14.2%                                       | +25.2%                                      |
| **Mean**              | **+5.7%**                                    | **+10.6%**                                  |

### p90

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -1.8%                                        | +0.4%                                       |
| GETSingle.js          | +34.5%                                       | +45.6%                                      |
| GETSingleEmbed.js     | +7.5%                                        | +12.1%                                      |
| GETSingleJWT.js       | +17.2%                                       | +36.4%                                      |
| GETSingleUniqueJWT.js | +2.2%                                        | +36.8%                                      |
| OPTIONSUniqueJWT.js   | -2.1%                                        | +0.2%                                       |
| PATCHSingle.js        | -10.9%                                       | +11.2%                                      |
| POSTBulk.js           | -16.5%                                       | +6.4%                                       |
| POSTSingle.js         | -34.6%                                       | -3.5%                                       |
| RPCGETSingle.js       | +39.0%                                       | +39.7%                                      |
| RPCGETSingleEmbed.js  | +14.3%                                       | +12.3%                                      |
| RPCSimple.js          | +27.2%                                       | +48.5%                                      |
| **Mean**              | **+6.3%**                                    | **+20.5%**                                  |

### p95

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -11.1%                                       | -0.3%                                       |
| GETSingle.js          | +13.0%                                       | +15.2%                                      |
| GETSingleEmbed.js     | +5.1%                                        | +2.0%                                       |
| GETSingleJWT.js       | +1.9%                                        | +11.3%                                      |
| GETSingleUniqueJWT.js | -3.4%                                        | +3.8%                                       |
| OPTIONSUniqueJWT.js   | -3.5%                                        | -0.4%                                       |
| PATCHSingle.js        | -5.8%                                        | -9.9%                                       |
| POSTBulk.js           | +13.3%                                       | +12.6%                                      |
| POSTSingle.js         | -20.1%                                       | -6.4%                                       |
| RPCGETSingle.js       | +11.8%                                       | +16.2%                                      |
| RPCGETSingleEmbed.js  | +11.4%                                       | +2.5%                                       |
| RPCSimple.js          | +5.7%                                        | +15.6%                                      |
| **Mean**              | **+1.5%**                                    | **+5.2%**                                   |

## `-A64m · db-pipeline-mode = true
  db-pre-request = "custom_headers" · devel` vs `-A64m · db-pipeline-mode = true
  db-pre-request = "custom_headers" · postgrest-pipeline-pool-fix`

### Summary

| Mean change       | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:------------------|:---------------------------------------------|:--------------------------------------------|
| http_reqs (req/s) | +17.2%                                       | +22.9%                                      |
| p50               | -21.7%                                       | -10.6%                                      |
| p95               | -10.2%                                       | -3.4%                                       |

### http_reqs (req/s)

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -0.9%                                        | +0.6%                                       |
| GETSingle.js          | +31.9%                                       | +36.8%                                      |
| GETSingleEmbed.js     | +18.5%                                       | +30.6%                                      |
| GETSingleJWT.js       | +30.9%                                       | +32.0%                                      |
| GETSingleUniqueJWT.js | +20.8%                                       | +11.5%                                      |
| OPTIONSUniqueJWT.js   | -0.9%                                        | +0.7%                                       |
| PATCHSingle.js        | +14.2%                                       | +38.6%                                      |
| POSTBulk.js           | +0.2%                                        | +6.3%                                       |
| POSTSingle.js         | +15.5%                                       | +35.2%                                      |
| RPCGETSingle.js       | +32.5%                                       | +30.4%                                      |
| RPCGETSingleEmbed.js  | +12.6%                                       | +18.0%                                      |
| RPCSimple.js          | +31.8%                                       | +34.6%                                      |
| **Mean**              | **+17.2%**                                   | **+22.9%**                                  |

### failed requests

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | N/A                                          | +5.2%                                       |
| GETSingle.js          | N/A                                          | N/A                                         |
| GETSingleEmbed.js     | N/A                                          | N/A                                         |
| GETSingleJWT.js       | N/A                                          | N/A                                         |
| GETSingleUniqueJWT.js | N/A                                          | N/A                                         |
| OPTIONSUniqueJWT.js   | N/A                                          | N/A                                         |
| PATCHSingle.js        | N/A                                          | N/A                                         |
| POSTBulk.js           | N/A                                          | N/A                                         |
| POSTSingle.js         | N/A                                          | N/A                                         |
| RPCGETSingle.js       | N/A                                          | N/A                                         |
| RPCGETSingleEmbed.js  | N/A                                          | N/A                                         |
| RPCSimple.js          | N/A                                          | N/A                                         |
| **Mean**              | **N/A**                                      | **+5.2%**                                   |

### p50

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | +2.7%                                        | -0.8%                                       |
| GETSingle.js          | -23.5%                                       | -8.6%                                       |
| GETSingleEmbed.js     | -24.2%                                       | +4.6%                                       |
| GETSingleJWT.js       | -28.7%                                       | -4.4%                                       |
| GETSingleUniqueJWT.js | -32.2%                                       | -11.7%                                      |
| OPTIONSUniqueJWT.js   | -0.5%                                        | -0.1%                                       |
| PATCHSingle.js        | -28.3%                                       | -32.7%                                      |
| POSTBulk.js           | -20.9%                                       | -30.6%                                      |
| POSTSingle.js         | -30.5%                                       | -27.0%                                      |
| RPCGETSingle.js       | -22.9%                                       | -7.4%                                       |
| RPCGETSingleEmbed.js  | -25.7%                                       | +2.6%                                       |
| RPCSimple.js          | -25.7%                                       | -10.8%                                      |
| **Mean**              | **-21.7%**                                   | **-10.6%**                                  |

### p90

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | -26.2%                                       | -0.1%                                       |
| GETSingle.js          | -10.0%                                       | +25.7%                                      |
| GETSingleEmbed.js     | -8.5%                                        | +52.1%                                      |
| GETSingleJWT.js       | -14.7%                                       | +25.8%                                      |
| GETSingleUniqueJWT.js | -22.4%                                       | +51.9%                                      |
| OPTIONSUniqueJWT.js   | -0.2%                                        | +0.1%                                       |
| PATCHSingle.js        | -16.3%                                       | -58.9%                                      |
| POSTBulk.js           | -17.7%                                       | +0.7%                                       |
| POSTSingle.js         | -16.0%                                       | -47.7%                                      |
| RPCGETSingle.js       | -3.0%                                        | +29.7%                                      |
| RPCGETSingleEmbed.js  | +1.1%                                        | +53.7%                                      |
| RPCSimple.js          | -12.3%                                       | +27.8%                                      |
| **Mean**              | **-12.2%**                                   | **+13.4%**                                  |

### p95

| Test                  | 400 VUs · m5a.8xlarge · separate PG: false   | 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:---------------------------------------------|:--------------------------------------------|
| GETAllEmbed.js        | +1.3%                                        | -0.9%                                       |
| GETSingle.js          | -10.0%                                       | -2.0%                                       |
| GETSingleEmbed.js     | -5.8%                                        | -3.8%                                       |
| GETSingleJWT.js       | -8.0%                                        | -1.9%                                       |
| GETSingleUniqueJWT.js | -20.5%                                       | +7.4%                                       |
| OPTIONSUniqueJWT.js   | -0.4%                                        | -0.3%                                       |
| PATCHSingle.js        | -57.4%                                       | -4.4%                                       |
| POSTBulk.js           | +6.9%                                        | +12.1%                                      |
| POSTSingle.js         | -1.7%                                        | -59.6%                                      |
| RPCGETSingle.js       | -10.9%                                       | +7.6%                                       |
| RPCGETSingleEmbed.js  | +0.3%                                        | +3.5%                                       |
| RPCSimple.js          | -16.5%                                       | +1.9%                                       |
| **Mean**              | **-10.2%**                                   | **-3.4%**                                   |