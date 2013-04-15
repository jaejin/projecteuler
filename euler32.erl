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

-export([find/0]).

find()->
    find(1,1111,[]).
find(A,B,L)  ->
   C= A*B,
    case lists:sort(integer_to_list(A) ++ integer_to_list(B) ++  integer_to_list(C)) =:= PANDI of
        find(A+.
    lists:sort(integer_to_list(39) ++ integer_to_list(186) ++ integer_to_list(7254)) =:= ?PANDI.
    
    
