-module(euler53).
-author('spyrogira256@gmail.com').

-export([result/0,combination/2,fac/1,combinationMather/3]).

result()->
    result(1,100).

result(Start,End) ->
 length(lists:filter(fun(X)-> X > 1000000 end,lists:flatten(lists:map(fun(X) -> exceed(X,1,[]) end, lists:seq(Start,End))))).


exceed(Start,Current,Result) when Start =:= Current ->
    Result;
exceed(Start,Current,Result) ->
    exceed(Start,Current+1,Result++[combination(Start,Current-1)]).



combination(N,R) when N =:= R ->
    1;
combination(N,R) when R =:= 1 ->
    N;
combination(N,R)->
    combinationMather(N,N-R,1) div fac(R).


combinationMather(N,R,Result) when N =< R ->
    Result;
combinationMather(N,R,Result) when N > R ->
    combinationMather(N-1,R,Result*N).

fac(0)->
    1;
fac(1)->
    1;
fac(2)->
    2;
fac(N)->
    fac(N,1).

fac(0,Result)->
    Result;
fac(N,Result) ->
    fac(N-1,Result*N).
