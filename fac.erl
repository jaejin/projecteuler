%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%
%%% @end
%%% Created : 2 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(fac).
-compile(export_all).

fac(0)->
    1;
fac(N) ->
    N * fac(N-1).

start()->
    N = 200000,
    Start = now(),
    factorial(N),
    End = now(),
    Runtime = timer:now_diff(End, Start) / 1000,
    Start2 = now(),
    fact(N),
    End2 = now(),
    Runtime2 = timer:now_diff(End2, Start2) / 1000,
    io:format("fac ~w~n", [N]),
    io:format("runtime1 is ~p~n runtime2 ~p~n", [Runtime,Runtime2]).
 
factorial(1)->1;
factorial(N)->N * factorial(N-1).   

fact(N)->
    fact(N,1).

fact(1,Result) ->
    Result;
fact(N,Result) -> fact(N-1,Result*N).

