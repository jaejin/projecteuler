%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%
%%% @end
%%% Created : 31 Jan 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler17).
-compile(export_all).

main()->
    count(lists:seq(1,5)).

count([])->
    0;
count([H|T]) ->
    io:format("~p~n",[H]),
   num_to_string(H) + count(T).

num_to_string(0) ->
    0;
num_to_string(1000) ->
    11;
num_to_string(N) when N >= 100 ->
    Mod = (N div 100),
    if 
        Mod =:= 1 ->
           Result = find_value(100) + 3 + num_to_string(N rem 100),
                if 
                    N rem 100 =:= 0 ->
                        Result;
                    true->
                        Result+3
                end;
        true ->
            Result = find_value(100) + find_value(Mod) + num_to_string(N rem 100),
        
                if 
                    N rem 100 =:= 0 ->
                        Result;
                    true->
                        Result+3
                end
    end;
num_to_string(N) when N >= 20 ->
    Mod = (N div 10),
   find_value(10*Mod) + num_to_string(N rem 10);
num_to_string(N)  ->
    find_value(N).

            

find_value(N)->
    NewList = [{1,3},{2,3},{3,5},{4,4},{5,4},{6,3},{7,5},{8,5},{9,4},{10,3},{11,6},{12,6},{13,8},{14,8},{15,7},{16,7},{17,9},{18,8},{19,8},{20,6},{30,6},{40,5},{50,5},{60,5},{70,7},{80,6},{90,6},{100,7}],
    case lists:keysearch(N, 1, NewList) of
        false ->
            notfound;
        {value,{_Key, _Value}} ->
            _Value
    end.


  
