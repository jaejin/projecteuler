-module(euler26).
-author('spyrogira256@gmail.com').

-export([main/0]).

main()->
    divide(2).

divide(1000)->
    io:format("~p~n",[1/1000]);
divide(M) ->
    io:format("~p~n",[1/M]),
    divide(M+1).





