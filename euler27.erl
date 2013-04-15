%%%-------------------------------------------------------------------
%%% @author jaejinyun <spyrogira256@gmail.com>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created : 15 Apr 2013 by jaejinyun <spyrogira256@gmail.com>
%%%-------------------------------------------------------------------
-module(euler27).

-import(generatePrimes,[generatePrimes/1]).
-import(miller_rabin,[is_prime/1]).

-compile(export_all).

sumAbs(A,B)->
    case  is_prime(abs(1+B+A)) of
                            true ->
                                 [{A,B}];
                            false->
                                []
                        end.

searchA(B)->
    lists:foldl(fun(A,Sum)->
                     Sum ++   sumAbs(A,B) ++ sumAbs(-A,B)
                end , [] , lists:seq(0,1000)).

search()->
    lists:foldl(fun({A,B},{AMax,BMax,Max})->
                       {AP,BP,MP} = findPrime(A,B,2,true),
                        if
                            MP > Max ->
                                {AP,BP,MP};
                            true ->
                                {AMax,BMax,Max}
                        end
                end,{0,0,0},
     lists:foldl(fun(X,Sum)->
                          Sum ++ searchA(-X) ++ searchA(X)
                      end,[], generatePrimes(1000))).

findPrime(A,B,N,false)->
    {A,B,N-1};
findPrime(A,B,N,true)->
    findPrime(A,B,N+1,is_prime(abs(N*N + A*N + B))).
