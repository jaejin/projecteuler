%%%-------------------------------------------------------------------
%%% @author jaejinyun <skplanet@jaejinmac.local>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created : 30 Jul 2013 by jaejinyun <skplanet@jaejinmac.local>
%%%-------------------------------------------------------------------
-module(euler46).

-export([odd/1]).
dict_from_list([H|T])->
    Dict = dict:new(),
   dict_from_list(T,dict:append(integer_to_list(H),H,Dict)).
dict_from_list([],Dict)->
    Dict;
dict_from_list([H|T],Dict) ->
   dict_from_list(T,dict:append(integer_to_list(H),H,Dict)).


primeDict()->
    Primes = lists:reverse(generatePrimes:generatePrimes(10000)),
    dict_from_list(Primes).

                         
