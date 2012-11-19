%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%% Pentagonal numbers are generated by the formula, Pn=n(3n1)/2. The first ten pentagonal numbers are:

%% 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

%% It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70  22 = 48, is not pentagonal.

%% Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference is pentagonal and D = |Pk  Pj| is minimised; what is the value of D?
%%% @end
%%% Created : 13 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler44).

-compile(export_all).

pentagonal_number(N)->
    N*(3*N-1) div 2.

test_pentagonal_number(N) when N > 0 ->
    R = (math:sqrt(24*N+1)+1)/6,
    R - erlang:round(R) =:= 0.0;
test_pentagonal_number(N) when N =< 0 ->
    false.

test(A,B) ->
   R1 =  test_pentagonal_number(B-A), 
   R2 = test_pentagonal_number(A+B),
   test_result(R1,R2).

test_result(true,true)->
    true;
test_result(false,false) ->
    false;
test_result(true,false) ->
    false;
test_result(false,true) ->
    false.


    



make_pentagonal_number(S,E)->
    lists:map(fun(I)->
                      pentagonal_number(I) end, lists:seq(S,E)).



find_minimised_d(N)->
   lists:foldl(fun({A,B},Min) ->
                  Result = test(A,B),
                  
                  if 
                      Result ->
                          io:format("~p~n",[B-A]),
                        Result2  =  Min > B-A,
                          if
                              Result2 ->
                                  B-A;
                              true ->
                                  Min
                          end;
                      true ->
                          Min
                              end end,
                                  N, [{A,B} || A <- make_pentagonal_number(1,N),
                B <- make_pentagonal_number(2,N)
                ]).

    

%%  euler44:find_minimised_d(6000).


    
    
