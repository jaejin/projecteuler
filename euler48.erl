%
% problem 48
% author jaejin
-module(euler48).
-export([result/0,series/1,pow/2]).
-import(util).

series(N) ->
    series(N,0).

series(1,Sum) ->
    Sum+1;
series(N,Sum) ->
    series(N-1,pow(N,N)+Sum).

pow(N,M) ->
    pow2(N,M,M).

pow2(1,_,R) ->
    R;
pow2(N,M,R) ->
    pow2(N-1,M,R*M).

result() ->
    series(1000).
