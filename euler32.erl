%%%-------------------------------------------------------------------
%%% @author jaejinyun <spyrogira256@gmail.com>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created : 15 Apr 2013 by jaejinyun <spyrogira256@gmail.com>
%%%-------------------------------------------------------------------
-module(euler32).

-define(PANDI,"123456789").

-import(combination,[combos/1]).
-export([find/0]).

find()->
   lists:sum(gb_sets:to_list(gb_sets:from_list([A*B || A <- lists:seq(10,99), B<- lists:seq(100,999), lists:sort(integer_to_list(A) ++ integer_to_list(B) ++ integer_to_list(A*B)) =:= "123456789"]++ [A*B || A <- lists:seq(1,9), B<- lists:seq(1000,9999),length(integer_to_list(A*B)) < 5, lists:sort(integer_to_list(A) ++ integer_to_list(B) ++ integer_to_list(A*B)) =:= "123456789"]))).
    
    
