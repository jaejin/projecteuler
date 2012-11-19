-module(euler3).
-export([primefactor/1,gcd/2]).

gcd(A,B) ->
    gcd(A,B,[]).

gcd(A,B,C) when B == 0 ->
    C++[A];
gcd(A,B,C) ->
    gcd(B, A rem B,C++[A rem B]).

primefactor(Prime) ->
    primefactor(Prime,2,[]).

primefactor(Prime,Current,L) when Prime rem Current == 0 ->
    primefactor(Prime div Current,Current,L++[Current]);
primefactor(1,_,L) ->
    L;
primefactor(Prime,Current,L) ->
    primefactor(Prime,Current+1,L).
