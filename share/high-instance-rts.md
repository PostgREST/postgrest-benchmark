| Version   | K6 script                | EC2          | GHC RTS   | Extra config   |   VUs |   http_reqs (req/s) |   failed requests | p50      | p90      | p95      | Duration       |
|:----------|:-------------------------|:-------------|:----------|:---------------|------:|--------------------:|------------------:|:---------|:---------|:---------|:---------------|
| v16.4     | k6/GETAllEmbed.js        | m5a.xlarge   |           |                |   100 |             296.493 |                 0 | 297.06ms | 519.11ms | 619.63ms | 60247.674003ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.xlarge   |           |                |   100 |            2681.44  |                 0 | 36.58ms  | 41.61ms  | 42.50ms  | 60025.264831ms |
| v16.4     | k6/GETSingle.js          | m5a.xlarge   |           |                |   100 |            3796.8   |                 0 | 26.16ms  | 27.50ms  | 28.12ms  | 60017.920074ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.xlarge   |           |                |   100 |            3632.88  |                 0 | 27.04ms  | 29.14ms  | 30.11ms  | 60017.897702ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.xlarge   |           |                |   100 |            2896.5   |              1465 | 33.35ms  | 36.70ms  | 43.06ms  | 61261.165124ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.xlarge   |           |                |   100 |           20454.8   |                 0 | 4.30ms   | 7.84ms   | 9.09ms   | 61277.841748ms |
| v16.4     | k6/PATCHSingle.js        | m5a.xlarge   |           |                |   100 |            3486.31  |                 0 | 28.24ms  | 30.67ms  | 31.88ms  | 60022.7736ms   |
| v16.4     | k6/POSTBulk.js           | m5a.xlarge   |           |                |   100 |            2226.05  |                 0 | 42.97ms  | 51.56ms  | 54.40ms  | 60292.995774ms |
| v16.4     | k6/POSTSingle.js         | m5a.xlarge   |           |                |   100 |            2615.89  |                 0 | 37.31ms  | 44.81ms  | 45.80ms  | 60084.823249ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.xlarge   |           |                |   100 |            2324.88  |                 0 | 41.32ms  | 49.66ms  | 51.37ms  | 60025.585037ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.xlarge   |           |                |   100 |            3746.4   |                 0 | 26.49ms  | 27.82ms  | 28.47ms  | 60020.310698ms |
| v16.4     | k6/RPCSimple.js          | m5a.xlarge   |           |                |   100 |            3134.22  |                 0 | 31.56ms  | 36.12ms  | 40.78ms  | 60019.08771ms  |
| v16.4     | k6/GETAllEmbed.js        | m5a.xlarge   | -A16m     |                |   100 |             304.672 |                 0 | 290.60ms | 508.89ms | 604.22ms | 60254.91128ms  |
| v16.4     | k6/GETSingleEmbed.js     | m5a.xlarge   | -A16m     |                |   100 |            3332.6   |                 0 | 29.37ms  | 33.49ms  | 34.14ms  | 60020.023805ms |
| v16.4     | k6/GETSingle.js          | m5a.xlarge   | -A16m     |                |   100 |            3985.29  |                 0 | 24.26ms  | 28.45ms  | 29.05ms  | 60017.714657ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.xlarge   | -A16m     |                |   100 |            3843.89  |                 0 | 25.03ms  | 29.29ms  | 29.90ms  | 60019.622794ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.xlarge   | -A16m     |                |   100 |            3261.72  |              1663 | 28.78ms  | 33.67ms  | 34.54ms  | 61265.911649ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.xlarge   | -A16m     |                |   100 |           22531.9   |                 0 | 3.94ms   | 6.98ms   | 8.10ms   | 61241.33464ms  |
| v16.4     | k6/PATCHSingle.js        | m5a.xlarge   | -A16m     |                |   100 |            3777.46  |                 0 | 25.54ms  | 30.19ms  | 30.94ms  | 60019.727352ms |
| v16.4     | k6/POSTBulk.js           | m5a.xlarge   | -A16m     |                |   100 |            2828.16  |                 0 | 34.46ms  | 37.50ms  | 38.75ms  | 60335.240335ms |
| v16.4     | k6/POSTSingle.js         | m5a.xlarge   | -A16m     |                |   100 |            3423.72  |                 0 | 28.62ms  | 33.34ms  | 34.39ms  | 60083.732404ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.xlarge   | -A16m     |                |   100 |            2914.13  |                 0 | 34.91ms  | 36.99ms  | 37.64ms  | 60022.712654ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.xlarge   | -A16m     |                |   100 |            3893.19  |                 0 | 24.83ms  | 29.10ms  | 29.74ms  | 60018.362113ms |
| v16.4     | k6/RPCSimple.js          | m5a.xlarge   | -A16m     |                |   100 |            3637.68  |                 0 | 26.66ms  | 30.48ms  | 31.02ms  | 60019.510527ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.xlarge   | -A32m     |                |   100 |             306.067 |                 0 | 288.79ms | 506.96ms | 603.90ms | 60258.132778ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.xlarge   | -A32m     |                |   100 |            3419.96  |                 0 | 27.97ms  | 34.37ms  | 35.20ms  | 60020.045536ms |
| v16.4     | k6/GETSingle.js          | m5a.xlarge   | -A32m     |                |   100 |            4041.37  |                 0 | 23.89ms  | 29.88ms  | 31.06ms  | 60017.836852ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.xlarge   | -A32m     |                |   100 |            3900.44  |                 0 | 24.65ms  | 30.68ms  | 31.73ms  | 60020.691674ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.xlarge   | -A32m     |                |   100 |            3332.27  |              2484 | 28.28ms  | 35.05ms  | 36.18ms  | 61271.126393ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.xlarge   | -A32m     |                |   100 |           22898.4   |                 0 | 3.88ms   | 6.84ms   | 7.96ms   | 61243.414516ms |
| v16.4     | k6/PATCHSingle.js        | m5a.xlarge   | -A32m     |                |   100 |            3859.84  |                 0 | 25.27ms  | 31.92ms  | 33.40ms  | 60019.833113ms |
| v16.4     | k6/POSTBulk.js           | m5a.xlarge   | -A32m     |                |   100 |            2932.26  |                 0 | 31.69ms  | 37.45ms  | 38.57ms  | 60366.756753ms |
| v16.4     | k6/POSTSingle.js         | m5a.xlarge   | -A32m     |                |   100 |            3406.81  |                 0 | 28.22ms  | 33.89ms  | 34.78ms  | 60097.345156ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.xlarge   | -A32m     |                |   100 |            3024.57  |                 0 | 31.70ms  | 37.47ms  | 38.29ms  | 60021.500387ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.xlarge   | -A32m     |                |   100 |            3994.03  |                 0 | 24.17ms  | 30.20ms  | 31.46ms  | 60018.255299ms |
| v16.4     | k6/RPCSimple.js          | m5a.xlarge   | -A32m     |                |   100 |            3752.64  |                 0 | 25.66ms  | 31.06ms  | 31.80ms  | 60018.283279ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.xlarge   | -A64m     |                |   100 |             304.12  |                 0 | 290.77ms | 504.51ms | 599.87ms | 60262.451479ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.xlarge   | -A64m     |                |   100 |            3497.28  |                 0 | 27.50ms  | 35.89ms  | 37.94ms  | 60022.283099ms |
| v16.4     | k6/GETSingle.js          | m5a.xlarge   | -A64m     |                |   100 |            4095.83  |                 0 | 23.56ms  | 25.08ms  | 35.41ms  | 60017.382844ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.xlarge   | -A64m     |                |   100 |            3906.79  |                 0 | 24.64ms  | 26.30ms  | 35.94ms  | 60018.064051ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.xlarge   | -A64m     |                |   100 |            3426.62  |              2320 | 27.46ms  | 30.67ms  | 39.56ms  | 61259.189064ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.xlarge   | -A64m     |                |   100 |           23028.2   |                 0 | 3.86ms   | 6.80ms   | 7.92ms   | 61255.099754ms |
| v16.4     | k6/PATCHSingle.js        | m5a.xlarge   | -A64m     |                |   100 |            3859.9   |                 0 | 24.96ms  | 27.16ms  | 36.87ms  | 60020.236347ms |
| v16.4     | k6/POSTBulk.js           | m5a.xlarge   | -A64m     |                |   100 |            3035.92  |                 0 | 30.72ms  | 38.60ms  | 40.34ms  | 60379.677205ms |
| v16.4     | k6/POSTSingle.js         | m5a.xlarge   | -A64m     |                |   100 |            3486.18  |                 0 | 27.57ms  | 33.69ms  | 37.08ms  | 60080.713361ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.xlarge   | -A64m     |                |   100 |            3147.96  |                 0 | 30.42ms  | 38.36ms  | 39.35ms  | 60021.324396ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.xlarge   | -A64m     |                |   100 |            4038.83  |                 0 | 23.92ms  | 25.51ms  | 35.89ms  | 60016.615148ms |
| v16.4     | k6/RPCSimple.js          | m5a.xlarge   | -A64m     |                |   100 |            3822.95  |                 0 | 25.23ms  | 28.93ms  | 34.35ms  | 60019.056817ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.2xlarge  |           |                |   100 |             300.523 |                 0 | 334.43ms | 382.62ms | 399.27ms | 60191.670408ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.2xlarge  |           |                |   100 |            5077.65  |                 0 | 19.46ms  | 21.03ms  | 22.67ms  | 60015.348191ms |
| v16.4     | k6/GETSingle.js          | m5a.2xlarge  |           |                |   100 |            6502.18  |                 0 | 15.67ms  | 17.81ms  | 18.22ms  | 60011.379182ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.2xlarge  |           |                |   100 |            6271.19  |                 0 | 16.40ms  | 18.34ms  | 18.75ms  | 60011.295774ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.2xlarge  |           |                |   100 |            5304.55  |              1932 | 18.60ms  | 19.83ms  | 20.33ms  | 61239.108168ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.2xlarge  |           |                |   100 |           35857.3   |                 0 | 2.20ms   | 4.61ms   | 5.44ms   | 61240.150932ms |
| v16.4     | k6/PATCHSingle.js        | m5a.2xlarge  |           |                |   100 |            6051.54  |                 0 | 16.82ms  | 19.63ms  | 20.25ms  | 60012.618248ms |
| v16.4     | k6/POSTBulk.js           | m5a.2xlarge  |           |                |   100 |            3881.08  |                 0 | 22.92ms  | 29.89ms  | 37.82ms  | 60439.678448ms |
| v16.4     | k6/POSTSingle.js         | m5a.2xlarge  |           |                |   100 |            4925.15  |                 0 | 20.12ms  | 21.61ms  | 22.23ms  | 60091.748658ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.2xlarge  |           |                |   100 |            3859.23  |                 0 | 25.82ms  | 31.32ms  | 36.06ms  | 60013.997735ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.2xlarge  |           |                |   100 |            6374.51  |                 0 | 16.04ms  | 18.24ms  | 18.66ms  | 60009.790557ms |
| v16.4     | k6/RPCSimple.js          | m5a.2xlarge  |           |                |   100 |            5634.21  |                 0 | 17.97ms  | 19.25ms  | 19.61ms  | 60013.864408ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.2xlarge  | -A16m     |                |   100 |             297.011 |                 0 | 336.28ms | 380.49ms | 399.07ms | 60186.401291ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.2xlarge  | -A16m     |                |   100 |            5755.64  |                 0 | 15.99ms  | 22.75ms  | 23.56ms  | 60014.035869ms |
| v16.4     | k6/GETSingle.js          | m5a.2xlarge  | -A16m     |                |   100 |            6868.23  |                 0 | 13.69ms  | 19.31ms  | 20.95ms  | 60009.892605ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.2xlarge  | -A16m     |                |   100 |            6707.82  |                 0 | 13.94ms  | 19.91ms  | 21.11ms  | 60011.126204ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.2xlarge  | -A16m     |                |   100 |            5820.82  |              1937 | 15.53ms  | 22.23ms  | 23.17ms  | 61260.139717ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.2xlarge  | -A16m     |                |   100 |           39780     |                 0 | 2.02ms   | 3.96ms   | 4.71ms   | 61237.730125ms |
| v16.4     | k6/PATCHSingle.js        | m5a.2xlarge  | -A16m     |                |   100 |            6503.6   |                 0 | 14.47ms  | 20.17ms  | 22.64ms  | 60013.488373ms |
| v16.4     | k6/POSTBulk.js           | m5a.2xlarge  | -A16m     |                |   100 |            4800.19  |                 0 | 18.33ms  | 25.21ms  | 27.63ms  | 60525.353686ms |
| v16.4     | k6/POSTSingle.js         | m5a.2xlarge  | -A16m     |                |   100 |            5666.67  |                 0 | 16.51ms  | 22.68ms  | 23.55ms  | 60084.328093ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.2xlarge  | -A16m     |                |   100 |            5023.26  |                 0 | 18.22ms  | 24.35ms  | 25.07ms  | 60019.14741ms  |
| v16.4     | k6/RPCGETSingle.js       | m5a.2xlarge  | -A16m     |                |   100 |            6955.85  |                 0 | 13.53ms  | 19.48ms  | 21.19ms  | 60011.791348ms |
| v16.4     | k6/RPCSimple.js          | m5a.2xlarge  | -A16m     |                |   100 |            6495.02  |                 0 | 14.44ms  | 20.30ms  | 21.04ms  | 60010.296597ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.2xlarge  | -A32m     |                |   100 |             307.279 |                 0 | 325.19ms | 373.67ms | 391.62ms | 60179.762803ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.2xlarge  | -A32m     |                |   100 |            6034.43  |                 0 | 15.52ms  | 21.67ms  | 25.94ms  | 60012.627423ms |
| v16.4     | k6/GETSingle.js          | m5a.2xlarge  | -A32m     |                |   100 |            6963     |                 0 | 13.49ms  | 14.67ms  | 22.56ms  | 60011.179798ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.2xlarge  | -A32m     |                |   100 |            6765.88  |                 0 | 13.90ms  | 15.25ms  | 24.94ms  | 60009.934282ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.2xlarge  | -A32m     |                |   100 |            5913.34  |              2265 | 15.42ms  | 19.06ms  | 26.98ms  | 61249.655928ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.2xlarge  | -A32m     |                |   100 |           40263.9   |                 0 | 1.99ms   | 3.91ms   | 4.65ms   | 61260.987293ms |
| v16.4     | k6/PATCHSingle.js        | m5a.2xlarge  | -A32m     |                |   100 |            6591.23  |                 0 | 14.50ms  | 16.93ms  | 22.43ms  | 60012.803588ms |
| v16.4     | k6/POSTBulk.js           | m5a.2xlarge  | -A32m     |                |   100 |            4889.15  |                 0 | 18.08ms  | 26.21ms  | 29.29ms  | 61518.055451ms |
| v16.4     | k6/POSTSingle.js         | m5a.2xlarge  | -A32m     |                |   100 |            5789.48  |                 0 | 16.30ms  | 22.06ms  | 25.88ms  | 60096.095005ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.2xlarge  | -A32m     |                |   100 |            5304.11  |                 0 | 17.41ms  | 25.40ms  | 26.39ms  | 60011.603437ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.2xlarge  | -A32m     |                |   100 |            6929.17  |                 0 | 13.59ms  | 14.80ms  | 21.81ms  | 60010.809673ms |
| v16.4     | k6/RPCSimple.js          | m5a.2xlarge  | -A32m     |                |   100 |            6528.66  |                 0 | 14.36ms  | 19.08ms  | 23.49ms  | 60011.091009ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.2xlarge  | -A64m     |                |   100 |             306.734 |                 0 | 325.68ms | 371.75ms | 388.74ms | 60172.569378ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.2xlarge  | -A64m     |                |   100 |            6025.71  |                 0 | 15.49ms  | 17.33ms  | 25.12ms  | 60011.815707ms |
| v16.4     | k6/GETSingle.js          | m5a.2xlarge  | -A64m     |                |   100 |            7098.38  |                 0 | 13.37ms  | 14.34ms  | 15.27ms  | 60010.170631ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.2xlarge  | -A64m     |                |   100 |            6805.26  |                 0 | 13.74ms  | 14.71ms  | 15.40ms  | 60011.354758ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.2xlarge  | -A64m     |                |   100 |            5980.17  |              2492 | 15.48ms  | 16.83ms  | 23.50ms  | 61246.60701ms  |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.2xlarge  | -A64m     |                |   100 |           40466.3   |                 0 | 1.98ms   | 3.88ms   | 4.61ms   | 61248.704357ms |
| v16.4     | k6/PATCHSingle.js        | m5a.2xlarge  | -A64m     |                |   100 |            6552.23  |                 0 | 14.52ms  | 16.04ms  | 17.93ms  | 60012.879156ms |
| v16.4     | k6/POSTBulk.js           | m5a.2xlarge  | -A64m     |                |   100 |            5196.22  |                 0 | 17.27ms  | 24.89ms  | 32.11ms  | 60560.8027ms   |
| v16.4     | k6/POSTSingle.js         | m5a.2xlarge  | -A64m     |                |   100 |            5833.91  |                 0 | 16.18ms  | 17.88ms  | 24.88ms  | 60085.77673ms  |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.2xlarge  | -A64m     |                |   100 |            5414.14  |                 0 | 17.23ms  | 22.22ms  | 30.09ms  | 60011.887773ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.2xlarge  | -A64m     |                |   100 |            6998.76  |                 0 | 13.43ms  | 14.37ms  | 14.97ms  | 60023.171508ms |
| v16.4     | k6/RPCSimple.js          | m5a.2xlarge  | -A64m     |                |   100 |            6618.63  |                 0 | 14.22ms  | 15.30ms  | 22.45ms  | 60010.15547ms  |
| v16.4     | k6/GETAllEmbed.js        | m5a.4xlarge  |           |                |   100 |             308.265 |                 0 | 316.73ms | 373.31ms | 383.47ms | 60194.993144ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.4xlarge  |           |                |   100 |            7085.9   |                 0 | 14.66ms  | 17.76ms  | 18.55ms  | 60018.748624ms |
| v16.4     | k6/GETSingle.js          | m5a.4xlarge  |           |                |   100 |            8361.8   |                 0 | 11.03ms  | 15.59ms  | 16.40ms  | 60013.613592ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.4xlarge  |           |                |   100 |            8168.32  |                 0 | 11.12ms  | 15.97ms  | 16.78ms  | 60008.883104ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.4xlarge  |           |                |   100 |            7361.16  |              4845 | 12.15ms  | 16.70ms  | 17.51ms  | 61249.420885ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.4xlarge  |           |                |   100 |           53970.6   |                 0 | 1.32ms   | 3.00ms   | 4.16ms   | 61245.987309ms |
| v16.4     | k6/PATCHSingle.js        | m5a.4xlarge  |           |                |   100 |            8045.17  |                 0 | 11.42ms  | 16.82ms  | 17.89ms  | 60011.538478ms |
| v16.4     | k6/POSTBulk.js           | m5a.4xlarge  |           |                |   100 |            5342.49  |                 0 | 17.42ms  | 21.25ms  | 23.83ms  | 60543.875553ms |
| v16.4     | k6/POSTSingle.js         | m5a.4xlarge  |           |                |   100 |            6944.25  |                 0 | 14.62ms  | 18.35ms  | 19.05ms  | 60087.082725ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.4xlarge  |           |                |   100 |            5937.45  |                 0 | 16.96ms  | 18.91ms  | 19.79ms  | 60015.484548ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.4xlarge  |           |                |   100 |            8327.62  |                 0 | 11.02ms  | 15.91ms  | 16.73ms  | 60008.27579ms  |
| v16.4     | k6/RPCSimple.js          | m5a.4xlarge  |           |                |   100 |            7611.51  |                 0 | 12.43ms  | 16.61ms  | 17.29ms  | 60013.349961ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.4xlarge  | -A16m     |                |   100 |             306.496 |                 0 | 320.20ms | 378.90ms | 393.84ms | 60180.140567ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.4xlarge  | -A16m     |                |   100 |            7856.99  |                 0 | 11.64ms  | 17.67ms  | 21.36ms  | 60011.00145ms  |
| v16.4     | k6/GETSingle.js          | m5a.4xlarge  | -A16m     |                |   100 |            8588.34  |                 0 | 10.93ms  | 14.02ms  | 18.25ms  | 60008.254029ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.4xlarge  | -A16m     |                |   100 |            8465.78  |                 0 | 10.97ms  | 14.17ms  | 18.49ms  | 60009.943277ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.4xlarge  | -A16m     |                |   100 |            7755.21  |              2759 | 11.46ms  | 16.01ms  | 22.13ms  | 61259.738323ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.4xlarge  | -A16m     |                |   100 |           63039.1   |                 0 | 1.20ms   | 2.14ms   | 2.69ms   | 61249.835851ms |
| v16.4     | k6/PATCHSingle.js        | m5a.4xlarge  | -A16m     |                |   100 |            8483.23  |                 0 | 10.86ms  | 15.60ms  | 18.62ms  | 60009.689179ms |
| v16.4     | k6/POSTBulk.js           | m5a.4xlarge  | -A16m     |                |   100 |            6627.87  |                 0 | 11.84ms  | 21.05ms  | 25.35ms  | 60687.663112ms |
| v16.4     | k6/POSTSingle.js         | m5a.4xlarge  | -A16m     |                |   100 |            7862.37  |                 0 | 11.42ms  | 18.30ms  | 21.78ms  | 60112.173135ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.4xlarge  | -A16m     |                |   100 |            7310.97  |                 0 | 12.15ms  | 20.44ms  | 21.73ms  | 60012.379429ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.4xlarge  | -A16m     |                |   100 |            8484.37  |                 0 | 11.00ms  | 14.08ms  | 18.77ms  | 60011.203805ms |
| v16.4     | k6/RPCSimple.js          | m5a.4xlarge  | -A16m     |                |   100 |            8266.9   |                 0 | 11.19ms  | 16.35ms  | 19.65ms  | 60009.227495ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.4xlarge  | -A32m     |                |   100 |             302.978 |              6216 | 322.66ms | 382.70ms | 391.76ms | 60182.651251ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.4xlarge  | -A32m     |                |   100 |            7995.33  |                 0 | 11.53ms  | 14.86ms  | 20.10ms  | 60009.256246ms |
| v16.4     | k6/GETSingle.js          | m5a.4xlarge  | -A32m     |                |   100 |            8449.44  |                 0 | 11.02ms  | 13.39ms  | 18.25ms  | 60009.508523ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.4xlarge  | -A32m     |                |   100 |            8455.78  |                 0 | 10.90ms  | 13.25ms  | 18.35ms  | 60010.221278ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.4xlarge  | -A32m     |                |   100 |            7932.17  |              6723 | 11.27ms  | 13.72ms  | 18.88ms  | 61285.881227ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.4xlarge  | -A32m     |                |   100 |           63979.3   |                 0 | 1.20ms   | 2.08ms   | 2.54ms   | 61251.592572ms |
| v16.4     | k6/PATCHSingle.js        | m5a.4xlarge  | -A32m     |                |   100 |            8506.64  |                 0 | 10.74ms  | 13.43ms  | 19.77ms  | 60010.649362ms |
| v16.4     | k6/POSTBulk.js           | m5a.4xlarge  | -A32m     |                |   100 |            7006.16  |                 0 | 11.23ms  | 19.68ms  | 24.57ms  | 60704.744033ms |
| v16.4     | k6/POSTSingle.js         | m5a.4xlarge  | -A32m     |                |   100 |            8131.47  |                 0 | 11.28ms  | 14.00ms  | 20.62ms  | 60103.177407ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.4xlarge  | -A32m     |                |   100 |            7526.3   |                 0 | 12.07ms  | 17.46ms  | 24.50ms  | 60022.839285ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.4xlarge  | -A32m     |                |   100 |            8512.57  |                 0 | 11.01ms  | 13.36ms  | 18.26ms  | 60009.051026ms |
| v16.4     | k6/RPCSimple.js          | m5a.4xlarge  | -A32m     |                |   100 |            8389.82  |                 0 | 11.17ms  | 13.78ms  | 18.73ms  | 60027.745805ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.4xlarge  | -A64m     |                |   100 |             301.891 |              6363 | 323.80ms | 385.87ms | 401.35ms | 60150.841345ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.4xlarge  | -A64m     |                |   100 |            7951.01  |                 0 | 11.55ms  | 13.86ms  | 15.61ms  | 60009.770861ms |
| v16.4     | k6/GETSingle.js          | m5a.4xlarge  | -A64m     |                |   100 |            8367.17  |                 0 | 11.10ms  | 13.33ms  | 14.44ms  | 60007.403718ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.4xlarge  | -A64m     |                |   100 |            8195.85  |                 0 | 11.15ms  | 13.27ms  | 14.29ms  | 60008.677565ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.4xlarge  | -A64m     |                |   100 |            7760.3   |              3823 | 11.52ms  | 13.56ms  | 14.73ms  | 61263.706063ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.4xlarge  | -A64m     |                |   100 |           64804.3   |                 0 | 1.20ms   | 2.03ms   | 2.41ms   | 61230.025028ms |
| v16.4     | k6/PATCHSingle.js        | m5a.4xlarge  | -A64m     |                |   100 |            8555.95  |                 0 | 10.74ms  | 13.16ms  | 14.67ms  | 60010.62093ms  |
| v16.4     | k6/POSTBulk.js           | m5a.4xlarge  | -A64m     |                |   100 |            6787.22  |                 0 | 11.03ms  | 17.62ms  | 28.57ms  | 60705.451004ms |
| v16.4     | k6/POSTSingle.js         | m5a.4xlarge  | -A64m     |                |   100 |            8089.21  |                 0 | 11.42ms  | 13.47ms  | 15.12ms  | 60105.124386ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.4xlarge  | -A64m     |                |   100 |            7502.79  |                 0 | 12.18ms  | 14.78ms  | 22.82ms  | 60011.284009ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.4xlarge  | -A64m     |                |   100 |            8162.8   |                 0 | 11.36ms  | 13.61ms  | 14.73ms  | 60008.298217ms |
| v16.4     | k6/RPCSimple.js          | m5a.4xlarge  | -A64m     |                |   100 |            8086.42  |                 0 | 11.53ms  | 13.76ms  | 15.16ms  | 60010.001513ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.8xlarge  |           |                |   100 |             309.226 |               795 | 314.99ms | 372.54ms | 381.51ms | 60192.140555ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.8xlarge  |           |                |   100 |            8791.46  |                 0 | 8.93ms   | 20.17ms  | 23.35ms  | 60006.858227ms |
| v16.4     | k6/GETSingle.js          | m5a.8xlarge  |           |                |   100 |            7879     |                 0 | 12.77ms  | 21.69ms  | 24.67ms  | 60004.031332ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.8xlarge  |           |                |   100 |            7541.23  |                 0 | 13.28ms  | 22.32ms  | 25.35ms  | 60008.943667ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.8xlarge  |           |                |   100 |            7212.64  |              3618 | 13.38ms  | 23.56ms  | 27.19ms  | 61260.402411ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.8xlarge  |           |                |   100 |           71033.4   |                 0 | 0.91ms   | 1.58ms   | 4.12ms   | 61245.476343ms |
| v16.4     | k6/PATCHSingle.js        | m5a.8xlarge  |           |                |   100 |            6982.64  |                 0 | 14.24ms  | 23.27ms  | 26.13ms  | 60012.244875ms |
| v16.4     | k6/POSTBulk.js           | m5a.8xlarge  |           |                |   100 |            5132.52  |                 0 | 17.38ms  | 29.75ms  | 33.36ms  | 60557.98703ms  |
| v16.4     | k6/POSTSingle.js         | m5a.8xlarge  |           |                |   100 |            6846.54  |                 0 | 14.68ms  | 24.04ms  | 27.00ms  | 60099.99075ms  |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.8xlarge  |           |                |   100 |            7551.09  |                 0 | 13.22ms  | 22.01ms  | 25.54ms  | 60011.883653ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.8xlarge  |           |                |   100 |            7651.68  |                 0 | 13.22ms  | 22.55ms  | 25.76ms  | 60013.490473ms |
| v16.4     | k6/RPCSimple.js          | m5a.8xlarge  |           |                |   100 |            7378.6   |                 0 | 13.78ms  | 23.55ms  | 27.03ms  | 60007.975543ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.8xlarge  | -A16m     |                |   100 |             307.169 |               952 | 319.77ms | 381.22ms | 394.02ms | 60185.153222ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.8xlarge  | -A16m     |                |   100 |           10981.3   |                 0 | 6.62ms   | 18.82ms  | 22.26ms  | 60012.932049ms |
| v16.4     | k6/GETSingle.js          | m5a.8xlarge  | -A16m     |                |   100 |            9485.84  |                 0 | 7.64ms   | 20.58ms  | 23.66ms  | 60016.19523ms  |
| v16.4     | k6/GETSingleJWT.js       | m5a.8xlarge  | -A16m     |                |   100 |            9217.1   |                 0 | 8.03ms   | 20.79ms  | 24.00ms  | 60008.582371ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.8xlarge  | -A16m     |                |   100 |            8862.74  |              6387 | 7.73ms   | 22.00ms  | 25.56ms  | 61251.164654ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.8xlarge  | -A16m     |                |   100 |           79234.7   |                 0 | 0.90ms   | 1.42ms   | 1.82ms   | 61272.723536ms |
| v16.4     | k6/PATCHSingle.js        | m5a.8xlarge  | -A16m     |                |   100 |            8438.2   |                 0 | 10.47ms  | 21.20ms  | 24.47ms  | 60012.066406ms |
| v16.4     | k6/POSTBulk.js           | m5a.8xlarge  | -A16m     |                |   100 |            5713.97  |                 0 | 14.37ms  | 25.78ms  | 30.50ms  | 61626.891359ms |
| v16.4     | k6/POSTSingle.js         | m5a.8xlarge  | -A16m     |                |   100 |            8201.34  |                 0 | 10.30ms  | 22.39ms  | 25.89ms  | 60116.395221ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.8xlarge  | -A16m     |                |   100 |            9980.56  |                 0 | 7.35ms   | 20.08ms  | 23.50ms  | 60009.173816ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.8xlarge  | -A16m     |                |   100 |            9672.82  |                 0 | 7.24ms   | 20.48ms  | 23.59ms  | 60013.445293ms |
| v16.4     | k6/RPCSimple.js          | m5a.8xlarge  | -A16m     |                |   100 |            9373.64  |                 0 | 7.57ms   | 20.96ms  | 24.17ms  | 60008.065261ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.8xlarge  | -A32m     |                |   100 |             303.416 |               938 | 322.49ms | 381.21ms | 392.08ms | 60174.803632ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.8xlarge  | -A32m     |                |   100 |           10872.8   |                 0 | 6.74ms   | 18.43ms  | 23.19ms  | 60007.661331ms |
| v16.4     | k6/GETSingle.js          | m5a.8xlarge  | -A32m     |                |   100 |           10083     |                 0 | 6.89ms   | 20.20ms  | 24.15ms  | 60009.008523ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.8xlarge  | -A32m     |                |   100 |            9996.89  |                 0 | 6.87ms   | 20.20ms  | 24.25ms  | 60040.600892ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.8xlarge  | -A32m     |                |   100 |            9404.12  |              8297 | 7.05ms   | 20.43ms  | 26.51ms  | 61242.952938ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.8xlarge  | -A32m     |                |   100 |           80815.6   |                 0 | 0.90ms   | 1.38ms   | 1.74ms   | 61269.073881ms |
| v16.4     | k6/PATCHSingle.js        | m5a.8xlarge  | -A32m     |                |   100 |            8734.48  |                 0 | 9.06ms   | 21.15ms  | 25.31ms  | 60018.32164ms  |
| v16.4     | k6/POSTBulk.js           | m5a.8xlarge  | -A32m     |                |   100 |            6018.71  |                 0 | 13.81ms  | 25.60ms  | 32.29ms  | 60639.023762ms |
| v16.4     | k6/POSTSingle.js         | m5a.8xlarge  | -A32m     |                |   100 |            8891.34  |                 0 | 7.55ms   | 20.67ms  | 25.68ms  | 60114.247916ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.8xlarge  | -A32m     |                |   100 |            9703.36  |                 0 | 7.60ms   | 20.01ms  | 24.59ms  | 60008.575856ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.8xlarge  | -A32m     |                |   100 |           10056.8   |                 0 | 6.81ms   | 20.47ms  | 24.44ms  | 60008.421645ms |
| v16.4     | k6/RPCSimple.js          | m5a.8xlarge  | -A32m     |                |   100 |            9842.57  |                 0 | 6.95ms   | 20.87ms  | 25.32ms  | 60007.28625ms  |
| v16.4     | k6/GETAllEmbed.js        | m5a.8xlarge  | -A64m     |                |   100 |             305.927 |              1106 | 317.44ms | 372.95ms | 382.85ms | 60203.953473ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.8xlarge  | -A64m     |                |   100 |           10452.2   |                 0 | 7.06ms   | 17.71ms  | 22.16ms  | 60008.655236ms |
| v16.4     | k6/GETSingle.js          | m5a.8xlarge  | -A64m     |                |   100 |           10758.4   |                 0 | 6.48ms   | 18.68ms  | 23.01ms  | 60012.586769ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.8xlarge  | -A64m     |                |   100 |            9471.09  |                 0 | 7.07ms   | 20.14ms  | 24.68ms  | 60009.678367ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.8xlarge  | -A64m     |                |   100 |            9443.72  |              2035 | 7.04ms   | 19.40ms  | 23.83ms  | 61274.338653ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.8xlarge  | -A64m     |                |   100 |           81229.3   |                 0 | 0.90ms   | 1.40ms   | 1.74ms   | 61258.890115ms |
| v16.4     | k6/PATCHSingle.js        | m5a.8xlarge  | -A64m     |                |   100 |            9172.33  |                 0 | 7.41ms   | 20.03ms  | 23.96ms  | 60018.037782ms |
| v16.4     | k6/POSTBulk.js           | m5a.8xlarge  | -A64m     |                |   100 |            6048.89  |                 0 | 13.72ms  | 23.58ms  | 34.39ms  | 60636.876726ms |
| v16.4     | k6/POSTSingle.js         | m5a.8xlarge  | -A64m     |                |   100 |            9063.71  |                 0 | 6.81ms   | 19.99ms  | 23.56ms  | 60109.611888ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.8xlarge  | -A64m     |                |   100 |            9297.53  |                 0 | 7.70ms   | 19.95ms  | 25.03ms  | 60020.001438ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.8xlarge  | -A64m     |                |   100 |           10713     |                 0 | 6.32ms   | 19.23ms  | 23.82ms  | 60005.740094ms |
| v16.4     | k6/RPCSimple.js          | m5a.8xlarge  | -A64m     |                |   100 |           10651.7   |                 0 | 6.51ms   | 19.07ms  | 23.75ms  | 60049.582804ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.12xlarge |           |                |   100 |             290.947 |               790 | 339.63ms | 399.46ms | 412.05ms | 60179.343043ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.12xlarge |           |                |   100 |           10151     |                 0 | 6.49ms   | 18.74ms  | 22.87ms  | 60013.292728ms |
| v16.4     | k6/GETSingle.js          | m5a.12xlarge |           |                |   100 |            8108.84  |                 0 | 11.21ms  | 25.83ms  | 29.79ms  | 60007.450958ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.12xlarge |           |                |   100 |            7965.32  |                 0 | 11.54ms  | 25.44ms  | 29.37ms  | 60003.272771ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.12xlarge |           |                |   100 |            7637.26  |              4986 | 11.17ms  | 26.90ms  | 31.43ms  | 61256.268889ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.12xlarge |           |                |   100 |           81012.4   |                 0 | 0.79ms   | 1.25ms   | 1.82ms   | 61261.47538ms  |
| v16.4     | k6/PATCHSingle.js        | m5a.12xlarge |           |                |   100 |            6217.56  |                 0 | 15.83ms  | 26.21ms  | 29.55ms  | 60007.50631ms  |
| v16.4     | k6/POSTBulk.js           | m5a.12xlarge |           |                |   100 |            5019.05  |                 0 | 18.00ms  | 31.01ms  | 35.13ms  | 60552.935237ms |
| v16.4     | k6/POSTSingle.js         | m5a.12xlarge |           |                |   100 |            6151.07  |                 0 | 16.26ms  | 27.40ms  | 30.87ms  | 60085.645485ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.12xlarge |           |                |   100 |            9567.5   |                 0 | 6.65ms   | 19.75ms  | 24.20ms  | 60006.797047ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.12xlarge |           |                |   100 |            8246.95  |                 0 | 11.07ms  | 25.26ms  | 29.07ms  | 60012.497937ms |
| v16.4     | k6/RPCSimple.js          | m5a.12xlarge |           |                |   100 |            8146.63  |                 0 | 10.89ms  | 26.03ms  | 29.95ms  | 60020.550123ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.12xlarge | -A16m     |                |   100 |             291.921 |               856 | 337.58ms | 401.92ms | 418.12ms | 60204.734593ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.12xlarge | -A16m     |                |   100 |           12182.4   |                 0 | 5.22ms   | 19.39ms  | 23.52ms  | 60004.372317ms |
| v16.4     | k6/GETSingle.js          | m5a.12xlarge | -A16m     |                |   100 |            9905.56  |                 0 | 5.71ms   | 22.80ms  | 26.71ms  | 60009.831458ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.12xlarge | -A16m     |                |   100 |            9505.26  |                 0 | 5.94ms   | 22.74ms  | 26.54ms  | 60004.257855ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.12xlarge | -A16m     |                |   100 |            9520.6   |             10994 | 5.56ms   | 23.76ms  | 27.92ms  | 61248.537913ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.12xlarge | -A16m     |                |   100 |           90344.8   |                 0 | 0.79ms   | 1.18ms   | 1.44ms   | 61241.577867ms |
| v16.4     | k6/PATCHSingle.js        | m5a.12xlarge | -A16m     |                |   100 |            7221.66  |                 0 | 12.54ms  | 25.62ms  | 29.37ms  | 60016.389772ms |
| v16.4     | k6/POSTBulk.js           | m5a.12xlarge | -A16m     |                |   100 |            5249.27  |                 0 | 16.43ms  | 29.34ms  | 34.84ms  | 60544.055454ms |
| v16.4     | k6/POSTSingle.js         | m5a.12xlarge | -A16m     |                |   100 |            7247.48  |                 0 | 12.29ms  | 25.75ms  | 29.60ms  | 60086.963715ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.12xlarge | -A16m     |                |   100 |           11814.7   |                 0 | 5.26ms   | 20.53ms  | 24.67ms  | 60006.69812ms  |
| v16.4     | k6/RPCGETSingle.js       | m5a.12xlarge | -A16m     |                |   100 |           10029.6   |                 0 | 5.33ms   | 22.88ms  | 26.70ms  | 60010.105656ms |
| v16.4     | k6/RPCSimple.js          | m5a.12xlarge | -A16m     |                |   100 |           10011.4   |                 0 | 5.31ms   | 23.05ms  | 27.10ms  | 60011.648074ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.12xlarge | -A32m     |                |   100 |             294.742 |               927 | 335.51ms | 401.11ms | 417.87ms | 60198.354674ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.12xlarge | -A32m     |                |   100 |           11869.1   |                 0 | 5.45ms   | 19.12ms  | 24.68ms  | 60013.820836ms |
| v16.4     | k6/GETSingle.js          | m5a.12xlarge | -A32m     |                |   100 |           10947.6   |                 0 | 5.37ms   | 21.60ms  | 26.21ms  | 60009.609651ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.12xlarge | -A32m     |                |   100 |           10283.4   |                 0 | 5.33ms   | 22.65ms  | 27.02ms  | 60010.959695ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.12xlarge | -A32m     |                |   100 |           10603.5   |              9365 | 4.18ms   | 22.03ms  | 29.09ms  | 61248.622264ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.12xlarge | -A32m     |                |   100 |           92416.1   |                 0 | 0.79ms   | 1.17ms   | 1.40ms   | 61245.712081ms |
| v16.4     | k6/PATCHSingle.js        | m5a.12xlarge | -A32m     |                |   100 |            7468.88  |                 0 | 10.94ms  | 25.99ms  | 30.51ms  | 60014.786643ms |
| v16.4     | k6/POSTBulk.js           | m5a.12xlarge | -A32m     |                |   100 |            5085.45  |                 0 | 17.17ms  | 31.24ms  | 38.01ms  | 60549.417554ms |
| v16.4     | k6/POSTSingle.js         | m5a.12xlarge | -A32m     |                |   100 |            7549.69  |                 0 | 9.60ms   | 26.02ms  | 30.62ms  | 60135.013142ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.12xlarge | -A32m     |                |   100 |           12254.5   |                 0 | 5.20ms   | 18.70ms  | 25.53ms  | 60013.486411ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.12xlarge | -A32m     |                |   100 |           10465.7   |                 0 | 5.21ms   | 22.85ms  | 27.37ms  | 60017.466709ms |
| v16.4     | k6/RPCSimple.js          | m5a.12xlarge | -A32m     |                |   100 |           11030.3   |                 0 | 4.31ms   | 22.42ms  | 27.48ms  | 60015.680835ms |
| v16.4     | k6/GETAllEmbed.js        | m5a.12xlarge | -A64m     |                |   100 |             294.42  |               829 | 335.63ms | 394.35ms | 410.93ms | 60203.026075ms |
| v16.4     | k6/GETSingleEmbed.js     | m5a.12xlarge | -A64m     |                |   100 |           12787.2   |                 0 | 4.91ms   | 16.80ms  | 22.02ms  | 60052.389691ms |
| v16.4     | k6/GETSingle.js          | m5a.12xlarge | -A64m     |                |   100 |           12324.1   |                 0 | 4.82ms   | 19.37ms  | 24.49ms  | 60012.261336ms |
| v16.4     | k6/GETSingleJWT.js       | m5a.12xlarge | -A64m     |                |   100 |           11454.2   |                 0 | 5.00ms   | 20.42ms  | 25.62ms  | 60005.575255ms |
| v16.4     | k6/GETSingleUniqueJWT.js | m5a.12xlarge | -A64m     |                |   100 |           11217.3   |              3117 | 4.42ms   | 19.98ms  | 25.45ms  | 61277.094487ms |
| v16.4     | k6/OPTIONSUniqueJWT.js   | m5a.12xlarge | -A64m     |                |   100 |           91786.3   |                 0 | 0.79ms   | 1.19ms   | 1.42ms   | 61247.945163ms |
| v16.4     | k6/PATCHSingle.js        | m5a.12xlarge | -A64m     |                |   100 |            7528.02  |                 0 | 9.39ms   | 25.78ms  | 30.60ms  | 60007.016988ms |
| v16.4     | k6/POSTBulk.js           | m5a.12xlarge | -A64m     |                |   100 |            5090.48  |                 0 | 17.52ms  | 29.86ms  | 38.68ms  | 60561.290718ms |
| v16.4     | k6/POSTSingle.js         | m5a.12xlarge | -A64m     |                |   100 |            7862.58  |                 0 | 6.23ms   | 25.10ms  | 29.41ms  | 60105.456803ms |
| v16.4     | k6/RPCGETSingleEmbed.js  | m5a.12xlarge | -A64m     |                |   100 |           11650.6   |                 0 | 5.28ms   | 19.22ms  | 24.95ms  | 60018.269439ms |
| v16.4     | k6/RPCGETSingle.js       | m5a.12xlarge | -A64m     |                |   100 |           11668.6   |                 0 | 4.80ms   | 21.08ms  | 26.39ms  | 60009.165123ms |
| v16.4     | k6/RPCSimple.js          | m5a.12xlarge | -A64m     |                |   100 |           10654.7   |                 0 | 5.26ms   | 22.82ms  | 28.07ms  | 60014.126269ms |