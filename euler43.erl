
%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%The number, 1406357289, is a 0 to 9 pandigital number because %% it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

%% Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

%% d2d3d4=406 is divisible by 2
%% d3d4d5=063 is divisible by 3
%% d4d5d6=635 is divisible by 5
%% d5d6d7=357 is divisible by 7
%% d6d7d8=572 is divisible by 11
%% d7d8d9=728 is divisible by 13
%% d8d9d10=289 is divisible by 17
%% Find the sum of all 0 to 9 pandigital numbers with this property.
%%% @end
%%% Created : 13 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler43).
-compile(export_all).

primes(N)->
    lists:nth(N,[1,2,3,5,7,11,13,17]).

divide_prop(L)->
    divide_prop(L,2).
divide_prop(L,8) ->
    list_to_integer(string:substr(L,8,3)) rem primes(8) =:= 0;
divide_prop(L,N) ->
    Result = list_to_integer(string:substr(L,N,3)) rem primes(N) =:= 0,
    if 
        Result->
            divide_prop(L,N+1);
        true ->
            false
     end.

main(L)->
  lists:foldl(fun(E,Sum)-> list_to_integer(E) + Sum end,0, lists:filter(fun(E)-> divide_prop(E) end, perms:perms(L))).
