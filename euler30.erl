%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%% Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

%% 1634 = 14 + 64 + 34 + 44
%% 8208 = 84 + 24 + 04 + 84
%% 9474 = 94 + 44 + 74 + 44
%% As 1 = 14 is not a sum it is not included.

%% The sum of these numbers is 1634 + 8208 + 9474 = 19316.

%% Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
%%% @end
%%% Created : 29 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler30).

-compile(export_all).

fifthPower(N) when is_integer(N) ->
    fifthPower(integer_to_list(N));
fifthPower(N) ->
    fifthPower(N,5).

fifthPower(N,Digit)->
  list_to_integer(N) ==  lists:foldl(fun(E,Sum) ->
                      math:pow(list_to_integer([E]),Digit) + Sum end,0,N).
    
main()->
    lists:foldl(fun(E,Sum)->
                        Check= fifthPower(integer_to_list(E),5),
                       if
                           Check ->
                               E + Sum;
                           true ->
                               Sum
                                   end end,0,lists:seq(2,354294)).
                           
