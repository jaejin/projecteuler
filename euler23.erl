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

exceed(N)->
    lists:sum(lists:filter(fun(X)-> N rem X =:= 0 end,lists:seq(1,N div 2))).


get(Key,Dict)->
   case dict:find(Key,Dict) of
       {ok,_} ->
           Key;
       error ->
           0
   end.
       

find()->
    find(lists:seq(1,28123),[],dict:new(),0).

find([],_ExceedNums,_Dict,Sum)->
    Sum;
find([H|T],Ex,Dict,Sum)->
    case exceed(H) > H of
        true ->
          Dict2 = lists:foldl(fun(X,Dic)-> dict:append(X+H,X+H,Dic) end,Dict,Ex++[H]),
          find(T,Ex++[H],Dict2,Sum+get(H,Dict2));
        false ->
            find(T,Ex,Dict,Sum+get(H,Dict))
    end.
