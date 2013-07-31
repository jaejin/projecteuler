%%%-------------------------------------------------------------------
%%% @author jaejinyun <skplanet@jaejinmac.local>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created : 26 Jul 2013 by jaejinyun <skplanet@jaejinmac.local>
%%%-------------------------------------------------------------------
-module(euler37).

-export([find/0,truncatePrime/3,dict_from_list/1]).

dict_from_list([H|T])->
    Dict = dict:new(),
   dict_from_list(T,dict:append(integer_to_list(H),H,Dict)).
dict_from_list([],Dict)->
    Dict;
dict_from_list([H|T],Dict) ->
   dict_from_list(T,dict:append(integer_to_list(H),H,Dict)).


find()->
    Primes = lists:reverse(generatePrimes:generatePrimes(1000000)),
    find(Primes,dict_from_list(Primes),[]).

find([H|T],PrimesDict,Total) ->
    HLength = length(integer_to_list(H)),
    if  HLength > 1 ->
            P = integer_to_list(H),
            ReverseP= lists:reverse(P),
            RightResult = truncatePrime(ReverseP,PrimesDict,right),
            LeftResult = truncatePrime(P,PrimesDict,left),
            if
                RightResult,LeftResult ->
                    find(T,PrimesDict,Total++[H]);
                true ->
                    find(T,PrimesDict,Total)
            end;
       true ->
            Total
    end.

reverse(left,L)->
    L;
reverse(right,L) ->
    lists:reverse(L).

truncatePrime([_|T],PrimesDict,Direction)->
    truncatePrime(T,PrimesDict,dict:is_key(reverse(Direction,T),PrimesDict),Direction).
truncatePrime([_|T],PrimesDict,true,Direction)  ->
    TailLength = length(T),
    if
        TailLength > 0 ->
            truncatePrime(T,PrimesDict,dict:is_key(reverse(Direction,T),PrimesDict),Direction);
        true ->
            true
    end;
truncatePrime(_,_PrimesDict,false,_Direction) ->
    false.
