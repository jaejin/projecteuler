%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

%% Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

%% (Please note that the palindromic number, in either base, may not include leading zeros.)
%%% @end
%%% Created : 13 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler36).

-compile(export_all).

main(N)->
   lists:foldl(fun(X,Sum) -> X + Sum end,0, 
               [E || 
                   E <- [A || 
                            A<-lists:seq(1,N), 
                            lists:reverse(integer_to_list(A)) =:= integer_to_list(A)], 
                   lists:reverse(to_binary_number(E)) =:= to_binary_number(E)]). 

to_binary_number(N)->
    lists:reverse(to_binary_number(N div 2, N rem 2)).

to_binary_number(0,0) ->
    "00";
to_binary_number(1,0)->
    "01";
to_binary_number(0,1)->
    "1";
to_binary_number(N,0) ->
    "0" ++ to_binary_number(N div 2, N rem 2);
to_binary_number(N,1) ->
    "1" ++ to_binary_number(N div 2, N rem 2).


plus_binary(L,N)->
  lists:reverse(carry(lists:reverse(L),N)).

carry([],1)->
    "1";
carry([],0)->
    [];
carry([H|T],1)->
   R =  list_to_integer([H]) + 1,
   case R of
       2 ->
         "0" ++  carry(T,1);
       1 ->
          "1" ++ carry(T,0)
   end;
carry([H|T],0)->
    [H]++T.
