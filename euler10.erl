%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%% 오일러 프로젝트 10 
%%% 2만번 아래 숫자들 중에서 primes
%%% @end
%%% Created : 3 Jan 2012 by jaejin <>

-module(euler10).

-export([run/1]).


run(1) ->
    findPrime(2,0).


findPrime(N,Sum) when N > 2000000 ->
    Sum;
findPrime(N,Sum) when N =< 2000000 ->
    case lib_primes:is_prime(N) of
        true  -> findPrime(N+1,Sum+N);
        false -> findPrime(N+1, Sum)
    end.
        




