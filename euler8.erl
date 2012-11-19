%%%---------------------------------------------------------------------------
%%% File        : euler8.erl
%%% Author      : Jaejin [spyrogira256@gmail.com]
%%% 목적        : 오일러 프로젝트 8번 문제
%%% Created     : 2011-10-04 Jaejin
%%%---------------------------------------------------------------------------

-module(euler8).
-author('spyrogira256@gmail.com').

-export([euler8/1]).

-import(util).

euler8(F) ->
        split_list(util:read_file_to_list(F),[],0,0).


split_list([T|L],R,Max,5) ->
   CheckValue = lists:foldl(fun(X,Prod) -> X* Prod end, 1, R),
   [_|RL] = R, 
           if 
               Max >= CheckValue ->
                   split_list(L, RL++[T],Max,5);
               Max < CheckValue ->
                   split_list(L,RL++[T],CheckValue,5)
           end;
split_list([T|L],R,Max,Count) -> 
         split_list(L,R++[T],Max,Count+1);
split_list([],_,Max,_) ->
    Max.

