-module(euler5).
-import(euler3).
-export([euler5/0]).

euler5() ->
    start_div(2520,euler3:primefactor(2520)).

start_div(Value,Result) when Result > 10 ->
    Value;
start_div(Value,_) ->
    start_div(Value+1,euler3:primefactor(Value+1)).
