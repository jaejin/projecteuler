%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

%% What is the largest n-digit pandigital prime that exists?
%%% @end
%%% Created : 13 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler41).

-compile(export_all).


make_num_pandigital(1)->
    "1";
make_num_pandigital(N)->
    integer_to_list(N) ++ make_num_pandigital(N-1).

perms([]) -> 
    [[]];
perms(L)  -> 
    [[H|T] || H <- L, T <- perms(L--[H])].

main(N)->
  lists:filter(fun(E) -> lib_primes:is_prime(list_to_integer(E)) end,perms(make_num_pandigital(N))).
