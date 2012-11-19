-module(euler25).
-author('spyrogira256@gmail.com').

-export([result/0,fibo/1]).

result() ->
    fiboCount(12).

fibo(1)->
    1;
fibo(2)->
    1;
fibo(N) ->
    fibo(1,0,N).

fibo(_,Sum,0)->
    Sum;
fibo(N,Sum,Count) ->
    fibo(N+Sum,N,Count-1).

fiboCount(N)->
    Result = fibo(N),
    Count = length(integer_to_list(Result)),
    if 
        Count >= 1000 ->
            N;
        true ->
            fiboCount(N+1)
    end.
