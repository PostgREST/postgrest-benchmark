| Version   | K6 script                | EC2        | GHC RTS   | Extra config   |   VUs |   http_reqs (req/s) |   failed requests | p50      | p90      | p95       | Duration       |
|:----------|:-------------------------|:-----------|:----------|:---------------|------:|--------------------:|------------------:|:---------|:---------|:----------|:---------------|
| v16.4     | k6/GETAllEmbed.js        | t3a.small  |           |                |    50 |             231.824 |               109 | 163.36ms | 411.49ms | 520.83ms  | 60196.540045ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.small  |           |                |    50 |            1627.55  |                 0 | 30.49ms  | 34.81ms  | 36.14ms   | 60022.273755ms |
| v16.4     | k6/GETSingle.js          | t3a.small  |           |                |    50 |            2015.51  |                 0 | 24.58ms  | 26.90ms  | 27.75ms   | 60018.154497ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.small  |           |                |    50 |            1970.94  |                 0 | 24.99ms  | 27.37ms  | 28.31ms   | 60018.584088ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.small  |           |                |    50 |            1591.49  |               509 | 30.21ms  | 34.53ms  | 37.15ms   | 61300.529682ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.small  |           |                |    50 |           11218.2   |                 0 | 4.00ms   | 6.53ms   | 7.36ms    | 61269.485015ms |
| v16.4     | k6/PATCHSingle.js        | t3a.small  |           |                |    50 |            1898.36  |                 0 | 26.07ms  | 28.95ms  | 30.03ms   | 60020.31137ms  |
| v16.4     | k6/POSTBulk.js           | t3a.small  |           |                |    50 |            1303.05  |                 0 | 37.55ms  | 44.28ms  | 46.14ms   | 60228.878043ms |
| v16.4     | k6/POSTSingle.js         | t3a.small  |           |                |    50 |            1522.21  |                 0 | 32.18ms  | 37.97ms  | 39.84ms   | 60075.296265ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.small  |           |                |    50 |            1305.74  |                 0 | 37.44ms  | 43.94ms  | 45.71ms   | 60024.869682ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.small  |           |                |    50 |            2017.78  |                 0 | 24.60ms  | 26.68ms  | 27.41ms   | 60016.387194ms |
| v16.4     | k6/RPCSimple.js          | t3a.small  |           |                |    50 |            1839.35  |                 0 | 26.64ms  | 30.37ms  | 33.72ms   | 60019.036862ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.small  | -A16m     |                |    50 |             230.131 |               117 | 167.19ms | 407.96ms | 509.45ms  | 60213.441872ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.small  | -A16m     |                |    50 |            1804.44  |                 0 | 27.64ms  | 31.13ms  | 32.27ms   | 60017.536088ms |
| v16.4     | k6/GETSingle.js          | t3a.small  | -A16m     |                |    50 |            2108.56  |                 0 | 23.40ms  | 26.16ms  | 26.98ms   | 60017.301017ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.small  | -A16m     |                |    50 |            2002.61  |                 0 | 24.60ms  | 27.43ms  | 28.31ms   | 60018.281119ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.small  | -A16m     |                |    50 |            1687.61  |               704 | 28.64ms  | 32.64ms  | 34.03ms   | 61271.380484ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.small  | -A16m     |                |    50 |           11803.9   |                 0 | 3.82ms   | 6.04ms   | 6.83ms    | 61245.516553ms |
| v16.4     | k6/PATCHSingle.js        | t3a.small  | -A16m     |                |    50 |            1998.53  |                 0 | 24.76ms  | 27.82ms  | 28.74ms   | 60019.713069ms |
| v16.4     | k6/POSTBulk.js           | t3a.small  | -A16m     |                |    50 |            1520.89  |                 0 | 32.42ms  | 37.57ms  | 41.10ms   | 60224.793335ms |
| v16.4     | k6/POSTSingle.js         | t3a.small  | -A16m     |                |    50 |            1740.15  |                 0 | 28.42ms  | 31.70ms  | 32.67ms   | 60083.950049ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.small  | -A16m     |                |    50 |            1568.79  |                 0 | 31.81ms  | 34.86ms  | 35.79ms   | 60020.229973ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.small  | -A16m     |                |    50 |            2152.17  |                 0 | 22.98ms  | 25.73ms  | 26.54ms   | 60016.636419ms |
| v16.4     | k6/RPCSimple.js          | t3a.small  | -A16m     |                |    50 |            2001.55  |                 0 | 24.77ms  | 27.57ms  | 28.40ms   | 60019.600654ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.small  | -A32m     |                |    50 |             230.238 |               127 | 168.28ms | 405.57ms | 510.83ms  | 60189.885154ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.small  | -A32m     |                |    50 |            1749.8   |                 0 | 28.06ms  | 32.02ms  | 33.17ms   | 60021.122341ms |
| v16.4     | k6/GETSingle.js          | t3a.small  | -A32m     |                |    50 |            2125.74  |                 0 | 23.12ms  | 26.16ms  | 27.38ms   | 60015.869709ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.small  | -A32m     |                |    50 |            2033.77  |                 0 | 24.13ms  | 27.26ms  | 28.47ms   | 60017.979057ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.small  | -A32m     |                |    50 |            1722.57  |              1026 | 28.02ms  | 32.34ms  | 33.91ms   | 61271.879479ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.small  | -A32m     |                |    50 |           12393.2   |                 0 | 3.68ms   | 5.64ms   | 6.36ms    | 61248.231844ms |
| v16.4     | k6/PATCHSingle.js        | t3a.small  | -A32m     |                |    50 |            2147.39  |                 0 | 22.89ms  | 26.47ms  | 27.82ms   | 60018.495428ms |
| v16.4     | k6/POSTBulk.js           | t3a.small  | -A32m     |                |    50 |            1578.87  |                 0 | 31.11ms  | 35.99ms  | 38.53ms   | 60243.07819ms  |
| v16.4     | k6/POSTSingle.js         | t3a.small  | -A32m     |                |    50 |            1767.21  |                 0 | 27.89ms  | 31.87ms  | 33.28ms   | 60088.940512ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.small  | -A32m     |                |    50 |            1498.5   |                 0 | 32.89ms  | 37.54ms  | 39.07ms   | 60020.624524ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.small  | -A32m     |                |    50 |            2050.01  |                 0 | 23.82ms  | 27.59ms  | 29.04ms   | 60017.274232ms |
| v16.4     | k6/RPCSimple.js          | t3a.small  | -A32m     |                |    50 |            1963.73  |                 0 | 25.06ms  | 28.36ms  | 29.42ms   | 60016.528802ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.small  | -A64m     |                |    50 |             230.459 |               118 | 170.46ms | 405.08ms | 506.15ms  | 60214.694204ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.small  | -A64m     |                |    50 |            1792.79  |                 0 | 27.63ms  | 31.95ms  | 33.80ms   | 60019.70224ms  |
| v16.4     | k6/GETSingle.js          | t3a.small  | -A64m     |                |    50 |            2146.06  |                 0 | 22.82ms  | 25.36ms  | 28.43ms   | 60024.306313ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.small  | -A64m     |                |    50 |            2118.34  |                 0 | 23.03ms  | 25.70ms  | 28.68ms   | 60016.686298ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.small  | -A64m     |                |    50 |            1736.79  |              1209 | 27.64ms  | 31.76ms  | 35.11ms   | 61274.544274ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.small  | -A64m     |                |    50 |           12124.7   |                 0 | 3.75ms   | 5.77ms   | 6.52ms    | 61260.513253ms |
| v16.4     | k6/PATCHSingle.js        | t3a.small  | -A64m     |                |    50 |            2035.97  |                 0 | 24.16ms  | 27.42ms  | 30.59ms   | 60017.440435ms |
| v16.4     | k6/POSTBulk.js           | t3a.small  | -A64m     |                |    50 |            1579.07  |                 0 | 30.91ms  | 37.16ms  | 40.48ms   | 60245.071196ms |
| v16.4     | k6/POSTSingle.js         | t3a.small  | -A64m     |                |    50 |            1792.79  |                 0 | 27.33ms  | 31.05ms  | 32.79ms   | 60085.06407ms  |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.small  | -A64m     |                |    50 |            1620.96  |                 0 | 30.35ms  | 34.50ms  | 35.83ms   | 60021.138463ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.small  | -A64m     |                |    50 |            2162.04  |                 0 | 22.62ms  | 25.31ms  | 28.76ms   | 60017.412798ms |
| v16.4     | k6/RPCSimple.js          | t3a.small  | -A64m     |                |    50 |            2017.76  |                 0 | 24.29ms  | 27.65ms  | 29.55ms   | 60026.447664ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.medium |           |                |    50 |             249.09  |                36 | 188.35ms | 277.54ms | 303.39ms  | 60146.950852ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.medium |           |                |    50 |            1529.7   |                 0 | 32.65ms  | 37.68ms  | 39.47ms   | 60021.454147ms |
| v16.4     | k6/GETSingle.js          | t3a.medium |           |                |    50 |            2023.76  |                 0 | 24.50ms  | 26.69ms  | 27.49ms   | 60019.097928ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.medium |           |                |    50 |            1981.57  |                 0 | 24.92ms  | 27.17ms  | 28.00ms   | 60018.675781ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.medium |           |                |    50 |            1594.09  |               957 | 30.28ms  | 34.58ms  | 37.37ms   | 61278.206708ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.medium |           |                |    50 |           11218.1   |                 0 | 4.00ms   | 6.54ms   | 7.38ms    | 61250.129653ms |
| v16.4     | k6/PATCHSingle.js        | t3a.medium |           |                |    50 |            1941.01  |                 0 | 25.91ms  | 29.53ms  | 31.51ms   | 60019.917318ms |
| v16.4     | k6/POSTBulk.js           | t3a.medium |           |                |    50 |            1342.83  |                 0 | 35.87ms  | 42.53ms  | 44.08ms   | 60207.998151ms |
| v16.4     | k6/POSTSingle.js         | t3a.medium |           |                |    50 |            1619.67  |                 0 | 30.10ms  | 36.03ms  | 37.64ms   | 60084.02255ms  |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.medium |           |                |    50 |            1384.47  |                 0 | 35.21ms  | 41.84ms  | 43.46ms   | 60024.284042ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.medium |           |                |    50 |            1988.33  |                 0 | 24.85ms  | 27.28ms  | 28.23ms   | 60017.259242ms |
| v16.4     | k6/RPCSimple.js          | t3a.medium |           |                |    50 |            1780.53  |                 0 | 27.64ms  | 31.32ms  | 34.30ms   | 60022.449669ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.medium | -A16m     |                |    50 |             276.191 |                73 | 165.59ms | 264.98ms | 300.02ms  | 60153.962262ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.medium | -A16m     |                |    50 |            1821.81  |                 0 | 27.36ms  | 30.77ms  | 31.98ms   | 60019.537252ms |
| v16.4     | k6/GETSingle.js          | t3a.medium | -A16m     |                |    50 |            2158.65  |                 0 | 22.98ms  | 25.92ms  | 27.06ms   | 60018.114126ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.medium | -A16m     |                |    50 |            2069.78  |                 0 | 23.80ms  | 26.44ms  | 27.24ms   | 60017.485038ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.medium | -A16m     |                |    50 |            1784.25  |              1122 | 27.11ms  | 30.68ms  | 31.83ms   | 61267.908282ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.medium | -A16m     |                |    50 |           12186.1   |                 0 | 3.73ms   | 5.75ms   | 6.47ms    | 61252.310265ms |
| v16.4     | k6/PATCHSingle.js        | t3a.medium | -A16m     |                |    50 |            2067.16  |                 0 | 24.07ms  | 27.40ms  | 28.40ms   | 60018.44502ms  |
| v16.4     | k6/POSTBulk.js           | t3a.medium | -A16m     |                |    50 |            1532.44  |                 0 | 31.99ms  | 35.43ms  | 36.66ms   | 60225.040236ms |
| v16.4     | k6/POSTSingle.js         | t3a.medium | -A16m     |                |    50 |            1761.69  |                 0 | 28.11ms  | 31.17ms  | 32.06ms   | 60075.782571ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.medium | -A16m     |                |    50 |            1572.27  |                 0 | 31.75ms  | 34.75ms  | 35.68ms   | 60018.469269ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.medium | -A16m     |                |    50 |            2127.13  |                 0 | 23.21ms  | 25.90ms  | 26.69ms   | 60018.041603ms |
| v16.4     | k6/RPCSimple.js          | t3a.medium | -A16m     |                |    50 |            1988.91  |                 0 | 24.92ms  | 27.62ms  | 28.36ms   | 60016.724718ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.medium | -A32m     |                |    50 |             263.018 |                65 | 171.63ms | 278.18ms | 300.59ms  | 60311.530998ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.medium | -A32m     |                |    50 |            1794.95  |                 0 | 27.46ms  | 31.37ms  | 32.59ms   | 60023.900901ms |
| v16.4     | k6/GETSingle.js          | t3a.medium | -A32m     |                |    50 |            2164.99  |                 0 | 22.70ms  | 25.75ms  | 27.00ms   | 60020.518853ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.medium | -A32m     |                |    50 |            2061.98  |                 0 | 23.77ms  | 26.87ms  | 28.05ms   | 60017.066946ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.medium | -A32m     |                |    50 |            1776.52  |              1039 | 27.00ms  | 31.48ms  | 33.10ms   | 61269.20798ms  |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.medium | -A32m     |                |    50 |           12283.9   |                 0 | 3.71ms   | 5.70ms   | 6.45ms    | 61256.116274ms |
| v16.4     | k6/PATCHSingle.js        | t3a.medium | -A32m     |                |    50 |            2103.87  |                 0 | 23.68ms  | 27.19ms  | 28.61ms   | 60021.888734ms |
| v16.4     | k6/POSTBulk.js           | t3a.medium | -A32m     |                |    50 |            1638.23  |                 0 | 29.67ms  | 33.55ms  | 34.92ms   | 60232.158492ms |
| v16.4     | k6/POSTSingle.js         | t3a.medium | -A32m     |                |    50 |            1820.59  |                 0 | 27.06ms  | 30.46ms  | 31.47ms   | 60086.424165ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.medium | -A32m     |                |    50 |            1598.55  |                 0 | 30.93ms  | 34.72ms  | 35.76ms   | 60018.925196ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.medium | -A32m     |                |    50 |            2188     |                 0 | 22.47ms  | 25.49ms  | 26.74ms   | 60016.848608ms |
| v16.4     | k6/RPCSimple.js          | t3a.medium | -A32m     |                |    50 |            2050.7   |                 0 | 24.01ms  | 27.03ms  | 27.97ms   | 60017.946748ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.medium | -A64m     |                |    50 |             281.139 |                90 | 160.33ms | 262.38ms | 284.95ms  | 60151.81812ms  |
| v16.4     | k6/GETSingleEmbed.js     | t3a.medium | -A64m     |                |    50 |            1889.98  |                 0 | 26.00ms  | 30.30ms  | 32.30ms   | 60019.11602ms  |
| v16.4     | k6/GETSingle.js          | t3a.medium | -A64m     |                |    50 |            2155.19  |                 0 | 22.75ms  | 25.22ms  | 28.39ms   | 60016.408305ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.medium | -A64m     |                |    50 |            2053.02  |                 0 | 23.81ms  | 26.38ms  | 29.20ms   | 60017.491839ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.medium | -A64m     |                |    50 |            1731.86  |               539 | 27.57ms  | 32.00ms  | 35.02ms   | 61289.059732ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.medium | -A64m     |                |    50 |           12060.3   |                 0 | 3.77ms   | 5.81ms   | 6.60ms    | 61246.876445ms |
| v16.4     | k6/PATCHSingle.js        | t3a.medium | -A64m     |                |    50 |            2070.36  |                 0 | 24.01ms  | 27.61ms  | 30.59ms   | 60018.071142ms |
| v16.4     | k6/POSTBulk.js           | t3a.medium | -A64m     |                |    50 |            1630.75  |                 0 | 29.59ms  | 34.39ms  | 36.40ms   | 60781.415254ms |
| v16.4     | k6/POSTSingle.js         | t3a.medium | -A64m     |                |    50 |            1853.61  |                 0 | 26.41ms  | 30.06ms  | 31.69ms   | 60086.094415ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.medium | -A64m     |                |    50 |            1678.38  |                 0 | 29.19ms  | 33.68ms  | 35.11ms   | 60019.911445ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.medium | -A64m     |                |    50 |            2190.02  |                 0 | 22.35ms  | 24.72ms  | 28.18ms   | 60015.530446ms |
| v16.4     | k6/RPCSimple.js          | t3a.medium | -A64m     |                |    50 |            2094.16  |                 0 | 23.39ms  | 26.57ms  | 28.46ms   | 60017.857397ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.large  |           |                |    50 |             242.958 |                17 | 210.52ms | 263.43ms | 278.61ms  | 60183.248443ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.large  |           |                |    50 |            1540.83  |                 0 | 32.18ms  | 36.61ms  | 38.01ms   | 60022.180965ms |
| v16.4     | k6/GETSingle.js          | t3a.large  |           |                |    50 |            1976.15  |                 0 | 25.07ms  | 27.39ms  | 28.27ms   | 60017.141958ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.large  |           |                |    50 |            1902.54  |                 0 | 25.92ms  | 28.55ms  | 29.53ms   | 60016.669922ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.large  |           |                |    50 |            1481.09  |               574 | 32.55ms  | 37.72ms  | 40.06ms   | 61254.107733ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.large  |           |                |    50 |           10457.8   |                 0 | 4.26ms   | 7.08ms   | 8.02ms    | 61250.760456ms |
| v16.4     | k6/PATCHSingle.js        | t3a.large  |           |                |    50 |            1823.85  |                 0 | 27.20ms  | 30.32ms  | 31.60ms   | 60021.801338ms |
| v16.4     | k6/POSTBulk.js           | t3a.large  |           |                |    50 |            1222.53  |                 0 | 39.66ms  | 46.92ms  | 49.04ms   | 60200.333244ms |
| v16.4     | k6/POSTSingle.js         | t3a.large  |           |                |    50 |            1435.86  |                 0 | 33.92ms  | 40.40ms  | 42.64ms   | 60085.9387ms   |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.large  |           |                |    50 |            1262.45  |                 0 | 38.56ms  | 46.00ms  | 48.17ms   | 60023.808364ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.large  |           |                |    50 |            1903.6   |                 0 | 25.95ms  | 28.69ms  | 29.75ms   | 60016.713251ms |
| v16.4     | k6/RPCSimple.js          | t3a.large  |           |                |    50 |            1738.25  |                 0 | 28.26ms  | 32.24ms  | 35.43ms   | 60019.536964ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.large  | -A16m     |                |    50 |             263.033 |                35 | 187.23ms | 244.86ms | 261.25ms  | 60114.045578ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.large  | -A16m     |                |    50 |            1675.38  |                 0 | 30.00ms  | 35.01ms  | 36.86ms   | 60024.049009ms |
| v16.4     | k6/GETSingle.js          | t3a.large  | -A16m     |                |    50 |            2063.32  |                 0 | 23.86ms  | 26.95ms  | 27.96ms   | 60021.34107ms  |
| v16.4     | k6/GETSingleJWT.js       | t3a.large  | -A16m     |                |    50 |            1953.93  |                 0 | 25.17ms  | 28.29ms  | 29.30ms   | 60018.488229ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.large  | -A16m     |                |    50 |            1645.27  |               902 | 29.36ms  | 33.70ms  | 35.38ms   | 61292.753832ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.large  | -A16m     |                |    50 |           11859.3   |                 0 | 3.81ms   | 5.94ms   | 6.65ms    | 61242.51999ms  |
| v16.4     | k6/PATCHSingle.js        | t3a.large  | -A16m     |                |    50 |            1993.72  |                 0 | 24.77ms  | 27.90ms  | 28.88ms   | 60018.319563ms |
| v16.4     | k6/POSTBulk.js           | t3a.large  | -A16m     |                |    50 |            1486.96  |                 0 | 32.85ms  | 36.57ms  | 37.98ms   | 60221.603728ms |
| v16.4     | k6/POSTSingle.js         | t3a.large  | -A16m     |                |    50 |            1750.72  |                 0 | 28.28ms  | 31.40ms  | 32.34ms   | 60087.226641ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.large  | -A16m     |                |    50 |            1560.8   |                 0 | 31.96ms  | 35.21ms  | 36.21ms   | 60024.517488ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.large  | -A16m     |                |    50 |            2036.2   |                 0 | 24.17ms  | 27.38ms  | 28.42ms   | 60018.554092ms |
| v16.4     | k6/RPCSimple.js          | t3a.large  | -A16m     |                |    50 |            1898.76  |                 0 | 26.04ms  | 29.17ms  | 30.19ms   | 60018.524822ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.large  | -A32m     |                |    50 |             288.796 |                33 | 166.09ms | 223.41ms | 243.23ms  | 60128.85932ms  |
| v16.4     | k6/GETSingleEmbed.js     | t3a.large  | -A32m     |                |    50 |            1686.02  |                 0 | 29.15ms  | 33.61ms  | 35.02ms   | 60023.438444ms |
| v16.4     | k6/GETSingle.js          | t3a.large  | -A32m     |                |    50 |            2081.95  |                 0 | 23.54ms  | 27.05ms  | 28.44ms   | 60016.379558ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.large  | -A32m     |                |    50 |            1971.36  |                 0 | 24.81ms  | 28.24ms  | 29.46ms   | 60018.361779ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.large  | -A32m     |                |    50 |            1705.74  |               548 | 28.08ms  | 32.56ms  | 34.14ms   | 61280.121563ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.large  | -A32m     |                |    50 |           11816.6   |                 0 | 3.83ms   | 5.96ms   | 6.74ms    | 61273.997086ms |
| v16.4     | k6/PATCHSingle.js        | t3a.large  | -A32m     |                |    50 |            1989.77  |                 0 | 25.33ms  | 29.97ms  | 31.69ms   | 60019.906666ms |
| v16.4     | k6/POSTBulk.js           | t3a.large  | -A32m     |                |    50 |            1488.82  |                 0 | 32.68ms  | 37.11ms  | 38.71ms   | 60232.856972ms |
| v16.4     | k6/POSTSingle.js         | t3a.large  | -A32m     |                |    50 |            1665.6   |                 0 | 29.26ms  | 33.87ms  | 35.68ms   | 60085.76418ms  |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.large  | -A32m     |                |    50 |            1526.57  |                 0 | 32.40ms  | 36.52ms  | 37.71ms   | 60019.489615ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.large  | -A32m     |                |    50 |            1976.98  |                 0 | 24.57ms  | 29.26ms  | 31.29ms   | 60016.682123ms |
| v16.4     | k6/RPCSimple.js          | t3a.large  | -A32m     |                |    50 |            1902.66  |                 0 | 25.77ms  | 29.45ms  | 30.68ms   | 60018.025582ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.large  | -A64m     |                |    50 |             291.759 |                32 | 162.91ms | 233.53ms | 251.33ms  | 60148.97456ms  |
| v16.4     | k6/GETSingleEmbed.js     | t3a.large  | -A64m     |                |    50 |            1743.96  |                 0 | 28.11ms  | 32.56ms  | 34.47ms   | 60019.855397ms |
| v16.4     | k6/GETSingle.js          | t3a.large  | -A64m     |                |    50 |            2109.67  |                 0 | 23.26ms  | 26.22ms  | 29.16ms   | 60016.869022ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.large  | -A64m     |                |    50 |            1958.85  |                 0 | 24.92ms  | 28.24ms  | 30.77ms   | 60016.461777ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.large  | -A64m     |                |    50 |            1672.38  |               934 | 28.54ms  | 33.45ms  | 36.78ms   | 61277.864848ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.large  | -A64m     |                |    50 |           11810.6   |                 0 | 3.84ms   | 5.93ms   | 6.68ms    | 61256.044279ms |
| v16.4     | k6/PATCHSingle.js        | t3a.large  | -A64m     |                |    50 |            1913.92  |                 0 | 25.56ms  | 29.51ms  | 32.46ms   | 60021.173544ms |
| v16.4     | k6/POSTBulk.js           | t3a.large  | -A64m     |                |    50 |            1529     |                 0 | 31.59ms  | 36.14ms  | 37.87ms   | 60234.104156ms |
| v16.4     | k6/POSTSingle.js         | t3a.large  | -A64m     |                |    50 |            1743.59  |                 0 | 28.11ms  | 32.25ms  | 33.96ms   | 60082.901117ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.large  | -A64m     |                |    50 |            1572.91  |                 0 | 31.28ms  | 35.70ms  | 37.15ms   | 60021.143677ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.large  | -A64m     |                |    50 |            2148.09  |                 0 | 22.80ms  | 25.52ms  | 28.65ms   | 60017.60217ms  |
| v16.4     | k6/RPCSimple.js          | t3a.large  | -A64m     |                |    50 |            1975.64  |                 0 | 24.85ms  | 28.34ms  | 30.02ms   | 60022.019701ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.nano   |           |                |    50 |             124.952 |                 0 | 233.94ms | 948.91ms | 1264.21ms | 60391.346101ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.nano   |           |                |    50 |            1466.32  |                 0 | 33.74ms  | 38.03ms  | 39.46ms   | 60024.596629ms |
| v16.4     | k6/GETSingle.js          | t3a.nano   |           |                |    50 |            1903.53  |                 0 | 25.96ms  | 28.68ms  | 29.82ms   | 60017.970646ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.nano   |           |                |    50 |            1720.09  |                 0 | 28.30ms  | 32.39ms  | 34.46ms   | 60024.132968ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.nano   |           |                |    50 |            1448.16  |               557 | 33.18ms  | 38.47ms  | 41.25ms   | 61267.898161ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.nano   |           |                |    50 |            9976.09  |                 0 | 4.46ms   | 7.42ms   | 8.37ms    | 61274.51246ms  |
| v16.4     | k6/PATCHSingle.js        | t3a.nano   |           |                |    50 |            1642.06  |                 0 | 29.20ms  | 38.31ms  | 48.54ms   | 60027.189004ms |
| v16.4     | k6/POSTBulk.js           | t3a.nano   |           |                |    50 |            1180.3   |                 0 | 40.53ms  | 51.62ms  | 64.42ms   | 60199.340333ms |
| v16.4     | k6/POSTSingle.js         | t3a.nano   |           |                |    50 |            1397.79  |                 0 | 34.97ms  | 42.00ms  | 44.66ms   | 60091.864421ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.nano   |           |                |    50 |            1209.73  |                 0 | 40.38ms  | 47.79ms  | 50.03ms   | 60024.119135ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.nano   |           |                |    50 |            1894.03  |                 0 | 26.16ms  | 28.76ms  | 29.69ms   | 60020.149914ms |
| v16.4     | k6/RPCSimple.js          | t3a.nano   |           |                |    50 |            1698.98  |                 0 | 28.87ms  | 33.43ms  | 36.25ms   | 60021.361665ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.nano   | -A16m     |                |    50 |             129.573 |                 0 | 218.67ms | 924.59ms | 1225.41ms | 60359.878936ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.nano   | -A16m     |                |    50 |            1620.7   |                 0 | 30.56ms  | 34.31ms  | 35.45ms   | 60026.02862ms  |
| v16.4     | k6/GETSingle.js          | t3a.nano   | -A16m     |                |    50 |            2016.26  |                 0 | 24.45ms  | 27.47ms  | 28.44ms   | 60018.069917ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.nano   | -A16m     |                |    50 |            1776.5   |                 0 | 27.18ms  | 31.87ms  | 34.44ms   | 60021.932098ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.nano   | -A16m     |                |    50 |            1558.29  |               800 | 30.74ms  | 35.81ms  | 38.23ms   | 61276.942441ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.nano   | -A16m     |                |    50 |           10999.5   |                 0 | 4.05ms   | 6.57ms   | 7.37ms    | 61274.904974ms |
| v16.4     | k6/PATCHSingle.js        | t3a.nano   | -A16m     |                |    50 |            1831.65  |                 0 | 26.00ms  | 35.58ms  | 49.62ms   | 60021.886171ms |
| v16.4     | k6/POSTBulk.js           | t3a.nano   | -A16m     |                |    50 |            1400.15  |                 0 | 34.49ms  | 41.21ms  | 48.57ms   | 60214.805852ms |
| v16.4     | k6/POSTSingle.js         | t3a.nano   | -A16m     |                |    50 |            1607.24  |                 0 | 30.42ms  | 35.95ms  | 39.27ms   | 60074.554961ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.nano   | -A16m     |                |    50 |            1406.31  |                 0 | 35.33ms  | 39.48ms  | 40.99ms   | 60021.669964ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.nano   | -A16m     |                |    50 |            2021.24  |                 0 | 24.34ms  | 27.55ms  | 28.54ms   | 60017.096999ms |
| v16.4     | k6/RPCSimple.js          | t3a.nano   | -A16m     |                |    50 |            1920.53  |                 0 | 25.81ms  | 28.82ms  | 29.67ms   | 60016.733303ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.nano   | -A32m     |                |    50 |             130.008 |                 0 | 220.13ms | 917.90ms | 1239.40ms | 60381.106488ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.nano   | -A32m     |                |    50 |            1657.59  |                 0 | 29.55ms  | 34.11ms  | 35.55ms   | 60020.733253ms |
| v16.4     | k6/GETSingle.js          | t3a.nano   | -A32m     |                |    50 |            2026.68  |                 0 | 24.16ms  | 27.83ms  | 29.28ms   | 60016.388639ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.nano   | -A32m     |                |    50 |            1917.16  |                 0 | 25.44ms  | 29.32ms  | 30.83ms   | 60019.4972ms   |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.nano   | -A32m     |                |    50 |            1622.05  |               748 | 29.53ms  | 34.52ms  | 36.28ms   | 61266.429246ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.nano   | -A32m     |                |    50 |           11201.8   |                 0 | 3.99ms   | 6.38ms   | 7.18ms    | 61276.17728ms  |
| v16.4     | k6/PATCHSingle.js        | t3a.nano   | -A32m     |                |    50 |            1764.31  |                 0 | 26.95ms  | 35.19ms  | 42.58ms   | 60021.777273ms |
| v16.4     | k6/POSTBulk.js           | t3a.nano   | -A32m     |                |    50 |            1439.12  |                 0 | 33.18ms  | 41.10ms  | 51.59ms   | 60221.546215ms |
| v16.4     | k6/POSTSingle.js         | t3a.nano   | -A32m     |                |    50 |            1619.42  |                 0 | 30.15ms  | 35.48ms  | 37.79ms   | 60085.627993ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.nano   | -A32m     |                |    50 |            1454.27  |                 0 | 33.92ms  | 38.57ms  | 40.08ms   | 60020.403438ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.nano   | -A32m     |                |    50 |            2004.28  |                 0 | 24.36ms  | 28.28ms  | 29.84ms   | 60018.503707ms |
| v16.4     | k6/RPCSimple.js          | t3a.nano   | -A32m     |                |    50 |            1887.32  |                 0 | 26.05ms  | 29.59ms  | 30.70ms   | 60017.451047ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.nano   | -A64m     |                |    50 |             129.654 |                 0 | 214.27ms | 917.77ms | 1235.05ms | 60391.356107ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.nano   | -A64m     |                |    50 |            1673.73  |                 0 | 29.13ms  | 34.16ms  | 36.18ms   | 60020.452356ms |
| v16.4     | k6/GETSingle.js          | t3a.nano   | -A64m     |                |    50 |            2024.34  |                 0 | 24.09ms  | 27.24ms  | 31.08ms   | 60017.615335ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.nano   | -A64m     |                |    50 |            1906.06  |                 0 | 25.49ms  | 29.00ms  | 32.53ms   | 60018.504307ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.nano   | -A64m     |                |    50 |            1605.73  |               920 | 29.78ms  | 35.04ms  | 38.26ms   | 61284.442245ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.nano   | -A64m     |                |    50 |           11452.1   |                 0 | 3.92ms   | 6.15ms   | 6.91ms    | 61275.49459ms  |
| v16.4     | k6/PATCHSingle.js        | t3a.nano   | -A64m     |                |    50 |            1826.63  |                 0 | 26.16ms  | 35.98ms  | 46.88ms   | 60021.341345ms |
| v16.4     | k6/POSTBulk.js           | t3a.nano   | -A64m     |                |    50 |            1457.82  |                 0 | 32.83ms  | 40.29ms  | 47.04ms   | 60237.257139ms |
| v16.4     | k6/POSTSingle.js         | t3a.nano   | -A64m     |                |    50 |            1670.97  |                 0 | 29.16ms  | 34.51ms  | 37.01ms   | 60086.105455ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.nano   | -A64m     |                |    50 |            1522.44  |                 0 | 32.28ms  | 36.87ms  | 38.40ms   | 60020.073606ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.nano   | -A64m     |                |    50 |            2009.83  |                 0 | 24.19ms  | 27.62ms  | 31.17ms   | 60020.983119ms |
| v16.4     | k6/RPCSimple.js          | t3a.nano   | -A64m     |                |    50 |            1791.47  |                 0 | 26.87ms  | 32.66ms  | 35.23ms   | 60018.305851ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.micro  |           |                |    50 |             188.641 |                 0 | 175.96ms | 566.41ms | 729.96ms  | 60262.556887ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.micro  |           |                |    50 |            1564.17  |                 0 | 31.77ms  | 36.13ms  | 37.48ms   | 60024.863786ms |
| v16.4     | k6/GETSingle.js          | t3a.micro  |           |                |    50 |            2009.74  |                 0 | 24.67ms  | 26.95ms  | 27.81ms   | 60019.842047ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.micro  |           |                |    50 |            1929.5   |                 0 | 25.58ms  | 28.10ms  | 29.04ms   | 60019.061289ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.micro  |           |                |    50 |            1560.67  |               851 | 30.88ms  | 35.56ms  | 38.32ms   | 61275.095534ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.micro  |           |                |    50 |           10682.5   |                 0 | 4.19ms   | 6.88ms   | 7.76ms    | 61247.334985ms |
| v16.4     | k6/PATCHSingle.js        | t3a.micro  |           |                |    50 |            1953.33  |                 0 | 25.47ms  | 28.40ms  | 29.60ms   | 60020.128823ms |
| v16.4     | k6/POSTBulk.js           | t3a.micro  |           |                |    50 |            1350.58  |                 0 | 36.39ms  | 44.02ms  | 46.52ms   | 60205.917787ms |
| v16.4     | k6/POSTSingle.js         | t3a.micro  |           |                |    50 |            1508.92  |                 0 | 32.52ms  | 38.82ms  | 40.84ms   | 60075.277238ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.micro  |           |                |    50 |            1244.88  |                 0 | 39.15ms  | 46.26ms  | 48.44ms   | 60031.67831ms  |
| v16.4     | k6/RPCGETSingle.js       | t3a.micro  |           |                |    50 |            1940.46  |                 0 | 25.53ms  | 27.94ms  | 28.84ms   | 60021.834871ms |
| v16.4     | k6/RPCSimple.js          | t3a.micro  |           |                |    50 |            1776.38  |                 0 | 27.61ms  | 31.54ms  | 34.67ms   | 60019.76463ms  |
| v16.4     | k6/GETAllEmbed.js        | t3a.micro  | -A16m     |                |    50 |             190.98  |                 0 | 175.35ms | 557.21ms | 716.55ms  | 60262.757281ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.micro  | -A16m     |                |    50 |            1709.18  |                 0 | 29.04ms  | 32.45ms  | 33.48ms   | 60020.107177ms |
| v16.4     | k6/GETSingle.js          | t3a.micro  | -A16m     |                |    50 |            2094.25  |                 0 | 23.58ms  | 26.40ms  | 27.24ms   | 60016.68725ms  |
| v16.4     | k6/GETSingleJWT.js       | t3a.micro  | -A16m     |                |    50 |            2055.13  |                 0 | 23.97ms  | 26.70ms  | 27.53ms   | 60015.098583ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.micro  | -A16m     |                |    50 |            1725.06  |               821 | 28.01ms  | 31.81ms  | 33.13ms   | 61271.438707ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.micro  | -A16m     |                |    50 |           11736.6   |                 0 | 3.83ms   | 6.02ms   | 6.76ms    | 61268.355903ms |
| v16.4     | k6/PATCHSingle.js        | t3a.micro  | -A16m     |                |    50 |            2082.44  |                 0 | 23.70ms  | 26.90ms  | 27.84ms   | 60018.003558ms |
| v16.4     | k6/POSTBulk.js           | t3a.micro  | -A16m     |                |    50 |            1558.98  |                 0 | 31.71ms  | 36.81ms  | 40.20ms   | 60225.226062ms |
| v16.4     | k6/POSTSingle.js         | t3a.micro  | -A16m     |                |    50 |            1787.94  |                 0 | 27.73ms  | 30.99ms  | 32.02ms   | 60086.399436ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.micro  | -A16m     |                |    50 |            1548.74  |                 0 | 32.21ms  | 35.41ms  | 36.42ms   | 60021.598062ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.micro  | -A16m     |                |    50 |            2069.85  |                 0 | 23.79ms  | 26.85ms  | 27.79ms   | 60019.85233ms  |
| v16.4     | k6/RPCSimple.js          | t3a.micro  | -A16m     |                |    50 |            1924.74  |                 0 | 25.69ms  | 28.71ms  | 29.61ms   | 60017.413984ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.micro  | -A32m     |                |    50 |             189.757 |                 0 | 177.41ms | 565.59ms | 720.83ms  | 60255.952127ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.micro  | -A32m     |                |    50 |            1791.97  |                 0 | 27.84ms  | 31.99ms  | 33.30ms   | 60019.560782ms |
| v16.4     | k6/GETSingle.js          | t3a.micro  | -A32m     |                |    50 |            2096.93  |                 0 | 23.41ms  | 26.63ms  | 27.90ms   | 60018.303583ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.micro  | -A32m     |                |    50 |            2008.04  |                 0 | 24.39ms  | 27.62ms  | 28.84ms   | 60017.264045ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.micro  | -A32m     |                |    50 |            1688.37  |               855 | 28.42ms  | 32.94ms  | 34.54ms   | 61263.263521ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.micro  | -A32m     |                |    50 |           11662.8   |                 0 | 3.85ms   | 6.10ms   | 6.90ms    | 61245.526657ms |
| v16.4     | k6/PATCHSingle.js        | t3a.micro  | -A32m     |                |    50 |            2043.9   |                 0 | 24.06ms  | 27.59ms  | 28.87ms   | 60018.194176ms |
| v16.4     | k6/POSTBulk.js           | t3a.micro  | -A32m     |                |    50 |            1625.39  |                 0 | 30.05ms  | 35.22ms  | 38.21ms   | 60236.625349ms |
| v16.4     | k6/POSTSingle.js         | t3a.micro  | -A32m     |                |    50 |            1803.72  |                 0 | 27.17ms  | 30.91ms  | 32.10ms   | 60073.020489ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.micro  | -A32m     |                |    50 |            1532.87  |                 0 | 32.21ms  | 36.34ms  | 37.63ms   | 60021.971629ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.micro  | -A32m     |                |    50 |            2079.97  |                 0 | 23.59ms  | 26.85ms  | 28.10ms   | 60016.228073ms |
| v16.4     | k6/RPCSimple.js          | t3a.micro  | -A32m     |                |    50 |            1948.12  |                 0 | 25.21ms  | 28.64ms  | 29.74ms   | 60021.842184ms |
| v16.4     | k6/GETAllEmbed.js        | t3a.micro  | -A64m     |                |    50 |             189.15  |                 0 | 180.43ms | 562.55ms | 711.37ms  | 60243.076199ms |
| v16.4     | k6/GETSingleEmbed.js     | t3a.micro  | -A64m     |                |    50 |            1738.96  |                 0 | 28.14ms  | 32.52ms  | 34.26ms   | 60019.307605ms |
| v16.4     | k6/GETSingle.js          | t3a.micro  | -A64m     |                |    50 |            2120.13  |                 0 | 23.12ms  | 25.75ms  | 28.54ms   | 60017.624049ms |
| v16.4     | k6/GETSingleJWT.js       | t3a.micro  | -A64m     |                |    50 |            2101.45  |                 0 | 23.21ms  | 25.89ms  | 28.94ms   | 60018.422121ms |
| v16.4     | k6/GETSingleUniqueJWT.js | t3a.micro  | -A64m     |                |    50 |            1754.08  |               967 | 27.25ms  | 31.66ms  | 34.71ms   | 61276.074435ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | t3a.micro  | -A64m     |                |    50 |           11838.8   |                 0 | 3.81ms   | 5.94ms   | 6.71ms    | 61281.245162ms |
| v16.4     | k6/PATCHSingle.js        | t3a.micro  | -A64m     |                |    50 |            2050.2   |                 0 | 24.01ms  | 27.30ms  | 30.17ms   | 60018.170211ms |
| v16.4     | k6/POSTBulk.js           | t3a.micro  | -A64m     |                |    50 |            1617.72  |                 0 | 30.19ms  | 35.79ms  | 38.68ms   | 60232.846069ms |
| v16.4     | k6/POSTSingle.js         | t3a.micro  | -A64m     |                |    50 |            1789.06  |                 0 | 27.36ms  | 31.69ms  | 33.44ms   | 60073.502077ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | t3a.micro  | -A64m     |                |    50 |            1591.19  |                 0 | 30.89ms  | 35.12ms  | 36.52ms   | 60021.620588ms |
| v16.4     | k6/RPCGETSingle.js       | t3a.micro  | -A64m     |                |    50 |            2136.8   |                 0 | 22.91ms  | 25.56ms  | 28.86ms   | 60016.768069ms |
| v16.4     | k6/RPCSimple.js          | t3a.micro  | -A64m     |                |    50 |            2046.48  |                 0 | 23.90ms  | 27.24ms  | 29.21ms   | 60016.253225ms |