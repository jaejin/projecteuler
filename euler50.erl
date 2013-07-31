%%%-------------------------------------------------------------------
%%% @author jaejinyun <spyrogira256@gmail.com>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created : 16 Apr 2013 by jaejinyun <spyrogira256@gmail.com>
%%%-------------------------------------------------------------------
-module(euler50).

-import(generatePrimes,[generatePrimes/1]).
-import(ordsets,[is_subset/2,subtract/2]).

-export([find/0,is_prime/1]).


find()->
   Primes = generatePrimes:generatePrimes(100),
   find(Primes,lists:last(Primes),1,2).

find(Primes,FindValue,Start,End) ->
    lists:sum(lists:sublist(Primes,Start,End))
        
