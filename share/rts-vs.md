## `-N4 -A64m · default` vs `-N8 -A64m · default`

### Summary

| Mean change       | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| http_reqs (req/s) | +25.8%                                                       | +42.8%                                              |
| p50               | -27.8%                                                       | -35.8%                                              |
| p95               | -2.6%                                                        | -16.6%                                              |

### http_reqs (req/s)

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | +4.7%                                                        | +0.0%                                               |
| GETSingle.js          | +17.1%                                                       | +44.6%                                              |
| GETSingleEmbed.js     | +35.3%                                                       | +50.8%                                              |
| GETSingleJWT.js       | +20.8%                                                       | +47.4%                                              |
| GETSingleUniqueJWT.js | +26.9%                                                       | +47.1%                                              |
| OPTIONSUniqueJWT.js   | +22.4%                                                       | +38.3%                                              |
| PATCHSingle.js        | +24.2%                                                       | +46.2%                                              |
| POSTBulk.js           | +47.9%                                                       | +47.1%                                              |
| POSTSingle.js         | +31.3%                                                       | +51.3%                                              |
| RPCGETSingle.js       | +16.0%                                                       | +41.6%                                              |
| RPCGETSingleEmbed.js  | +43.0%                                                       | +54.8%                                              |
| RPCSimple.js          | +20.2%                                                       | +44.7%                                              |
| **Mean**              | **+25.8%**                                                   | **+42.8%**                                          |

### failed requests

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | N/A                                                          | N/A                                                 |
| GETSingle.js          | N/A                                                          | N/A                                                 |
| GETSingleEmbed.js     | N/A                                                          | N/A                                                 |
| GETSingleJWT.js       | N/A                                                          | N/A                                                 |
| GETSingleUniqueJWT.js | N/A                                                          | N/A                                                 |
| OPTIONSUniqueJWT.js   | N/A                                                          | N/A                                                 |
| PATCHSingle.js        | N/A                                                          | N/A                                                 |
| POSTBulk.js           | N/A                                                          | N/A                                                 |
| POSTSingle.js         | -100.0%                                                      | N/A                                                 |
| RPCGETSingle.js       | N/A                                                          | N/A                                                 |
| RPCGETSingleEmbed.js  | N/A                                                          | N/A                                                 |
| RPCSimple.js          | N/A                                                          | N/A                                                 |
| **Mean**              | **-100.0%**                                                  | **N/A**                                             |

### p50

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -4.3%                                                        | -0.3%                                               |
| GETSingle.js          | -14.9%                                                       | -31.4%                                              |
| GETSingleEmbed.js     | -24.2%                                                       | -35.6%                                              |
| GETSingleJWT.js       | -22.9%                                                       | -32.9%                                              |
| GETSingleUniqueJWT.js | -46.8%                                                       | -35.7%                                              |
| OPTIONSUniqueJWT.js   | -62.6%                                                       | -70.3%                                              |
| PATCHSingle.js        | -35.3%                                                       | -33.8%                                              |
| POSTBulk.js           | -37.6%                                                       | -44.5%                                              |
| POSTSingle.js         | -21.5%                                                       | -36.0%                                              |
| RPCGETSingle.js       | -12.8%                                                       | -31.0%                                              |
| RPCGETSingleEmbed.js  | -31.2%                                                       | -45.8%                                              |
| RPCSimple.js          | -19.9%                                                       | -32.4%                                              |
| **Mean**              | **-27.8%**                                                   | **-35.8%**                                          |

### p90

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -4.0%                                                        | -0.1%                                               |
| GETSingle.js          | -24.5%                                                       | -11.1%                                              |
| GETSingleEmbed.js     | -19.7%                                                       | -19.9%                                              |
| GETSingleJWT.js       | -24.3%                                                       | -13.3%                                              |
| GETSingleUniqueJWT.js | +42.9%                                                       | -7.0%                                               |
| OPTIONSUniqueJWT.js   | -31.0%                                                       | -42.0%                                              |
| PATCHSingle.js        | +16.7%                                                       | -14.8%                                              |
| POSTBulk.js           | -17.4%                                                       | -34.5%                                              |
| POSTSingle.js         | -32.5%                                                       | -21.5%                                              |
| RPCGETSingle.js       | -7.1%                                                        | -11.9%                                              |
| RPCGETSingleEmbed.js  | -34.2%                                                       | -23.6%                                              |
| RPCSimple.js          | -0.9%                                                        | -17.9%                                              |
| **Mean**              | **-11.3%**                                                   | **-18.1%**                                          |

### p95

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -4.3%                                                        | -0.3%                                               |
| GETSingle.js          | -17.6%                                                       | -10.4%                                              |
| GETSingleEmbed.js     | -3.0%                                                        | -19.4%                                              |
| GETSingleJWT.js       | -12.5%                                                       | -13.7%                                              |
| GETSingleUniqueJWT.js | +44.0%                                                       | -8.3%                                               |
| OPTIONSUniqueJWT.js   | -24.6%                                                       | -32.3%                                              |
| PATCHSingle.js        | +41.8%                                                       | -12.3%                                              |
| POSTBulk.js           | -3.8%                                                        | -34.6%                                              |
| POSTSingle.js         | -21.4%                                                       | -20.6%                                              |
| RPCGETSingle.js       | +11.2%                                                       | -8.5%                                               |
| RPCGETSingleEmbed.js  | -38.5%                                                       | -23.0%                                              |
| RPCSimple.js          | -2.4%                                                        | -16.4%                                              |
| **Mean**              | **-2.6%**                                                    | **-16.6%**                                          |

## `-N4 -A64m · default` vs `-N16 -A64m · default`

### Summary

| Mean change       | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| http_reqs (req/s) | +55.0%                                                       | +39.6%                                              |
| p50               | -63.2%                                                       | -32.5%                                              |
| p95               | -38.7%                                                       | -6.9%                                               |

### http_reqs (req/s)

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | +4.8%                                                        | +0.1%                                               |
| GETSingle.js          | +56.5%                                                       | +33.9%                                              |
| GETSingleEmbed.js     | +93.8%                                                       | +51.9%                                              |
| GETSingleJWT.js       | +59.2%                                                       | +38.8%                                              |
| GETSingleUniqueJWT.js | +62.7%                                                       | +48.4%                                              |
| OPTIONSUniqueJWT.js   | +24.0%                                                       | +38.8%                                              |
| PATCHSingle.js        | +37.6%                                                       | +42.7%                                              |
| POSTBulk.js           | +49.4%                                                       | +59.7%                                              |
| POSTSingle.js         | +55.2%                                                       | +49.4%                                              |
| RPCGETSingle.js       | +53.8%                                                       | +25.7%                                              |
| RPCGETSingleEmbed.js  | +102.9%                                                      | +57.5%                                              |
| RPCSimple.js          | +60.1%                                                       | +28.7%                                              |
| **Mean**              | **+55.0%**                                                   | **+39.6%**                                          |

### failed requests

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | N/A                                                          | N/A                                                 |
| GETSingle.js          | N/A                                                          | N/A                                                 |
| GETSingleEmbed.js     | N/A                                                          | N/A                                                 |
| GETSingleJWT.js       | N/A                                                          | N/A                                                 |
| GETSingleUniqueJWT.js | N/A                                                          | N/A                                                 |
| OPTIONSUniqueJWT.js   | N/A                                                          | N/A                                                 |
| PATCHSingle.js        | N/A                                                          | N/A                                                 |
| POSTBulk.js           | N/A                                                          | N/A                                                 |
| POSTSingle.js         | -100.0%                                                      | N/A                                                 |
| RPCGETSingle.js       | N/A                                                          | N/A                                                 |
| RPCGETSingleEmbed.js  | N/A                                                          | N/A                                                 |
| RPCSimple.js          | N/A                                                          | N/A                                                 |
| **Mean**              | **-100.0%**                                                  | **N/A**                                             |

### p50

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -4.7%                                                        | -0.2%                                               |
| GETSingle.js          | -71.1%                                                       | -24.4%                                              |
| GETSingleEmbed.js     | -73.5%                                                       | -34.0%                                              |
| GETSingleJWT.js       | -74.7%                                                       | -27.6%                                              |
| GETSingleUniqueJWT.js | -74.6%                                                       | -33.4%                                              |
| OPTIONSUniqueJWT.js   | -68.7%                                                       | -74.4%                                              |
| PATCHSingle.js        | -70.1%                                                       | -30.6%                                              |
| POSTBulk.js           | -57.9%                                                       | -46.3%                                              |
| POSTSingle.js         | -59.8%                                                       | -33.5%                                              |
| RPCGETSingle.js       | -70.0%                                                       | -20.3%                                              |
| RPCGETSingleEmbed.js  | -63.5%                                                       | -43.6%                                              |
| RPCSimple.js          | -69.6%                                                       | -21.4%                                              |
| **Mean**              | **-63.2%**                                                   | **-32.5%**                                          |

### p90

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -4.8%                                                        | -0.2%                                               |
| GETSingle.js          | -68.4%                                                       | -26.5%                                              |
| GETSingleEmbed.js     | -69.7%                                                       | -19.0%                                              |
| GETSingleJWT.js       | -60.6%                                                       | -27.9%                                              |
| GETSingleUniqueJWT.js | -44.7%                                                       | -34.4%                                              |
| OPTIONSUniqueJWT.js   | -34.6%                                                       | -43.3%                                              |
| PATCHSingle.js        | -40.2%                                                       | -34.6%                                              |
| POSTBulk.js           | -32.7%                                                       | -34.5%                                              |
| POSTSingle.js         | -36.1%                                                       | -19.5%                                              |
| RPCGETSingle.js       | -64.9%                                                       | -24.3%                                              |
| RPCGETSingleEmbed.js  | -65.7%                                                       | -20.2%                                              |
| RPCSimple.js          | -63.4%                                                       | -14.1%                                              |
| **Mean**              | **-48.8%**                                                   | **-24.9%**                                          |

### p95

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -4.2%                                                        | -1.3%                                               |
| GETSingle.js          | -63.8%                                                       | +1.1%                                               |
| GETSingleEmbed.js     | -64.9%                                                       | -8.9%                                               |
| GETSingleJWT.js       | -54.7%                                                       | +1.9%                                               |
| GETSingleUniqueJWT.js | -38.1%                                                       | +15.4%                                              |
| OPTIONSUniqueJWT.js   | -29.7%                                                       | -35.5%                                              |
| PATCHSingle.js        | +2.7%                                                        | -0.6%                                               |
| POSTBulk.js           | -8.1%                                                        | -39.2%                                              |
| POSTSingle.js         | -21.6%                                                       | -9.2%                                               |
| RPCGETSingle.js       | -58.7%                                                       | +8.3%                                               |
| RPCGETSingleEmbed.js  | -63.9%                                                       | -15.3%                                              |
| RPCSimple.js          | -59.0%                                                       | +0.9%                                               |
| **Mean**              | **-38.7%**                                                   | **-6.9%**                                           |

## `-N4 -A64m · default` vs `-N32 -A64m · default`

### Summary

| Mean change       | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| http_reqs (req/s) | +121.8%                                                      | +35.3%                                              |
| p50               | -74.8%                                                       | -28.8%                                              |
| p95               | -13.1%                                                       | -4.6%                                               |

### http_reqs (req/s)

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | +4.8%                                                        | +0.2%                                               |
| GETSingle.js          | +168.6%                                                      | +28.4%                                              |
| GETSingleEmbed.js     | +205.2%                                                      | +51.4%                                              |
| GETSingleJWT.js       | +169.4%                                                      | +36.0%                                              |
| GETSingleUniqueJWT.js | +142.7%                                                      | +48.4%                                              |
| OPTIONSUniqueJWT.js   | +24.2%                                                       | +36.9%                                              |
| PATCHSingle.js        | +61.1%                                                       | +34.5%                                              |
| POSTBulk.js           | +41.6%                                                       | +36.6%                                              |
| POSTSingle.js         | +94.6%                                                       | +48.7%                                              |
| RPCGETSingle.js       | +161.3%                                                      | +19.0%                                              |
| RPCGETSingleEmbed.js  | +208.8%                                                      | +59.6%                                              |
| RPCSimple.js          | +179.3%                                                      | +24.3%                                              |
| **Mean**              | **+121.8%**                                                  | **+35.3%**                                          |

### failed requests

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | N/A                                                          | N/A                                                 |
| GETSingle.js          | N/A                                                          | N/A                                                 |
| GETSingleEmbed.js     | N/A                                                          | N/A                                                 |
| GETSingleJWT.js       | N/A                                                          | N/A                                                 |
| GETSingleUniqueJWT.js | N/A                                                          | N/A                                                 |
| OPTIONSUniqueJWT.js   | N/A                                                          | N/A                                                 |
| PATCHSingle.js        | N/A                                                          | N/A                                                 |
| POSTBulk.js           | N/A                                                          | N/A                                                 |
| POSTSingle.js         | -100.0%                                                      | N/A                                                 |
| RPCGETSingle.js       | N/A                                                          | N/A                                                 |
| RPCGETSingleEmbed.js  | N/A                                                          | N/A                                                 |
| RPCSimple.js          | N/A                                                          | N/A                                                 |
| **Mean**              | **-100.0%**                                                  | **N/A**                                             |

### p50

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -4.2%                                                        | -0.9%                                               |
| GETSingle.js          | -83.5%                                                       | -18.9%                                              |
| GETSingleEmbed.js     | -85.0%                                                       | -31.7%                                              |
| GETSingleJWT.js       | -86.1%                                                       | -23.5%                                              |
| GETSingleUniqueJWT.js | -87.6%                                                       | -31.0%                                              |
| OPTIONSUniqueJWT.js   | -66.8%                                                       | -74.2%                                              |
| PATCHSingle.js        | -79.1%                                                       | -25.0%                                              |
| POSTBulk.js           | -67.4%                                                       | -38.9%                                              |
| POSTSingle.js         | -85.7%                                                       | -31.1%                                              |
| RPCGETSingle.js       | -83.1%                                                       | -12.0%                                              |
| RPCGETSingleEmbed.js  | -84.9%                                                       | -41.8%                                              |
| RPCSimple.js          | -84.1%                                                       | -15.9%                                              |
| **Mean**              | **-74.8%**                                                   | **-28.8%**                                          |

### p90

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -5.1%                                                        | -0.3%                                               |
| GETSingle.js          | -80.6%                                                       | -16.8%                                              |
| GETSingleEmbed.js     | -81.6%                                                       | -23.9%                                              |
| GETSingleJWT.js       | -76.9%                                                       | -20.8%                                              |
| GETSingleUniqueJWT.js | -69.6%                                                       | -34.9%                                              |
| OPTIONSUniqueJWT.js   | -31.8%                                                       | -42.1%                                              |
| PATCHSingle.js        | +83.9%                                                       | -22.8%                                              |
| POSTBulk.js           | +74.0%                                                       | -14.3%                                              |
| POSTSingle.js         | -29.4%                                                       | -25.7%                                              |
| RPCGETSingle.js       | -77.9%                                                       | -11.0%                                              |
| RPCGETSingleEmbed.js  | -84.4%                                                       | -24.2%                                              |
| RPCSimple.js          | -80.7%                                                       | -12.4%                                              |
| **Mean**              | **-38.3%**                                                   | **-20.8%**                                          |

### p95

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -3.8%                                                        | -0.9%                                               |
| GETSingle.js          | -68.3%                                                       | -3.0%                                               |
| GETSingleEmbed.js     | -61.8%                                                       | -5.2%                                               |
| GETSingleJWT.js       | -60.9%                                                       | -6.0%                                               |
| GETSingleUniqueJWT.js | -21.4%                                                       | +17.5%                                              |
| OPTIONSUniqueJWT.js   | -25.6%                                                       | -33.6%                                              |
| PATCHSingle.js        | +122.3%                                                      | -5.0%                                               |
| POSTBulk.js           | +79.3%                                                       | -9.6%                                               |
| POSTSingle.js         | +88.4%                                                       | -5.5%                                               |
| RPCGETSingle.js       | -62.0%                                                       | +1.7%                                               |
| RPCGETSingleEmbed.js  | -75.2%                                                       | -8.3%                                               |
| RPCSimple.js          | -68.9%                                                       | +3.3%                                               |
| **Mean**              | **-13.1%**                                                   | **-4.6%**                                           |

## `-N8 -A64m · default` vs `-N16 -A64m · default`

### Summary

| Mean change       | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| http_reqs (req/s) | +23.0%                                                       | -2.2%                                               |
| p50               | -48.1%                                                       | +4.3%                                               |
| p95               | -35.6%                                                       | +11.1%                                              |

### http_reqs (req/s)

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | +0.1%                                                        | +0.0%                                               |
| GETSingle.js          | +33.6%                                                       | -7.4%                                               |
| GETSingleEmbed.js     | +43.3%                                                       | +0.7%                                               |
| GETSingleJWT.js       | +31.8%                                                       | -5.8%                                               |
| GETSingleUniqueJWT.js | +28.2%                                                       | +0.8%                                               |
| OPTIONSUniqueJWT.js   | +1.3%                                                        | +0.4%                                               |
| PATCHSingle.js        | +10.8%                                                       | -2.3%                                               |
| POSTBulk.js           | +1.0%                                                        | +8.6%                                               |
| POSTSingle.js         | +18.1%                                                       | -1.2%                                               |
| RPCGETSingle.js       | +32.5%                                                       | -11.2%                                              |
| RPCGETSingleEmbed.js  | +41.8%                                                       | +1.7%                                               |
| RPCSimple.js          | +33.1%                                                       | -11.0%                                              |
| **Mean**              | **+23.0%**                                                   | **-2.2%**                                           |

### failed requests

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | N/A                                                          | N/A                                                 |
| GETSingle.js          | N/A                                                          | N/A                                                 |
| GETSingleEmbed.js     | N/A                                                          | N/A                                                 |
| GETSingleJWT.js       | N/A                                                          | N/A                                                 |
| GETSingleUniqueJWT.js | N/A                                                          | N/A                                                 |
| OPTIONSUniqueJWT.js   | N/A                                                          | N/A                                                 |
| PATCHSingle.js        | N/A                                                          | N/A                                                 |
| POSTBulk.js           | N/A                                                          | N/A                                                 |
| POSTSingle.js         | N/A                                                          | N/A                                                 |
| RPCGETSingle.js       | N/A                                                          | N/A                                                 |
| RPCGETSingleEmbed.js  | N/A                                                          | N/A                                                 |
| RPCSimple.js          | N/A                                                          | N/A                                                 |
| **Mean**              | **N/A**                                                      | **N/A**                                             |

### p50

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -0.4%                                                        | +0.1%                                               |
| GETSingle.js          | -66.1%                                                       | +10.2%                                              |
| GETSingleEmbed.js     | -65.1%                                                       | +2.5%                                               |
| GETSingleJWT.js       | -67.2%                                                       | +8.0%                                               |
| GETSingleUniqueJWT.js | -52.3%                                                       | +3.6%                                               |
| OPTIONSUniqueJWT.js   | -16.2%                                                       | -13.8%                                              |
| PATCHSingle.js        | -53.9%                                                       | +4.9%                                               |
| POSTBulk.js           | -32.5%                                                       | -3.3%                                               |
| POSTSingle.js         | -48.8%                                                       | +3.9%                                               |
| RPCGETSingle.js       | -65.6%                                                       | +15.4%                                              |
| RPCGETSingleEmbed.js  | -47.0%                                                       | +4.0%                                               |
| RPCSimple.js          | -62.0%                                                       | +16.3%                                              |
| **Mean**              | **-48.1%**                                                   | **+4.3%**                                           |

### p90

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -0.9%                                                        | -0.2%                                               |
| GETSingle.js          | -58.2%                                                       | -17.3%                                              |
| GETSingleEmbed.js     | -62.2%                                                       | +1.2%                                               |
| GETSingleJWT.js       | -48.0%                                                       | -16.9%                                              |
| GETSingleUniqueJWT.js | -61.3%                                                       | -29.5%                                              |
| OPTIONSUniqueJWT.js   | -5.2%                                                        | -2.3%                                               |
| PATCHSingle.js        | -48.8%                                                       | -23.2%                                              |
| POSTBulk.js           | -18.5%                                                       | +0.1%                                               |
| POSTSingle.js         | -5.4%                                                        | +2.6%                                               |
| RPCGETSingle.js       | -62.2%                                                       | -14.1%                                              |
| RPCGETSingleEmbed.js  | -47.9%                                                       | +4.4%                                               |
| RPCSimple.js          | -63.0%                                                       | +4.5%                                               |
| **Mean**              | **-40.1%**                                                   | **-7.5%**                                           |

### p95

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | +0.0%                                                        | -1.0%                                               |
| GETSingle.js          | -56.1%                                                       | +12.8%                                              |
| GETSingleEmbed.js     | -63.8%                                                       | +13.0%                                              |
| GETSingleJWT.js       | -48.2%                                                       | +18.0%                                              |
| GETSingleUniqueJWT.js | -57.0%                                                       | +25.9%                                              |
| OPTIONSUniqueJWT.js   | -6.9%                                                        | -4.7%                                               |
| PATCHSingle.js        | -27.6%                                                       | +13.4%                                              |
| POSTBulk.js           | -4.5%                                                        | -7.0%                                               |
| POSTSingle.js         | -0.4%                                                        | +14.3%                                              |
| RPCGETSingle.js       | -62.9%                                                       | +18.4%                                              |
| RPCGETSingleEmbed.js  | -41.4%                                                       | +10.0%                                              |
| RPCSimple.js          | -58.0%                                                       | +20.7%                                              |
| **Mean**              | **-35.6%**                                                   | **+11.1%**                                          |

## `-N8 -A64m · default` vs `-N32 -A64m · default`

### Summary

| Mean change       | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| http_reqs (req/s) | +76.5%                                                       | -5.2%                                               |
| p50               | -63.9%                                                       | +10.2%                                              |
| p95               | -11.2%                                                       | +15.0%                                              |

### http_reqs (req/s)

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | +0.1%                                                        | +0.1%                                               |
| GETSingle.js          | +129.4%                                                      | -11.2%                                              |
| GETSingleEmbed.js     | +125.6%                                                      | +0.4%                                               |
| GETSingleJWT.js       | +123.0%                                                      | -7.7%                                               |
| GETSingleUniqueJWT.js | +91.3%                                                       | +0.9%                                               |
| OPTIONSUniqueJWT.js   | +1.5%                                                        | -1.1%                                               |
| PATCHSingle.js        | +29.7%                                                       | -8.0%                                               |
| POSTBulk.js           | -4.3%                                                        | -7.1%                                               |
| POSTSingle.js         | +48.2%                                                       | -1.7%                                               |
| RPCGETSingle.js       | +125.2%                                                      | -16.0%                                              |
| RPCGETSingleEmbed.js  | +115.9%                                                      | +3.1%                                               |
| RPCSimple.js          | +132.3%                                                      | -14.1%                                              |
| **Mean**              | **+76.5%**                                                   | **-5.2%**                                           |

### failed requests

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | N/A                                                          | N/A                                                 |
| GETSingle.js          | N/A                                                          | N/A                                                 |
| GETSingleEmbed.js     | N/A                                                          | N/A                                                 |
| GETSingleJWT.js       | N/A                                                          | N/A                                                 |
| GETSingleUniqueJWT.js | N/A                                                          | N/A                                                 |
| OPTIONSUniqueJWT.js   | N/A                                                          | N/A                                                 |
| PATCHSingle.js        | N/A                                                          | N/A                                                 |
| POSTBulk.js           | N/A                                                          | N/A                                                 |
| POSTSingle.js         | N/A                                                          | N/A                                                 |
| RPCGETSingle.js       | N/A                                                          | N/A                                                 |
| RPCGETSingleEmbed.js  | N/A                                                          | N/A                                                 |
| RPCSimple.js          | N/A                                                          | N/A                                                 |
| **Mean**              | **N/A**                                                      | **N/A**                                             |

### p50

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | +0.1%                                                        | -0.6%                                               |
| GETSingle.js          | -80.6%                                                       | +18.2%                                              |
| GETSingleEmbed.js     | -80.2%                                                       | +6.0%                                               |
| GETSingleJWT.js       | -82.0%                                                       | +14.0%                                              |
| GETSingleUniqueJWT.js | -76.6%                                                       | +7.4%                                               |
| OPTIONSUniqueJWT.js   | -11.3%                                                       | -12.9%                                              |
| PATCHSingle.js        | -67.8%                                                       | +13.3%                                              |
| POSTBulk.js           | -47.7%                                                       | +10.1%                                              |
| POSTSingle.js         | -81.8%                                                       | +7.6%                                               |
| RPCGETSingle.js       | -80.6%                                                       | +27.4%                                              |
| RPCGETSingleEmbed.js  | -78.1%                                                       | +7.4%                                               |
| RPCSimple.js          | -80.1%                                                       | +24.3%                                              |
| **Mean**              | **-63.9%**                                                   | **+10.2%**                                          |

### p90

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -1.2%                                                        | -0.3%                                               |
| GETSingle.js          | -74.3%                                                       | -6.4%                                               |
| GETSingleEmbed.js     | -77.0%                                                       | -5.0%                                               |
| GETSingleJWT.js       | -69.5%                                                       | -8.7%                                               |
| GETSingleUniqueJWT.js | -78.7%                                                       | -30.1%                                              |
| OPTIONSUniqueJWT.js   | -1.0%                                                        | -0.2%                                               |
| PATCHSingle.js        | +57.5%                                                       | -9.4%                                               |
| POSTBulk.js           | +110.6%                                                      | +31.0%                                              |
| POSTSingle.js         | +4.6%                                                        | -5.2%                                               |
| RPCGETSingle.js       | -76.2%                                                       | +1.0%                                               |
| RPCGETSingleEmbed.js  | -76.3%                                                       | -0.8%                                               |
| RPCSimple.js          | -80.5%                                                       | +6.6%                                               |
| **Mean**              | **-30.2%**                                                   | **-2.3%**                                           |

### p95

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | +0.5%                                                        | -0.5%                                               |
| GETSingle.js          | -61.5%                                                       | +8.2%                                               |
| GETSingleEmbed.js     | -60.6%                                                       | +17.6%                                              |
| GETSingleJWT.js       | -55.3%                                                       | +8.8%                                               |
| GETSingleUniqueJWT.js | -45.4%                                                       | +28.1%                                              |
| OPTIONSUniqueJWT.js   | -1.3%                                                        | -1.9%                                               |
| PATCHSingle.js        | +56.7%                                                       | +8.3%                                               |
| POSTBulk.js           | +86.4%                                                       | +38.3%                                              |
| POSTSingle.js         | +139.6%                                                      | +19.0%                                              |
| RPCGETSingle.js       | -65.8%                                                       | +11.2%                                              |
| RPCGETSingleEmbed.js  | -59.7%                                                       | +19.0%                                              |
| RPCSimple.js          | -68.2%                                                       | +23.5%                                              |
| **Mean**              | **-11.2%**                                                   | **+15.0%**                                          |

## `-N16 -A64m · default` vs `-N32 -A64m · default`

### Summary

| Mean change       | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| http_reqs (req/s) | +40.2%                                                       | -3.0%                                               |
| p50               | -36.9%                                                       | +5.5%                                               |
| p95               | +25.4%                                                       | +4.2%                                               |

### http_reqs (req/s)

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | +0.1%                                                        | +0.1%                                               |
| GETSingle.js          | +71.7%                                                       | -4.1%                                               |
| GETSingleEmbed.js     | +57.5%                                                       | -0.3%                                               |
| GETSingleJWT.js       | +69.3%                                                       | -2.0%                                               |
| GETSingleUniqueJWT.js | +49.2%                                                       | +0.0%                                               |
| OPTIONSUniqueJWT.js   | +0.2%                                                        | -1.4%                                               |
| PATCHSingle.js        | +17.1%                                                       | -5.8%                                               |
| POSTBulk.js           | -5.2%                                                        | -14.5%                                              |
| POSTSingle.js         | +25.4%                                                       | -0.5%                                               |
| RPCGETSingle.js       | +69.9%                                                       | -5.3%                                               |
| RPCGETSingleEmbed.js  | +52.2%                                                       | +1.3%                                               |
| RPCSimple.js          | +74.5%                                                       | -3.4%                                               |
| **Mean**              | **+40.2%**                                                   | **-3.0%**                                           |

### failed requests

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | N/A                                                          | N/A                                                 |
| GETSingle.js          | N/A                                                          | N/A                                                 |
| GETSingleEmbed.js     | N/A                                                          | N/A                                                 |
| GETSingleJWT.js       | N/A                                                          | N/A                                                 |
| GETSingleUniqueJWT.js | N/A                                                          | N/A                                                 |
| OPTIONSUniqueJWT.js   | N/A                                                          | N/A                                                 |
| PATCHSingle.js        | N/A                                                          | N/A                                                 |
| POSTBulk.js           | N/A                                                          | N/A                                                 |
| POSTSingle.js         | N/A                                                          | N/A                                                 |
| RPCGETSingle.js       | N/A                                                          | N/A                                                 |
| RPCGETSingleEmbed.js  | N/A                                                          | N/A                                                 |
| RPCSimple.js          | N/A                                                          | N/A                                                 |
| **Mean**              | **N/A**                                                      | **N/A**                                             |

### p50

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | +0.5%                                                        | -0.8%                                               |
| GETSingle.js          | -42.8%                                                       | +7.2%                                               |
| GETSingleEmbed.js     | -43.2%                                                       | +3.4%                                               |
| GETSingleJWT.js       | -45.0%                                                       | +5.6%                                               |
| GETSingleUniqueJWT.js | -51.1%                                                       | +3.7%                                               |
| OPTIONSUniqueJWT.js   | +5.9%                                                        | +1.0%                                               |
| PATCHSingle.js        | -30.2%                                                       | +8.0%                                               |
| POSTBulk.js           | -22.5%                                                       | +13.8%                                              |
| POSTSingle.js         | -64.5%                                                       | +3.5%                                               |
| RPCGETSingle.js       | -43.6%                                                       | +10.4%                                              |
| RPCGETSingleEmbed.js  | -58.6%                                                       | +3.3%                                               |
| RPCSimple.js          | -47.6%                                                       | +6.9%                                               |
| **Mean**              | **-36.9%**                                                   | **+5.5%**                                           |

### p90

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | -0.3%                                                        | -0.1%                                               |
| GETSingle.js          | -38.4%                                                       | +13.1%                                              |
| GETSingleEmbed.js     | -39.2%                                                       | -6.2%                                               |
| GETSingleJWT.js       | -41.3%                                                       | +9.8%                                               |
| GETSingleUniqueJWT.js | -45.0%                                                       | -0.8%                                               |
| OPTIONSUniqueJWT.js   | +4.4%                                                        | +2.1%                                               |
| PATCHSingle.js        | +207.7%                                                      | +18.0%                                              |
| POSTBulk.js           | +158.5%                                                      | +30.8%                                              |
| POSTSingle.js         | +10.6%                                                       | -7.6%                                               |
| RPCGETSingle.js       | -36.9%                                                       | +17.7%                                              |
| RPCGETSingleEmbed.js  | -54.5%                                                       | -5.0%                                               |
| RPCSimple.js          | -47.2%                                                       | +2.0%                                               |
| **Mean**              | **+6.5%**                                                    | **+6.2%**                                           |

### p95

| Test                  | postgrest-5377 · 400 VUs · m5a.8xlarge · separate PG: true   | v16.4 · 400 VUs · m5a.8xlarge · separate PG: true   |
|:----------------------|:-------------------------------------------------------------|:----------------------------------------------------|
| GETAllEmbed.js        | +0.5%                                                        | +0.4%                                               |
| GETSingle.js          | -12.3%                                                       | -4.1%                                               |
| GETSingleEmbed.js     | +9.0%                                                        | +4.1%                                               |
| GETSingleJWT.js       | -13.7%                                                       | -7.8%                                               |
| GETSingleUniqueJWT.js | +27.1%                                                       | +1.8%                                               |
| OPTIONSUniqueJWT.js   | +5.9%                                                        | +2.9%                                               |
| PATCHSingle.js        | +116.5%                                                      | -4.5%                                               |
| POSTBulk.js           | +95.1%                                                       | +48.6%                                              |
| POSTSingle.js         | +140.4%                                                      | +4.1%                                               |
| RPCGETSingle.js       | -7.9%                                                        | -6.1%                                               |
| RPCGETSingleEmbed.js  | -31.2%                                                       | +8.2%                                               |
| RPCSimple.js          | -24.2%                                                       | +2.4%                                               |
| **Mean**              | **+25.4%**                                                   | **+4.2%**                                           |