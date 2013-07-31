%%%-------------------------------------------------------------------
%%% @author jaejinyun <skplanet@jaejinmac.local>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created : 29 May 2013 by jaejinyun <skplanet@jaejinmac.local>
%%%-------------------------------------------------------------------
-module(euler33).

-compile(export_all).

find()->
    product([{A,B} || A <- lists:seq(10,99),
              B <-lists:seq(10,99),
              A / B < 1,
             length(lists:subtract(gb_sets:to_list(gb_sets:from_list(integer_to_list(A)++integer_to_list(B))),"0")) =:= 3,
             length(ordsets:intersection(ordsets:from_list(integer_to_list(A)),ordsets:from_list(integer_to_list(B)))) =:= 1,
             list_to_integer(lists:subtract(integer_to_list(A),ordsets:intersection(ordsets:from_list(integer_to_list(A)),ordsets:from_list(integer_to_list(B))))) / list_to_integer(lists:subtract(integer_to_list(B),ordsets:intersection(ordsets:from_list(integer_to_list(A)),ordsets:from_list(integer_to_list(B))))) =:= A / B
             ], {1,1}).
product([],{C,D})->
    {C,D};
product([{A,B}|T],{C,D})->
    product(T,{C*A,D*B}).
