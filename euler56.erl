%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%A googol (10100) is a massive number: one followed by one-hundred zeros; 100100 is almost u%% nimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

%% Considering natural numbers of the form, ab, where a, b  100, what is the maximum digital sum?
%%% @end
%%% Created : 30 Mar 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler56).

-compile(export_all).

result()->
    result(1,99).

result(Start,End)->
    lists:foldl(fun(X,Max) ->
                        Result = lists:foldl(fun(E,Sum)->
                                                    Sum + (E-48) end,0,integer_to_list(X)),
                        if Result > Max ->
                                Result;
                           true ->
                                Max end
                end,0,
    lists:flatten(lists:map(fun(A)->
                      lists:map(fun(B)->fastexpt(A,B) end,lists:seq(Start,End))
                          end, lists:seq(Start,End)))).


fastexpt(_A,0)->
    1;
fastexpt(A,B) when B rem 2 =:= 0->
    fastexpt(A,B div 2)*fastexpt(A,B div 2);
fastexpt(A,B) ->
    fastexpt(A,B-1)*A.
