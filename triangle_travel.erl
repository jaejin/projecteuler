%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%
%%% @end
%%% Created : 2 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(triangle_travel).

-export([main/1]).

main(F)->
    L=lists:reverse(tokens(string:tokens(binary_to_list(element(2,file:read_file(F))),"\n"))),
    travel(L,L).

tokens([])->
    [];
tokens([H|T]) ->
   [string:tokens(H," ")] ++ tokens(T).


travel(Return,[]) ->
    lists:flatten(Return);
travel([H|T],_) ->
    [H2|T2] = T,
    io:format("travel : H ~p H2 ~p ~n",[H,H2]),
    R = travel2(H,H2),
    io:format("T2 = ~p Result : ~p ~n",[T2,R]),
   travel([R]++T2,T2).
    
travel2(_,[])->
    [];
travel2([BH1|BT],[CH|CT])->
    [BH2|_] = BT,
    {BH2_Value,_} = string:to_integer(BH2),
    {BH1_Value,_} = string:to_integer(BH1),
    {CH_Value,_} = string:to_integer(CH),
    F = BH2_Value + CH_Value,
    S = BH1_Value + CH_Value,
    io:format("travel2 : F ~p S ~p BT ~p CT ~p ~n",[F,S,BT,CT]),
    if
        F > S ->
            io_lib:format("~p",[F]) ++ travel2(BT,CT);
        true ->
            io_lib:format("~p",[S]) ++ travel2(BT,CT)
   end.

