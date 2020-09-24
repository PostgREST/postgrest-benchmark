## t3anano

### reads

nixops ssh -d pgrst-bench client k6 run --summary-export=t3anano/reads/singleObject.json -e HOST=t3anano - < reads/singleObject.js

```
running (1m00.1s), 000/230 VUs, 82435 complete and 0 interrupted iterations
constant_request_rate ✓ [ 100% ] 230/230 VUs  1m0s  1400 iters/s


    data_received..............: 24 MB  398 kB/s
    data_sent..................: 8.5 MB 141 kB/s
    dropped_iterations.........: 1567   26.089441/s
  ✓ failed requests............: 0.00%  ✓ 0     ✗ 82435
    http_req_blocked...........: avg=70.96µs  min=1.23µs   med=3.22µs  max=1.5s    p(90)=4.4µs    p(95)=5.64µs
    http_req_connecting........: avg=65.22µs  min=0s       med=0s      max=1.5s    p(90)=0s       p(95)=0s
  ✓ http_req_duration..........: avg=59.21ms  min=877.15µs med=50.15ms max=2.15s   p(90)=118.21ms p(95)=133.97ms
    http_req_receiving.........: avg=106.66µs min=10.75µs  med=31.73µs max=50.79ms p(90)=69.89µs  p(95)=179.87µs
    http_req_sending...........: avg=234.48µs min=6.77µs   med=27.25µs max=74.21ms p(90)=53.03µs  p(95)=126.76µs
    http_req_tls_handshaking...: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s
    http_req_waiting...........: avg=58.87ms  min=841.46µs med=49.82ms max=2.15s   p(90)=117.85ms p(95)=133.33ms
    http_reqs..................: 82435  1372.484403/s
    iteration_duration.........: avg=59.43ms  min=967.43µs med=50.31ms max=2.15s   p(90)=118.39ms p(95)=134.18ms
    iterations.................: 82435  1372.484403/s
    vus........................: 230    min=106 max=230
    vus_max....................: 230    min=106 max=230
```

nixops ssh -d pgrst-bench client k6 run --summary-export=t3anano/reads/singleObject3LevEmbed.json -e HOST=t3anano - < reads/singleObject3LevEmbed.js

```
running (1m01.3s), 000/600 VUs, 27922 complete and 0 interrupted iterations
constant_request_rate ✓ [ 100% ] 600/600 VUs  1m0s  700 iters/s


    data_received..............: 341 MB 5.6 MB/s
    data_sent..................: 3.4 MB 56 kB/s
    dropped_iterations.........: 14079  229.719032/s
  ✓ failed requests............: 0.00%  ✓ 0     ✗ 27922
    http_req_blocked...........: avg=333.58µs min=1.35µs  med=3.49µs   max=628.75ms p(90)=5.7µs    p(95)=15.15µs
    http_req_connecting........: avg=320.43µs min=0s      med=0s       max=628.71ms p(90)=0s       p(95)=0s
  ✗ http_req_duration..........: avg=1.04s    min=7.53ms  med=795.25ms max=11.87s   p(90)=2.35s    p(95)=3.02s
    http_req_receiving.........: avg=158.09µs min=18.55µs med=53.45µs  max=34.06ms  p(90)=134.48µs p(95)=432.18µs
    http_req_sending...........: avg=195.36µs min=7.74µs  med=28.38µs  max=42.73ms  p(90)=52.69µs  p(95)=249.43µs
    http_req_tls_handshaking...: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s
    http_req_waiting...........: avg=1.04s    min=6.7ms   med=795.14ms max=11.87s   p(90)=2.35s    p(95)=3.02s
    http_reqs..................: 27922  455.587386/s
    iteration_duration.........: avg=1.04s    min=7.74ms  med=795.83ms max=11.87s   p(90)=2.35s    p(95)=3.02s
    iterations.................: 27922  455.587386/s
    vus........................: 600    min=115 max=600
    vus_max....................: 600    min=115 max=600
```

nixops ssh -d pgrst-bench client k6 run --summary-export=t3anano/reads/allObjects2LevEmbed.json -e HOST=t3anano - < reads/allObjects2LevEmbed.js

```
running (1m13.5s), 000/388 VUs, 2091 complete and 0 interrupted iterations
constant_request_rate ✓ [ 100% ] 388/388 VUs  1m0s  40 iters/s


    data_received..............: 1.7 GB 23 MB/s
    data_sent..................: 220 kB 3.0 kB/s
    dropped_iterations.........: 310    4.21723/s
  ✓ failed requests............: 0.00%  ✓ 0     ✗ 2091
    http_req_blocked...........: avg=101.45µs min=2.28µs   med=4.8µs   max=9.66ms  p(90)=411.16µs p(95)=550.33µs
    http_req_connecting........: avg=66.77µs  min=0s       med=0s      max=9.49ms  p(90)=298.47µs p(95)=319.91µs
  ✗ http_req_duration..........: avg=7.47s    min=71.63ms  med=5.69s   max=44.96s  p(90)=16.68s   p(95)=21.39s
    http_req_receiving.........: avg=1.21ms   min=283.33µs med=1.04ms  max=13.11ms p(90)=1.47ms   p(95)=1.89ms
    http_req_sending...........: avg=46.82µs  min=12.4µs   med=38.78µs max=5.93ms  p(90)=71.75µs  p(95)=84µs
    http_req_tls_handshaking...: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s
    http_req_waiting...........: avg=7.47s    min=69.62ms  med=5.68s   max=44.96s  p(90)=16.67s   p(95)=21.39s
    http_reqs..................: 2091   28.445898/s
    iteration_duration.........: avg=7.47s    min=73.2ms   med=5.69s   max=44.96s  p(90)=16.68s   p(95)=21.39s
    iterations.................: 2091   28.445898/s
    vus........................: 388    min=100 max=388
    vus_max....................: 388    min=100 max=388
```

### writes

nixops ssh -d pgrst-bench client k6 run --summary-export=t3anano/writes/singleObject.json -e HOST=t3anano - < writes/singleObject.js

```
running (1m00.3s), 000/580 VUs, 69521 complete and 0 interrupted iterations
constant_request_rate ✓ [ 100% ] 580/580 VUs  1m0s  1300 iters/s

    data_received..............: 39 MB 639 kB/s
    data_sent..................: 33 MB 546 kB/s
    dropped_iterations.........: 8480  140.564077/s
  ✓ failed requests............: 0.00% ✓ 0     ✗ 69521
    http_req_blocked...........: avg=56.5µs   min=1.46µs  med=3.42µs   max=253.3ms  p(90)=5.36µs   p(95)=11.83µs
    http_req_connecting........: avg=20.11µs  min=0s      med=0s       max=86.36ms  p(90)=0s       p(95)=0s
  ✓ http_req_duration..........: avg=258.06ms min=1.56ms  med=253.67ms max=861.37ms p(90)=408.69ms p(95)=453.34ms
    http_req_receiving.........: avg=605.67µs min=11.47µs med=28.27µs  max=289.91ms p(90)=82.88µs  p(95)=465.72µs
    http_req_sending...........: avg=9.07ms   min=10.24µs med=33.09µs  max=366.63ms p(90)=19.95ms  p(95)=66.32ms
    http_req_tls_handshaking...: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s
    http_req_waiting...........: avg=248.38ms min=1.49ms  med=248.81ms max=713.93ms p(90)=396.07ms p(95)=420.4ms
    http_reqs..................: 69522 1152.393369/s
    iteration_duration.........: avg=259.52ms min=1.98ms  med=255.07ms max=861.94ms p(90)=410.03ms p(95)=454.76ms
    iterations.................: 69521 1152.376793/s
    vus........................: 580   min=118 max=580
    vus_max....................: 580   min=118 max=580
```


nixops ssh -d pgrst-bench client k6 run --summary-export=t3anano/writes/bulk.json -e HOST=t3anano - < writes/bulk.js

```
running (1m01.8s), 000/162 VUs, 34471 complete and 0 interrupted iterations
constant_request_rate ✓ [ 100% ] 162/162 VUs  1m0s  600 iters/s


    █ teardown

    data_received..............: 5.1 MB 83 kB/s
    data_sent..................: 240 MB 3.9 MB/s
    dropped_iterations.........: 1529   24.724433/s
  ✓ failed requests............: 0.00%  ✓ 0     ✗ 34471
    http_req_blocked...........: avg=43.47µs  min=2.22µs  med=4.32µs  max=271.44ms p(90)=6.86µs   p(95)=12.97µs
    http_req_connecting........: avg=9.03µs   min=0s      med=0s      max=73.85ms  p(90)=0s       p(95)=0s
  ✓ http_req_duration..........: avg=52.96ms  min=2.15ms  med=15.24ms max=1.78s    p(90)=165.48ms p(95)=210.86ms
    http_req_receiving.........: avg=146.76µs min=11.57µs med=34.18µs max=161.05ms p(90)=62.53µs  p(95)=81.11µs
    http_req_sending...........: avg=10.24ms  min=24.33µs med=73.32µs max=237.11ms p(90)=43.83ms  p(95)=77.66ms
    http_req_tls_handshaking...: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s
    http_req_waiting...........: avg=42.57ms  min=2.06ms  med=13.87ms max=1.78s    p(90)=136.84ms p(95)=177.45ms
    http_reqs..................: 34472  557.423585/s
    iteration_duration.........: avg=54.72ms  min=3.05ms  med=16.62ms max=1.78s    p(90)=168.17ms p(95)=214.06ms
    iterations.................: 34471  557.407415/s
    vus........................: 0      min=0   max=162
    vus_max....................: 162    min=101 max=162
```

nixops ssh -d pgrst-bench client k6 run --summary-export=t3anano/writes/bulkWColumns.json -e HOST=t3anano - < writes/bulkWColumns.js

```
running (1m01.9s), 000/215 VUs, 35666 complete and 0 interrupted iterations
constant_request_rate ✓ [ 100% ] 215/215 VUs  1m0s  700 iters/s


    █ teardown

    data_received..............: 5.3 MB 86 kB/s
    data_sent..................: 252 MB 4.1 MB/s
    dropped_iterations.........: 6336   102.374101/s
  ✓ failed requests............: 0.00%  ✓ 0     ✗ 35666
    http_req_blocked...........: avg=265.35µs min=2.05µs  med=4.12µs  max=1.19s    p(90)=6.93µs   p(95)=12.89µs
    http_req_connecting........: avg=138.66µs min=0s      med=0s      max=1.15s    p(90)=0s       p(95)=0s
  ✓ http_req_duration..........: avg=76.13ms  min=1.73ms  med=5.69ms  max=4.14s    p(90)=209.85ms p(95)=279.57ms
    http_req_receiving.........: avg=351.75µs min=12.35µs med=33.24µs max=218.81ms p(90)=61.65µs  p(95)=87.18µs
    http_req_sending...........: avg=23.52ms  min=24.55µs med=70.6µs  max=406.44ms p(90)=110.26ms p(95)=170.75ms
    http_req_tls_handshaking...: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s
    http_req_waiting...........: avg=52.26ms  min=1.67ms  med=5.38ms  max=4.14s    p(90)=118.25ms p(95)=163.4ms
    http_reqs..................: 35667  576.29057/s
    iteration_duration.........: avg=78.76ms  min=2.57ms  med=6.77ms  max=4.14s    p(90)=213.83ms p(95)=282.7ms
    iterations.................: 35666  576.274412/s
    vus........................: 0      min=0   max=214
    vus_max....................: 215    min=104 max=215
```

## t2nano

### reads

nixops ssh -d pgrst-bench client k6 run --summary-export=t2nano/reads/singleObject.json -e HOST=t2nano - < reads/singleObject.js

```
running (1m01.9s), 000/529 VUs, 63055 complete and 0 interrupted iterations
constant_request_rate ✓ [ 100% ] 529/529 VUs  1m0s  1100 iters/s


    data_received..............: 18 MB  295 kB/s
    data_sent..................: 6.4 MB 104 kB/s
    dropped_iterations.........: 2946   47.564322/s
  ✓ failed requests............: 0.00%  ✓ 0     ✗ 63055
    http_req_blocked...........: avg=41.26µs  min=1.19µs  med=3.3µs    max=1.76s    p(90)=4.85µs   p(95)=7.82µs
    http_req_connecting........: avg=34.96µs  min=0s      med=0s       max=1.76s    p(90)=0s       p(95)=0s
  ✓ http_req_duration..........: avg=292.38ms min=1.23ms  med=273.83ms max=4.11s    p(90)=435.24ms p(95)=461.19ms
    http_req_receiving.........: avg=162.01µs min=11.56µs med=29µs     max=150.47ms p(90)=81.93µs  p(95)=398.48µs
    http_req_sending...........: avg=812.89µs min=7.39µs  med=27.29µs  max=152.06ms p(90)=71.39µs  p(95)=444.34µs
    http_req_tls_handshaking...: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s
    http_req_waiting...........: avg=291.41ms min=1.17ms  med=273.21ms max=4.11s    p(90)=434.5ms  p(95)=460.13ms
    http_reqs..................: 63055  1018.047624/s
    iteration_duration.........: avg=292.61ms min=1.39ms  med=274.02ms max=4.11s    p(90)=435.52ms p(95)=461.38ms
    iterations.................: 63055  1018.047624/s
    vus........................: 529    min=110 max=529
    vus_max....................: 529    min=110 max=529
```

nixops ssh -d pgrst-bench client k6 run --summary-export=t2nano/reads/singleObject3LevEmbed.json -e HOST=t2nano - < reads/singleObject3LevEmbed.js

```
running (1m01.3s), 000/600 VUs, 25511 complete and 0 interrupted iterations
constant_request_rate ✓ [ 100% ] 600/600 VUs  1m0s  500 iters/s


    data_received..............: 312 MB 5.1 MB/s
    data_sent..................: 3.1 MB 50 kB/s
    dropped_iterations.........: 4490   73.192303/s
  ✓ failed requests............: 0.00%  ✓ 0     ✗ 25511
    http_req_blocked...........: avg=28.96µs  min=1.45µs  med=2.84µs  max=44.13ms p(90)=5.43µs   p(95)=15.65µs
    http_req_connecting........: avg=17.91µs  min=0s      med=0s      max=22.48ms p(90)=0s       p(95)=0s
  ✗ http_req_duration..........: avg=1.01s    min=20.96ms med=1.1s    max=1.57s   p(90)=1.53s    p(95)=1.54s
    http_req_receiving.........: avg=140.05µs min=18.86µs med=96.32µs max=21.89ms p(90)=173.87µs p(95)=373.84µs
    http_req_sending...........: avg=83.61µs  min=7.23µs  med=26.2µs  max=23.31ms p(90)=49.26µs  p(95)=67.6µs
    http_req_tls_handshaking...: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s
    http_req_waiting...........: avg=1.01s    min=20.83ms med=1.1s    max=1.57s   p(90)=1.53s    p(95)=1.54s
    http_reqs..................: 25511  415.859432/s
    iteration_duration.........: avg=1.01s    min=21.15ms med=1.1s    max=1.57s   p(90)=1.53s    p(95)=1.54s
    iterations.................: 25511  415.859432/s
    vus........................: 600    min=100 max=600
    vus_max....................: 600    min=100 max=600
```

nixops ssh -d pgrst-bench client k6 run --summary-export=t2nano/reads/allObjects2LevEmbed.json -e HOST=t2nano - < reads/allObjects2LevEmbed.js

```
running (1m19.8s), 000/487 VUs, 1939 complete and 0 interrupted iterations
constant_request_rate ✓ [ 100% ] 487/487 VUs  1m0s  40 iters/s


    data_received..............: 1.6 GB 20 MB/s
    data_sent..................: 202 kB 2.5 kB/s
    dropped_iterations.........: 462    5.78901/s
  ✓ failed requests............: 0.00%  ✓ 0     ✗ 1939
    http_req_blocked...........: avg=22.94ms min=2.34µs  med=4.82µs  max=2.73s  p(90)=894.61µs p(95)=2.7ms
    http_req_connecting........: avg=22.89ms min=0s      med=0s      max=2.73s  p(90)=656.53µs p(95)=2.23ms
  ✗ http_req_duration..........: avg=10.62s  min=85.61ms med=10.55s  max=19.9s  p(90)=17.97s   p(95)=18.84s
    http_req_receiving.........: avg=54.19ms min=5.7ms   med=28.08ms max=5.61s  p(90)=71.58ms  p(95)=88.52ms
    http_req_sending...........: avg=64.55µs min=10.19µs med=38.65µs max=2.92ms p(90)=76.55µs  p(95)=95.54µs
    http_req_tls_handshaking...: avg=0s      min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s
    http_req_waiting...........: avg=10.56s  min=73.27ms med=10.46s  max=19.73s p(90)=17.92s   p(95)=18.78s
    http_reqs..................: 1939   24.2963/s
    iteration_duration.........: avg=10.64s  min=86.93ms med=10.59s  max=19.9s  p(90)=17.97s   p(95)=18.84s
    iterations.................: 1939   24.2963/s
    vus........................: 487    min=100 max=487
    vus_max....................: 487    min=100 max=487
```

### writes

nixops ssh -d pgrst-bench client k6 run --summary-export=t2nano/writes/singleObject.json -e HOST=t2nano - < writes/singleObject.js

```
running (1m00.2s), 000/557 VUs, 55925 complete and 0 interrupted iterations
constant_request_rate ✓ [ 100% ] 557/557 VUs  1m0s  1000 iters/s


    █ teardown

    data_received..............: 31 MB 515 kB/s
    data_sent..................: 26 MB 439 kB/s
    dropped_iterations.........: 4078  67.72637/s
  ✓ failed requests............: 0.00% ✓ 0     ✗ 55925
    http_req_blocked...........: avg=33.09µs  min=1.68µs  med=3.78µs   max=155.89ms p(90)=5.92µs   p(95)=12.5µs
    http_req_connecting........: avg=17.66µs  min=0s      med=0s       max=110.71ms p(90)=0s       p(95)=0s
  ✓ http_req_duration..........: avg=315.39ms min=2.62ms  med=320.2ms  max=824.4ms  p(90)=513.39ms p(95)=536.1ms
    http_req_receiving.........: avg=260.27µs min=12.13µs med=33.02µs  max=212.65ms p(90)=85.86µs  p(95)=473.65µs
    http_req_sending...........: avg=3.4ms    min=11.08µs med=34.99µs  max=378.14ms p(90)=708.39µs p(95)=13.26ms
    http_req_tls_handshaking...: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s
    http_req_waiting...........: avg=311.72ms min=2.54ms  med=316.05ms max=619.08ms p(90)=509.93ms p(95)=532.96ms
    http_reqs..................: 55926 928.804556/s
    iteration_duration.........: avg=315.89ms min=3.1ms   med=320.57ms max=825.28ms p(90)=514.11ms p(95)=536.62ms
    iterations.................: 55925 928.787948/s
    vus........................: 556   min=107 max=556
    vus_max....................: 556   min=107 max=556
```

nixops ssh -d pgrst-bench client k6 run --summary-export=t2nano/writes/bulk.json -e HOST=t2nano - < writes/bulk.js

```
running (1m02.7s), 000/176 VUs, 34516 complete and 0 interrupted iterations
constant_request_rate ✓ [ 100% ] 176/176 VUs  1m0s  600 iters/s


    █ teardown

    data_received..............: 5.1 MB 82 kB/s
    data_sent..................: 240 MB 3.8 MB/s
    dropped_iterations.........: 1485   23.698134/s
  ✓ failed requests............: 0.00%  ✓ 0     ✗ 34516
    http_req_blocked...........: avg=49.15µs  min=2.03µs  med=3.69µs  max=185.99ms p(90)=5.59µs   p(95)=12.01µs
    http_req_connecting........: avg=13.67µs  min=0s      med=0s      max=59.86ms  p(90)=0s       p(95)=0s
  ✓ http_req_duration..........: avg=61.61ms  min=2.4ms   med=6.92ms  max=2.6s     p(90)=196.81ms p(95)=237.23ms
    http_req_receiving.........: avg=122.67µs min=11.83µs med=31.8µs  max=171.17ms p(90)=56.98µs  p(95)=66.72µs
    http_req_sending...........: avg=8.05ms   min=24.92µs med=58.55µs max=194.09ms p(90)=31.95ms  p(95)=60.61ms
    http_req_tls_handshaking...: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s
    http_req_waiting...........: avg=53.44ms  min=2.32ms  med=6.7ms   max=2.6s     p(90)=179.56ms p(95)=214.18ms
    http_reqs..................: 34517  550.833996/s
    iteration_duration.........: avg=63.31ms  min=3.14ms  med=7.99ms  max=2.61s    p(90)=199.31ms p(95)=239.56ms
    iterations.................: 34516  550.818038/s
    vus........................: 0      min=0   max=176
    vus_max....................: 176    min=103 max=176
```

nixops ssh -d pgrst-bench client k6 run --summary-export=t2nano/writes/bulkWColumns.json -e HOST=t2nano - < writes/bulkWColumns.js

```
running (1m02.5s), 000/216 VUs, 37644 complete and 0 interrupted iterations
constant_request_rate ✓ [ 100% ] 216/216 VUs  1m0s  700 iters/s


    █ teardown

    data_received..............: 5.6 MB 90 kB/s
    data_sent..................: 266 MB 4.3 MB/s
    dropped_iterations.........: 4357   69.752168/s
  ✓ failed requests............: 0.00%  ✓ 0     ✗ 37644
    http_req_blocked...........: avg=169.84µs min=1.72µs  med=3.93µs  max=337.55ms p(90)=5.93µs   p(95)=12.83µs
    http_req_connecting........: avg=61.32µs  min=0s      med=0s      max=160.34ms p(90)=0s       p(95)=0s
  ✓ http_req_duration..........: avg=83.8ms   min=1.97ms  med=47.93ms max=2.4s     p(90)=231.83ms p(95)=285.32ms
    http_req_receiving.........: avg=341.17µs min=11.78µs med=31.89µs max=215.42ms p(90)=59.17µs  p(95)=79.92µs
    http_req_sending...........: avg=21.17ms  min=23.44µs med=58.88µs max=371.76ms p(90)=104.85ms p(95)=153.89ms
    http_req_tls_handshaking...: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s
    http_req_waiting...........: avg=62.29ms  min=1.89ms  med=38.24ms max=2.4s     p(90)=160.36ms p(95)=206.73ms
    http_reqs..................: 37645  602.667052/s
    iteration_duration.........: avg=86.16ms  min=2.75ms  med=51.85ms max=2.4s     p(90)=234.24ms p(95)=287.7ms
    iterations.................: 37644  602.651043/s
    vus........................: 0      min=0   max=216
    vus_max....................: 216    min=102 max=216
```
