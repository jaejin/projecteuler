%
% project euler problem 16
% author jaejin

-module(poweroftwo).
-export([pow2/1,result/1]).


pow2(N) ->
    pow2(N,2).

pow2(1,N) ->
    N;
pow2(N,V) ->
    pow2(N-1,V+V).

stringToList(S)->
    stringToList(S,1,[]).

stringToList(S,N,L) when N == length(S) ->
    L ++ [list_to_integer(string:substr(S,N,1))];
stringToList(S,N,L) ->
    stringToList(S,N+1,L ++ [list_to_integer(string:substr(S,N,1))]).

result(V)->
    lists:foldl(fun(X,Sum) ->
                        X + Sum 
                            end, 
                0, 
                stringToList(lists:flatten(io_lib:format("~p",[pow2(V)])))).
