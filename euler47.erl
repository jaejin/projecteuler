%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%
%%% @end
%%% Created : 10 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler47).
-compile(export_all).

divisor_list(N,M,List) when N =:= M ->
    gb_sets:to_list(gb_sets:from_list(List++[M]));
divisor_list(N,M,List) when N rem M =:= 0 ->
    divisor_list(N div M,M,List ++ [M]);
divisor_list(N,M,List) when N rem M =/= 0 ->
   divisor_list(N,M+1,List).

distinct_prime_factor(_,L,Check) when length(L) =:= Check ->
    L;
distinct_prime_factor(Num,L,Check) ->
    Length = length(divisor_list(Num,2,[])),
    Last =  lists:last(L),
    LastLength = length(divisor_list(Last,2,[])),
    Consecutive = Num - Last,
%    io:format("Num: ~p Length: ~p Last : ~p L ~p : ~n",[Num,Length,Last,L]),
    if
        Length =:= Check,Consecutive =:= 1,LastLength =:= Check  ->
  %          io:format("Length ~n",[]),
            distinct_prime_factor(Num+1,L++[Num],Check);
        true ->
 %           io:format("Check true ~n",[]),
           distinct_prime_factor(Num+1,[Num],Check)
    end.
    


