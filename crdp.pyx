from libc.stdlib cimport malloc, free
from libc.string cimport memset

cdef extern from "math.h":
    double sqrt(double theta)

cdef _c_rdp(double *x, double *y, int n, char* mask, double epsilon):
    stk = [(0, n - 1)]
    cdef int st, ed, index
    cdef double dmax, p0, p1, p2,dis 
    while stk:
        st, ed = stk.pop()
        dis = sqrt((y[st]-y[ed]) * (y[st]-y[ed]) + (x[st]-x[ed]) * (x[st]-x[ed]))
        p0 = y[st] - y[ed]
        p1 = x[st] - x[ed]
        p2 = x[st] * y[ed] - y[st] * x[ed]
        dmax = 0.0
        index = st
        for i from st < i < ed:
            d = abs(p0 * x[i] - p1 * y[i] + p2) / dis
            if d > dmax:
                index = i
                dmax = d
        if dmax > epsilon:
            stk.append((st, index))
            stk.append((index, ed))
        else:
            for i from st < i < ed:
                mask[i] = 0

def rdp(points, double epsilon=0):
    cdef int n
    n = len(points)
    cdef double *x = <double*> malloc(n * sizeof(double))
    cdef double *y = <double*> malloc(n * sizeof(double))
    cdef char *mask = <char*> malloc(n)
    memset(mask, 1, n)
    for i from 0<=i<n:
        p = points[i]
        x[i] = p[0]
        y[i] = p[1]
    _c_rdp(x, y, n, mask, epsilon)
    res = []
    for i from 0<=i<n:
        if mask[i]:
            res.append(points[i])
    free(x)
    free(y)
    return res