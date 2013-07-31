%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%% 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

%% Find the sum of all numbers which are equal to the sum of the factorial of their digits.

%% Note: as 1! = 1 and 2! = 2 are not sums they are not included.
%%% @end
%%% Created : 29 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler34).
-compile(export_all).

word_to_fact(N) when is_integer(N) ->
    word_to_fact(integer_to_list(N));
word_to_fact(N) ->
    Result = fact(lists:max(N)-48) < N,
    if
        Result ->
            list_to_integer(N) == lists:foldl(fun(E,Sum)->
                                                      fact(list_to_integer([E])) +Sum end,0,N);
        true ->
            false
    end.
fact(0)->
    1;
fact(1)->
    1;
fact(2)->
    2;
fact(3) ->
    6;
fact(4) ->
    24;
fact(5) ->
    120;
fact(6) ->
    720;
fact(7)->
    5040;
fact(8) ->
    40320;
fact(9) ->
    362880.

main()->
    lists:foldl(fun(E,Sum)->
                      Check = word_to_fact(E),
                        if
                            Check->
                                E + Sum;
                            true ->
                                Sum 
                       end 
                            end,0,lists:seq(3,50000)).
