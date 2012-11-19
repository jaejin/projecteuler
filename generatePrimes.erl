-module(generatePrimes).
-export([generatePrimes/1]).
 
% Sieve of Euler %
 
generatePrimes (N) when is_integer(N) and (N > 1) ->
    Numbers = lists:seq(2,N),
    BeginIndex = 1,
    generatePrimes(Numbers, [], BeginIndex).
 
generatePrimes (Numbers, Numbers, _Index) ->
    Numbers;
 
generatePrimes (Numbers, _PreviousNumbers, Index) ->
    FilteredNumbers = ordsets:subtract(Numbers, multiples(lists:nth(Index, Numbers), Numbers)),
    generatePrimes(FilteredNumbers, Numbers, Index + 1).
 
multiples (Prime, Numbers) ->
    lists:map(fun(Num) -> Prime * Num end, Numbers).
