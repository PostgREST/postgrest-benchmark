| Version   | K6 script            | EC2          | GHC RTS             | Extra config   |   VUs |   http_reqs (req/s) |   failed requests | p50      | p90      | p95      | Duration       |
|:----------|:---------------------|:-------------|:--------------------|:---------------|------:|--------------------:|------------------:|:---------|:---------|:---------|:---------------|
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  |                     |                |    10 |            2144.74  |                 0 | 4.07ms   | 4.60ms   | 5.17ms   | 60265.167626ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  |                     |                |    10 |            3108.81  |                 0 | 2.95ms   | 3.67ms   | 3.91ms   | 60070.306171ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  |                     |                |    10 |            4763.82  |                 0 | 1.78ms   | 2.63ms   | 3.32ms   | 60003.548188ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  |                     |                |    10 |             131.941 |                 0 | 75.05ms  | 78.22ms  | 80.16ms  | 60064.711521ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  |                     |                |    50 |            5227.16  |                 0 | 6.96ms   | 12.34ms  | 14.38ms  | 61484.057651ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  |                     |                |    50 |            6301.47  |                 0 | 7.38ms   | 11.90ms  | 13.37ms  | 60075.656505ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  |                     |                |    50 |            9900.89  |                 0 | 3.33ms   | 9.88ms   | 11.72ms  | 60004.290218ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  |                     |                |    50 |             337.306 |                 0 | 140.61ms | 190.75ms | 197.37ms | 60102.656122ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  |                     |                |   100 |            5472.62  |                 0 | 15.01ms  | 25.43ms  | 42.29ms  | 60531.153007ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  |                     |                |   100 |            7163.53  |                 0 | 13.24ms  | 22.49ms  | 25.17ms  | 60093.56038ms  |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  |                     |                |   100 |            8591.66  |                 0 | 10.05ms  | 19.42ms  | 21.80ms  | 60006.576946ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  |                     |                |   100 |             333.228 |                 0 | 288.70ms | 343.85ms | 352.86ms | 60184.018551ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  | -A64m -n4m          |                |    10 |            2137.94  |                 0 | 4.21ms   | 4.60ms   | 4.76ms   | 60265.865075ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  | -A64m -n4m          |                |    10 |            3066.48  |                 0 | 2.96ms   | 3.73ms   | 3.91ms   | 60113.217942ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  | -A64m -n4m          |                |    10 |            4805.79  |                 0 | 1.78ms   | 2.45ms   | 2.77ms   | 60003.713371ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  | -A64m -n4m          |                |    10 |             134.391 |                 0 | 73.73ms  | 75.50ms  | 77.07ms  | 60071.055105ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  | -A64m -n4m          |                |    50 |            5550.76  |                 0 | 6.61ms   | 10.60ms  | 13.17ms  | 60568.277287ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  | -A64m -n4m          |                |    50 |            6476.67  |                 0 | 7.18ms   | 10.93ms  | 12.13ms  | 60080.84976ms  |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  | -A64m -n4m          |                |    50 |            9099.96  |                 0 | 3.51ms   | 10.03ms  | 11.78ms  | 60028.611012ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  | -A64m -n4m          |                |    50 |             337.157 |                 0 | 140.70ms | 190.78ms | 197.87ms | 60105.555672ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  | -A64m -n4m          |                |   100 |            6256.66  |                 0 | 12.78ms  | 23.52ms  | 35.66ms  | 60641.646876ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  | -A64m -n4m          |                |   100 |            9181.94  |                 0 | 6.68ms   | 19.92ms  | 23.64ms  | 60094.697624ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  | -A64m -n4m          |                |   100 |           10406.3   |                 0 | 7.07ms   | 17.96ms  | 22.24ms  | 60009.534837ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  | -A64m -n4m          |                |   100 |             333.436 |                 0 | 290.25ms | 344.48ms | 354.16ms | 60158.492355ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  | -A64m -n4m -AL2048m |                |    10 |            2118.45  |                 0 | 4.23ms   | 4.60ms   | 4.77ms   | 60269.096267ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  | -A64m -n4m -AL2048m |                |    10 |            2804.53  |                 0 | 3.02ms   | 3.98ms   | 4.07ms   | 60107.754965ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  | -A64m -n4m -AL2048m |                |    10 |            4700.55  |                 0 | 1.80ms   | 2.52ms   | 2.85ms   | 60002.99108ms  |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  | -A64m -n4m -AL2048m |                |    10 |             133.513 |                 0 | 74.13ms  | 76.17ms  | 77.07ms  | 60069.222277ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  | -A64m -n4m -AL2048m |                |    50 |            5646.48  |                 0 | 6.59ms   | 10.61ms  | 12.69ms  | 60620.972882ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  | -A64m -n4m -AL2048m |                |    50 |            6340.83  |                 0 | 7.29ms   | 11.44ms  | 12.69ms  | 60081.577669ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  | -A64m -n4m -AL2048m |                |    50 |            9152.63  |                 0 | 3.45ms   | 9.92ms   | 11.56ms  | 60003.199269ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  | -A64m -n4m -AL2048m |                |    50 |             335.98  |                 0 | 140.35ms | 191.88ms | 198.40ms | 60119.646243ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  | -A64m -n4m -AL2048m |                |   100 |            6258.86  |                 0 | 12.45ms  | 23.18ms  | 34.25ms  | 60627.968664ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  | -A64m -n4m -AL2048m |                |   100 |            9051.97  |                 0 | 6.99ms   | 19.99ms  | 23.91ms  | 60104.059351ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  | -A64m -n4m -AL2048m |                |   100 |            9191.06  |                 0 | 7.68ms   | 19.60ms  | 23.82ms  | 60003.93593ms  |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  | -A64m -n4m -AL2048m |                |   100 |             332.218 |                 0 | 288.92ms | 346.42ms | 356.97ms | 60192.404824ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  | -A64m -n4m -AL3072m |                |    10 |            2140.42  |                 0 | 4.20ms   | 4.57ms   | 4.72ms   | 60262.986519ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  | -A64m -n4m -AL3072m |                |    10 |            2782.53  |                 0 | 3.02ms   | 4.00ms   | 4.09ms   | 60071.55372ms  |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  | -A64m -n4m -AL3072m |                |    10 |            4616.5   |                 0 | 1.83ms   | 2.55ms   | 2.88ms   | 60003.049141ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  | -A64m -n4m -AL3072m |                |    10 |             133.654 |                 0 | 74.12ms  | 75.80ms  | 76.99ms  | 60050.558988ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  | -A64m -n4m -AL3072m |                |    50 |            5528.59  |                 0 | 6.62ms   | 10.64ms  | 12.63ms  | 61588.732263ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  | -A64m -n4m -AL3072m |                |    50 |            6357.51  |                 0 | 7.31ms   | 11.37ms  | 12.58ms  | 60079.180654ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  | -A64m -n4m -AL3072m |                |    50 |            9176.23  |                 0 | 3.45ms   | 9.87ms   | 11.54ms  | 60004.38385ms  |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  | -A64m -n4m -AL3072m |                |    50 |             336.955 |                 0 | 140.02ms | 190.64ms | 197.08ms | 60120.795763ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  | -A64m -n4m -AL3072m |                |   100 |            6248.11  |                 0 | 12.57ms  | 22.86ms  | 32.93ms  | 60654.867063ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  | -A64m -n4m -AL3072m |                |   100 |            8973.36  |                 0 | 7.36ms   | 19.87ms  | 23.65ms  | 60106.270516ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  | -A64m -n4m -AL3072m |                |   100 |            9419.91  |                 0 | 7.49ms   | 19.40ms  | 23.56ms  | 60009.503793ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  | -A64m -n4m -AL3072m |                |   100 |             328.924 |                 0 | 292.87ms | 353.25ms | 365.83ms | 60171.908947ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  | -A64m -n4m -AL4096m |                |    10 |            2136.87  |                 0 | 4.20ms   | 4.61ms   | 4.78ms   | 60277.292349ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  | -A64m -n4m -AL4096m |                |    10 |            2801.8   |                 0 | 3.02ms   | 3.98ms   | 4.07ms   | 60059.61298ms  |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  | -A64m -n4m -AL4096m |                |    10 |            4628.47  |                 0 | 1.82ms   | 2.53ms   | 2.86ms   | 60001.906622ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  | -A64m -n4m -AL4096m |                |    10 |             133.356 |                 0 | 74.37ms  | 76.19ms  | 77.18ms  | 60072.275688ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  | -A64m -n4m -AL4096m |                |    50 |            5632.83  |                 0 | 6.62ms   | 10.57ms  | 12.45ms  | 60615.503581ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  | -A64m -n4m -AL4096m |                |    50 |            6390.6   |                 0 | 7.28ms   | 11.36ms  | 12.55ms  | 60077.913263ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  | -A64m -n4m -AL4096m |                |    50 |            9081.89  |                 0 | 3.49ms   | 9.98ms   | 11.62ms  | 60003.021716ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  | -A64m -n4m -AL4096m |                |    50 |             316.971 |                 0 | 146.89ms | 199.19ms | 206.53ms | 60371.543468ms |
| v16.4     | k6/POSTBulk.js       | m5a.8xlarge  | -A64m -n4m -AL4096m |                |   100 |            6411.43  |                 0 | 12.23ms  | 22.42ms  | 28.01ms  | 60656.004922ms |
| v16.4     | k6/POSTSingle.js     | m5a.8xlarge  | -A64m -n4m -AL4096m |                |   100 |            8883.96  |                 0 | 7.57ms   | 19.93ms  | 23.63ms  | 60081.346573ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.8xlarge  | -A64m -n4m -AL4096m |                |   100 |            9182     |                 0 | 7.68ms   | 19.46ms  | 23.65ms  | 60010.242823ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.8xlarge  | -A64m -n4m -AL4096m |                |   100 |             313.829 |                 0 | 302.41ms | 366.19ms | 385.51ms | 60192.08111ms  |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge |                     |                |    10 |            2109.85  |                 0 | 4.23ms   | 4.71ms   | 5.43ms   | 60261.229841ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge |                     |                |    10 |            3015.43  |                 0 | 2.97ms   | 3.88ms   | 4.01ms   | 60061.09441ms  |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge |                     |                |    10 |            4659.88  |                 0 | 1.82ms   | 2.66ms   | 3.55ms   | 60002.3819ms   |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge |                     |                |    10 |             131.829 |                 0 | 75.07ms  | 78.22ms  | 79.94ms  | 60070.362348ms |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge |                     |                |    50 |            5288.64  |                 0 | 7.09ms   | 13.13ms  | 15.33ms  | 60559.472641ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge |                     |                |    50 |            6070.05  |                 0 | 7.51ms   | 12.83ms  | 14.58ms  | 60062.598626ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge |                     |                |    50 |           10167.8   |                 0 | 3.05ms   | 10.02ms  | 11.90ms  | 60004.891818ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge |                     |                |    50 |             322.848 |                 0 | 146.72ms | 199.29ms | 206.23ms | 60105.765279ms |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge |                     |                |   100 |            5538.54  |                 0 | 15.78ms  | 27.48ms  | 31.26ms  | 60592.267943ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge |                     |                |   100 |            6501.65  |                 0 | 15.26ms  | 25.36ms  | 28.63ms  | 60087.68477ms  |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge |                     |                |   100 |           10414.6   |                 0 | 6.16ms   | 18.40ms  | 22.13ms  | 60004.229109ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge |                     |                |   100 |             319.27  |                 0 | 301.86ms | 359.53ms | 367.94ms | 60190.40053ms  |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge | -A64m -n4m          |                |    10 |            2139.05  |                 0 | 4.18ms   | 4.65ms   | 4.78ms   | 60274.036888ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge | -A64m -n4m          |                |    10 |            2907.05  |                 0 | 2.99ms   | 3.94ms   | 4.03ms   | 60061.307506ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge | -A64m -n4m          |                |    10 |            4526.48  |                 0 | 1.87ms   | 2.59ms   | 2.94ms   | 60003.106035ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge | -A64m -n4m          |                |    10 |             134.638 |                 0 | 73.78ms  | 75.45ms  | 76.90ms  | 60071.973568ms |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge | -A64m -n4m          |                |    50 |            5501.03  |                 0 | 6.56ms   | 11.08ms  | 14.03ms  | 60550.347298ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge | -A64m -n4m          |                |    50 |            6451.32  |                 0 | 6.98ms   | 11.48ms  | 13.15ms  | 60084.158031ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge | -A64m -n4m          |                |    50 |            8245.77  |                 0 | 3.52ms   | 11.86ms  | 14.15ms  | 60003.472853ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge | -A64m -n4m          |                |    50 |             322.106 |                 0 | 147.07ms | 199.50ms | 207.49ms | 60113.805627ms |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge | -A64m -n4m          |                |   100 |            5355.85  |                 0 | 16.54ms  | 28.80ms  | 36.72ms  | 60556.996326ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge | -A64m -n4m          |                |   100 |            8141.63  |                 0 | 6.03ms   | 24.57ms  | 28.89ms  | 60086.245005ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge | -A64m -n4m          |                |   100 |           12123.6   |                 0 | 5.06ms   | 18.38ms  | 23.58ms  | 60006.40064ms  |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge | -A64m -n4m          |                |   100 |             318.032 |                 0 | 303.83ms | 360.13ms | 369.29ms | 60179.528136ms |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge | -A64m -n4m -AL2048m |                |    10 |            2114.94  |                 0 | 4.22ms   | 4.63ms   | 4.78ms   | 60259.048216ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge | -A64m -n4m -AL2048m |                |    10 |            2692.1   |                 0 | 3.14ms   | 4.06ms   | 4.18ms   | 60060.896545ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge | -A64m -n4m -AL2048m |                |    10 |            4411.04  |                 0 | 1.90ms   | 2.66ms   | 3.02ms   | 60003.098665ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge | -A64m -n4m -AL2048m |                |    10 |             133.675 |                 0 | 74.18ms  | 76.00ms  | 77.21ms  | 60041.149925ms |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge | -A64m -n4m -AL2048m |                |    50 |            5515.4   |                 0 | 6.63ms   | 11.01ms  | 12.99ms  | 60577.655313ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge | -A64m -n4m -AL2048m |                |    50 |            6143.62  |                 0 | 7.47ms   | 11.89ms  | 13.31ms  | 60080.492277ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge | -A64m -n4m -AL2048m |                |    50 |            7979.81  |                 0 | 3.65ms   | 11.76ms  | 13.82ms  | 60005.304234ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge | -A64m -n4m -AL2048m |                |    50 |             319.73  |                 0 | 146.83ms | 200.23ms | 206.90ms | 60501.085819ms |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge | -A64m -n4m -AL2048m |                |   100 |            5309.63  |                 0 | 16.48ms  | 27.99ms  | 34.01ms  | 60583.920169ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge | -A64m -n4m -AL2048m |                |   100 |            8289.1   |                 0 | 5.99ms   | 23.65ms  | 27.69ms  | 60105.573046ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge | -A64m -n4m -AL2048m |                |   100 |           10673.2   |                 0 | 5.55ms   | 20.53ms  | 25.23ms  | 60019.084418ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge | -A64m -n4m -AL2048m |                |   100 |             316.336 |                 0 | 301.78ms | 364.93ms | 379.74ms | 60163.968417ms |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge | -A64m -n4m -AL3072m |                |    10 |            2135.9   |                 0 | 4.18ms   | 4.62ms   | 4.75ms   | 60274.474657ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge | -A64m -n4m -AL3072m |                |    10 |            2665.91  |                 0 | 3.12ms   | 4.06ms   | 4.17ms   | 60060.632161ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge | -A64m -n4m -AL3072m |                |    10 |            4418.77  |                 0 | 1.89ms   | 2.63ms   | 2.98ms   | 60058.599614ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge | -A64m -n4m -AL3072m |                |    10 |             132.799 |                 0 | 74.40ms  | 76.07ms  | 77.26ms  | 60060.627522ms |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge | -A64m -n4m -AL3072m |                |    50 |            5583.76  |                 0 | 6.62ms   | 10.94ms  | 12.91ms  | 60613.95953ms  |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge | -A64m -n4m -AL3072m |                |    50 |            6221.95  |                 0 | 7.40ms   | 11.80ms  | 13.19ms  | 60080.072485ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge | -A64m -n4m -AL3072m |                |    50 |            8156.67  |                 0 | 3.47ms   | 11.69ms  | 13.76ms  | 60005.027793ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge | -A64m -n4m -AL3072m |                |    50 |             321.509 |                 0 | 147.39ms | 199.69ms | 206.84ms | 60110.26094ms  |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge | -A64m -n4m -AL3072m |                |   100 |            5374.17  |                 0 | 15.97ms  | 27.71ms  | 34.33ms  | 60674.07079ms  |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge | -A64m -n4m -AL3072m |                |   100 |            8710.08  |                 0 | 5.74ms   | 22.75ms  | 26.87ms  | 60096.318577ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge | -A64m -n4m -AL3072m |                |   100 |           11146.3   |                 0 | 5.73ms   | 18.67ms  | 23.21ms  | 60010.3479ms   |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge | -A64m -n4m -AL3072m |                |   100 |             315.651 |                 0 | 302.53ms | 362.29ms | 372.13ms | 60624.008439ms |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge | -A64m -n4m -AL4096m |                |    10 |            2130.98  |                 0 | 4.20ms   | 4.62ms   | 4.74ms   | 60275.644805ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge | -A64m -n4m -AL4096m |                |    10 |            2595.43  |                 0 | 3.56ms   | 4.09ms   | 4.21ms   | 60059.014062ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge | -A64m -n4m -AL4096m |                |    10 |            4435.14  |                 0 | 1.89ms   | 2.63ms   | 2.98ms   | 60002.863738ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge | -A64m -n4m -AL4096m |                |    10 |             133.015 |                 0 | 74.35ms  | 76.02ms  | 77.13ms  | 60060.870737ms |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge | -A64m -n4m -AL4096m |                |    50 |            5529.16  |                 0 | 6.60ms   | 10.99ms  | 13.12ms  | 60571.964934ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge | -A64m -n4m -AL4096m |                |    50 |            6131.06  |                 0 | 7.48ms   | 12.00ms  | 13.44ms  | 60135.243223ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge | -A64m -n4m -AL4096m |                |    50 |            8851.1   |                 0 | 3.12ms   | 11.44ms  | 13.67ms  | 60004.076196ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge | -A64m -n4m -AL4096m |                |    50 |             319.445 |                 0 | 147.79ms | 199.98ms | 206.96ms | 60116.819333ms |
| v16.4     | k6/POSTBulk.js       | m5a.12xlarge | -A64m -n4m -AL4096m |                |   100 |            5355.53  |                 0 | 15.92ms  | 28.30ms  | 35.55ms  | 60582.038953ms |
| v16.4     | k6/POSTSingle.js     | m5a.12xlarge | -A64m -n4m -AL4096m |                |   100 |            8672.19  |                 0 | 5.75ms   | 23.00ms  | 27.17ms  | 60090.367979ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.12xlarge | -A64m -n4m -AL4096m |                |   100 |           11259.9   |                 0 | 5.51ms   | 19.15ms  | 23.94ms  | 60012.25821ms  |
| v16.4     | k6/GETAllEmbed.js    | m5a.12xlarge | -A64m -n4m -AL4096m |                |   100 |             309.268 |                 0 | 303.79ms | 366.11ms | 382.30ms | 60180.786442ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge |                     |                |    10 |            2100.93  |                 0 | 4.19ms   | 4.72ms   | 5.43ms   | 60390.284225ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge |                     |                |    10 |            3001.02  |                 0 | 2.97ms   | 3.89ms   | 4.00ms   | 60061.289767ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge |                     |                |    10 |            4612.94  |                 0 | 1.84ms   | 2.68ms   | 3.69ms   | 60005.348567ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge |                     |                |    10 |             131.485 |                 0 | 75.35ms  | 78.41ms  | 80.03ms  | 60052.502897ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge |                     |                |    50 |            5063.05  |                 0 | 7.40ms   | 13.75ms  | 15.93ms  | 60546.906735ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge |                     |                |    50 |            6069.42  |                 0 | 7.35ms   | 13.07ms  | 15.02ms  | 60078.214876ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge |                     |                |    50 |           10209.4   |                 0 | 2.97ms   | 10.19ms  | 12.18ms  | 60005.302374ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge |                     |                |    50 |             321.273 |                 0 | 147.86ms | 199.88ms | 206.61ms | 60098.423859ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge |                     |                |   100 |            5364.26  |                 0 | 16.37ms  | 29.10ms  | 33.43ms  | 60556.949847ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge |                     |                |   100 |            5685.62  |                 0 | 17.50ms  | 29.22ms  | 32.85ms  | 60079.848162ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge |                     |                |   100 |           10654.5   |                 0 | 5.60ms   | 17.96ms  | 22.04ms  | 60013.051764ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge |                     |                |   100 |             318.648 |                 0 | 302.41ms | 359.90ms | 369.32ms | 60179.341832ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge | -A64m -n4m          |                |    10 |            2125.98  |                 0 | 4.19ms   | 4.63ms   | 4.76ms   | 60263.436288ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge | -A64m -n4m          |                |    10 |            2958.61  |                 0 | 2.98ms   | 3.90ms   | 3.99ms   | 60073.105492ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge | -A64m -n4m          |                |    10 |            4503.32  |                 0 | 1.87ms   | 2.59ms   | 2.93ms   | 60020.889678ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge | -A64m -n4m          |                |    10 |             134.008 |                 0 | 73.88ms  | 75.94ms  | 77.57ms  | 60056.249093ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge | -A64m -n4m          |                |    50 |            5500.99  |                 0 | 6.68ms   | 11.43ms  | 13.91ms  | 60581.301163ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge | -A64m -n4m          |                |    50 |            6131.43  |                 0 | 7.42ms   | 12.08ms  | 13.65ms  | 60080.572683ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge | -A64m -n4m          |                |    50 |            8442.71  |                 0 | 3.28ms   | 11.84ms  | 14.34ms  | 60025.650776ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge | -A64m -n4m          |                |    50 |             322.711 |                 0 | 147.04ms | 199.50ms | 206.28ms | 60109.476504ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge | -A64m -n4m          |                |   100 |            5019.99  |                 0 | 17.54ms  | 32.40ms  | 41.73ms  | 60537.563848ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge | -A64m -n4m          |                |   100 |            6969.58  |                 0 | 9.28ms   | 28.56ms  | 33.73ms  | 60087.274234ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge | -A64m -n4m          |                |   100 |           12361.9   |                 0 | 4.39ms   | 19.66ms  | 26.30ms  | 60008.074434ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge | -A64m -n4m          |                |   100 |             319.312 |                 0 | 304.02ms | 360.49ms | 368.95ms | 60179.456815ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge | -A64m -n4m -AL2048m |                |    10 |            2120.66  |                 0 | 4.19ms   | 4.63ms   | 4.76ms   | 60263.785534ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge | -A64m -n4m -AL2048m |                |    10 |            2665.83  |                 0 | 3.11ms   | 4.06ms   | 4.19ms   | 60058.971568ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge | -A64m -n4m -AL2048m |                |    10 |            4006.34  |                 0 | 2.04ms   | 2.88ms   | 3.36ms   | 60002.431867ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge | -A64m -n4m -AL2048m |                |    10 |             133.972 |                 0 | 74.09ms  | 76.12ms  | 77.25ms  | 60072.425818ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge | -A64m -n4m -AL2048m |                |    50 |            5396.51  |                 0 | 6.83ms   | 11.39ms  | 13.42ms  | 60595.789299ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge | -A64m -n4m -AL2048m |                |    50 |            6109.45  |                 0 | 7.54ms   | 12.04ms  | 13.45ms  | 60079.341918ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge | -A64m -n4m -AL2048m |                |    50 |            7816.04  |                 0 | 3.50ms   | 12.28ms  | 14.53ms  | 60005.078545ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge | -A64m -n4m -AL2048m |                |    50 |             337.397 |                 0 | 139.87ms | 190.92ms | 197.67ms | 60107.267569ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge | -A64m -n4m -AL2048m |                |   100 |            5162.13  |                 0 | 16.91ms  | 29.86ms  | 36.19ms  | 60547.847334ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge | -A64m -n4m -AL2048m |                |   100 |            7733.71  |                 0 | 5.74ms   | 26.23ms  | 30.47ms  | 60097.063191ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge | -A64m -n4m -AL2048m |                |   100 |           13008     |                 0 | 4.48ms   | 17.44ms  | 23.10ms  | 60015.249449ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge | -A64m -n4m -AL2048m |                |   100 |             331.406 |              1001 | 288.29ms | 349.43ms | 365.89ms | 60170.948779ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge | -A64m -n4m -AL3072m |                |    10 |            2125.87  |                 0 | 4.17ms   | 4.62ms   | 4.74ms   | 60263.273943ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge | -A64m -n4m -AL3072m |                |    10 |            2591.81  |                 0 | 3.62ms   | 4.09ms   | 4.24ms   | 60070.76138ms  |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge | -A64m -n4m -AL3072m |                |    10 |            4297     |                 0 | 1.94ms   | 2.73ms   | 3.11ms   | 60002.568043ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge | -A64m -n4m -AL3072m |                |    10 |             132.952 |                83 | 74.46ms  | 76.33ms  | 77.68ms  | 60066.59121ms  |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge | -A64m -n4m -AL3072m |                |    50 |            5483.03  |                 0 | 6.71ms   | 11.09ms  | 12.95ms  | 60582.361851ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge | -A64m -n4m -AL3072m |                |    50 |            6092.39  |                 0 | 7.61ms   | 12.09ms  | 13.47ms  | 60088.53336ms  |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge | -A64m -n4m -AL3072m |                |    50 |            8550.18  |                 0 | 3.07ms   | 11.96ms  | 14.37ms  | 60008.203542ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge | -A64m -n4m -AL3072m |                |    50 |             332.632 |               812 | 140.67ms | 191.42ms | 198.00ms | 60120.439212ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge | -A64m -n4m -AL3072m |                |   100 |            5016.91  |                 0 | 17.64ms  | 29.67ms  | 36.13ms  | 60546.08956ms  |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge | -A64m -n4m -AL3072m |                |   100 |            7580.5   |                 0 | 5.75ms   | 26.79ms  | 31.09ms  | 60092.229591ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge | -A64m -n4m -AL3072m |                |   100 |           11799.2   |                 0 | 4.43ms   | 20.62ms  | 25.99ms  | 60009.609555ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge | -A64m -n4m -AL3072m |                |   100 |             323.783 |               927 | 289.40ms | 359.24ms | 386.89ms | 60182.233482ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge | -A64m -n4m -AL4096m |                |    10 |            2122.63  |                 0 | 4.17ms   | 4.63ms   | 4.79ms   | 60263.783482ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge | -A64m -n4m -AL4096m |                |    10 |            2546.71  |                 0 | 3.74ms   | 4.09ms   | 4.24ms   | 60071.315329ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge | -A64m -n4m -AL4096m |                |    10 |            4261.03  |                 0 | 1.95ms   | 2.73ms   | 3.11ms   | 60003.088306ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge | -A64m -n4m -AL4096m |                |    10 |             131.93  |                84 | 74.78ms  | 76.69ms  | 77.97ms  | 60077.169666ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge | -A64m -n4m -AL4096m |                |    50 |            5378.49  |                 0 | 6.83ms   | 11.35ms  | 13.38ms  | 60578.740134ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge | -A64m -n4m -AL4096m |                |    50 |            6137.9   |                 0 | 7.49ms   | 12.11ms  | 13.57ms  | 60091.25945ms  |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge | -A64m -n4m -AL4096m |                |    50 |            8618.98  |                 0 | 3.01ms   | 11.98ms  | 14.45ms  | 60009.795358ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge | -A64m -n4m -AL4096m |                |    50 |             335.588 |               612 | 140.89ms | 192.01ms | 198.37ms | 60106.520583ms |
| v16.4     | k6/POSTBulk.js       | m5a.16xlarge | -A64m -n4m -AL4096m |                |   100 |            4947.24  |                 0 | 17.48ms  | 30.32ms  | 38.94ms  | 60496.617849ms |
| v16.4     | k6/POSTSingle.js     | m5a.16xlarge | -A64m -n4m -AL4096m |                |   100 |            7587.7   |                 0 | 5.93ms   | 26.30ms  | 30.51ms  | 60172.494841ms |
| v16.4     | k6/GETSingleEmbed.js | m5a.16xlarge | -A64m -n4m -AL4096m |                |   100 |           12363.1   |                 0 | 4.48ms   | 19.29ms  | 25.19ms  | 60019.185198ms |
| v16.4     | k6/GETAllEmbed.js    | m5a.16xlarge | -A64m -n4m -AL4096m |                |   100 |             328.723 |               844 | 288.65ms | 349.29ms | 363.98ms | 60181.360731ms |