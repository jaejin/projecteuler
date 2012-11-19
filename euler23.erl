%%%-------------------------------------------------------------------
%%% @author desktop <jaejin@ubuntu>
%%% @copyright (C) 2012, desktop
%%% @doc
%%%
%%% @end
%%% Created : 29 Apr 2012 by desktop <jaejin@ubuntu>
%%%-------------------------------------------------------------------
-module(euler23).
-compile(export_all).

divisor(1,_Divisor,Result) ->
     gb_sets:to_list(gb_sets:from_list(Result));
divisor(N,Divisor,Result) when N rem Divisor =:= 0 ->
    divisor(N div Divisor,Divisor,Result++lists:map(fun(X)->X*Divisor end, Result) ++[Divisor]);
divisor(N,Divisor,Result) when N rem Divisor =/= 0 ->
    divisor(N,Divisor+1,Result).

excessive_number(N)->
    lists:foldl(fun(X,Sum)->Sum+X end,0,lists:subtract(divisor(N,2,[1]),[N])) > N.

find()->
    Excessive_number = lists:filter(fun excessive_number/1,lists:seq(12,28123)),
          
          
