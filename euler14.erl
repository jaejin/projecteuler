-module(euler14).
-author('spyrogira256@gmail.com').

-export([result/0]).

result()->
    for(1000000,1,1000000).

for(1,_,Value)->
    Value;
for(N,Max,Value) ->
    Chain = cal(N,1),
    if
        Chain >= Max ->
            for(N-1,Chain,N);
        Chain < Max ->
            for(N-1,Max,Value)
    end.

cal(1,Count) ->
    Count;
cal(N,Count) when N rem 2 =:= 0 ->
    cal(even(N),Count+1);
cal(N,Count) when N rem 2 =/= 0 ->
    cal(odd(N),Count+1).

odd(N)->
    3*N +1.

even(N)->
    N div 2.
