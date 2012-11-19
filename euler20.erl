-module(euler20).
-export([fact/1,stringToList/1,result/1]).

fact(N) ->
    fact(N,N).

fact(1,N) ->
    N;
fact(M,N)->
    fact(M-1,N*(M-1)).

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
                stringToList(lists:flatten(io_lib:format("~p",[fact(V)])))).
