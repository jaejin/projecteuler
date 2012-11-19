%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%% project euler 9 
%%% a = n^2 - m^2
%%% b = 2*n*m
%%% c = n^2 + m^2
%%% @end
%%% Created : 30 Jan 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler9).
-author('jaejin').
-export([pyth1/1]).

pyth1(N) ->
   [{A,B,C} ||
       A <- lists:seq(1,N-2),
       B <- lists:seq(A+1,N-1),
       C <- lists:seq(B+1,N),
       A+B+C =:= N,
       A*A+B*B == C*C ].


 

