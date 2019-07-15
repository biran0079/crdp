# crdp
[![PyPI version](https://badge.fury.io/py/crdp.svg)](https://badge.fury.io/py/crdp)

Cython implementation of Ramer-Douglas-Peucker algorithm.

## Usage
```
pip install crdp
```

```python
In [1]: from crdp import rdp

In [2]: rdp([[1,1],[2,3],[3,3],[4,4]], 0.8)
Out[2]: [[1, 1], [4, 4]]

In [3]: rdp([[1,1],[2,3],[3,3],[4,4]], 0.7)
Out[3]: [[1, 1], [2, 3], [4, 4]]
```

## Performance
Over 100x faster than python native implementation on large data.

10k random points can be processed in a few milliseconds. 

```
$ python3 benchmark.py
rdp 100 points, epsilon=0, duration 28.990745544433594 ms
crdp 100 points, epsilon=0, duration 0.0 ms
rdp 100 points, epsilon=0.01, duration 35.98904609680176 ms
crdp 100 points, epsilon=0.01, duration 0.0 ms
rdp 100 points, epsilon=0.1, duration 35.98833084106445 ms
crdp 100 points, epsilon=0.1, duration 0.0 ms
rdp 100 points, epsilon=0.5, duration 21.99268341064453 ms
crdp 100 points, epsilon=0.5, duration 0.0 ms
rdp 100 points, epsilon=1, duration 3.9980411529541016 ms
crdp 100 points, epsilon=1, duration 0.0 ms
rdp 1000 points, epsilon=0, duration 489.84360694885254 ms
crdp 1000 points, epsilon=0, duration 1.0001659393310547 ms
rdp 1000 points, epsilon=0.01, duration 513.8356685638428 ms
crdp 1000 points, epsilon=0.01, duration 0.0 ms
rdp 1000 points, epsilon=0.1, duration 470.84927558898926 ms
crdp 1000 points, epsilon=0.1, duration 0.9999275207519531 ms
rdp 1000 points, epsilon=0.5, duration 497.84135818481445 ms
crdp 1000 points, epsilon=0.5, duration 0.0 ms
rdp 1000 points, epsilon=1, duration 42.986392974853516 ms
crdp 1000 points, epsilon=1, duration 0.9999275207519531 ms
rdp 10000 points, epsilon=0, duration 7042.751789093018 ms
crdp 10000 points, epsilon=0, duration 5.997896194458008 ms
rdp 10000 points, epsilon=0.01, duration 6574.901103973389 ms
crdp 10000 points, epsilon=0.01, duration 4.998445510864258 ms
rdp 10000 points, epsilon=0.1, duration 6856.811046600342 ms
crdp 10000 points, epsilon=0.1, duration 4.998683929443359 ms
rdp 10000 points, epsilon=0.5, duration 6256.002902984619 ms
crdp 10000 points, epsilon=0.5, duration 3.998994827270508 ms
rdp 10000 points, epsilon=1, duration 407.8691005706787 ms
crdp 10000 points, epsilon=1, duration 1.9996166229248047 ms
```
