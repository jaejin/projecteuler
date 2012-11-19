%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%
%%% @end
%%% Created : 1 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler22).
-compile(export_all).

main()->
   sum(qsort:qsort(load("names.txt")),1).

load(F)->
  string:tokens(util:gsub(util:gsub(binary_to_list(element(2,file:read_file(F))),"\n",","),"\"",""),",").


name_to_num(S)->
    name_to_num(S,1,0).

name_to_num(S,N,Result) when N =:= length(S) ->
    Result + lists:nth(N,S)-64;
name_to_num(S,N,Result) ->
    name_to_num(S,N+1,Result+lists:nth(N,S)-64).

sum([],_)->
    0;
sum([L|T],N)->
    name_to_num(L)*N + sum(T,N+1).


