-module(euler26).
-author('spyrogira256@gmail.com').

-export([main/0]).

main()->
    divide(2).

divide(D)->
    divide(1,D,dict:new(),0,1,D,D).

divide(_P,_Q,_Dict,_Max,_Pos,1000,MaxD)->
    MaxD;
divide(0,_Q,_Dict,Max,_Pos,D,MaxD)->
    divide(1,D+1,dict:new(),Max,1,D+1,MaxD);
divide(P,Q,Dict,Max,Pos,D,MaxD) when P < Q  ->
    divide(P*10,Q,Dict,Max,Pos,D,MaxD);
divide(P,Q,Dict,Max,Pos,D,MaxD) ->
    M = P div Q,
    Rem = P rem Q,
    Key = integer_to_list(M) ++ " " ++ integer_to_list(Rem),
    case dict:find(Key, Dict) of
        {ok, [Value]} ->
            Current = Pos - Value,
            if Max < Current ->
                    divide(1,D+1,dict:new(),Current,1,D+1,Q);
               true ->
                    divide(1,D+1,dict:new(),Max,1,D+1,MaxD)
            end;
        error ->
            NewDict = dict:append(Key,Pos,Dict),
            divide(Rem,Q,NewDict,Max,Pos+1,D,MaxD)
    end.

    






