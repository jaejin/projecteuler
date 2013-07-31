%%%-------------------------------------------------------------------
%%% @author jaejinyun <skplanet@jaejinmac.local>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created : 30 Jul 2013 by jaejinyun <skplanet@jaejinmac.local>
%%%-------------------------------------------------------------------
-module(euler55).

-export([main/0,isLychreNumber/1]).

palindrome(N)->
    L = integer_to_list(N),
    L =:= lists:reverse(L).

main()->
    find(lists:seq(10,10001)).

find(L)->
    find(L,[]).

find([],Result)->
    Result;
find([H|T],Result) ->
    LychreNResult =  isLychreNumber(H),
    if
        LychreNResult->
            find(T,Result ++[H]);
        true ->
            find(T,Result)
    end.

isLychreNumber(H)->
    Sum = H + list_to_integer(lists:reverse(integer_to_list(H))),
    isLychreNumber(Sum,1,palindrome(Sum)).

isLychreNumber(_N,51,_Boolean)->
    true;
isLychreNumber(_N,_Count,true) ->
    false;
isLychreNumber(N,Count,false) ->
    Sum = N + list_to_integer(lists:reverse(integer_to_list(N))),
    isLychreNumber(Sum,Count+1,palindrome(Sum)).
    
                         
