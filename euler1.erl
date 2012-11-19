-module(euler1).
-export([problem1/0]).
-import(lists).

problem1() ->
    problem1(1000,1,[]).

problem1(A,B,C) when A =< B ->
            lists:sum(C);
problem1(A,B,C) when B rem 3 == 0 ->
            problem1(A,B+1,lists:append(C,[B]));
problem1(A,B,C) when B rem 5 == 0 ->
            problem1(A,B+1,lists:append(C,[B]));
problem1(A,B,C) ->
    problem1(A,B+1,C).
