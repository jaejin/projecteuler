%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%
%%% @end
%%% Created : 10 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler35).
-compile(export_all).



circle([H|T])->
    [T++[H]] ++ circle(T++[H],[H]++T).
circle(N,R) when N =:= R ->
    [];
circle([H|T],R) ->
    [T++[H]] ++ circle(T++[H],R).

find_circle_num(Int)->
    Result = circle(lists:flatten(io_lib:format("~p",[Int]))),
    if 
        length(Result) =:= 1 ->
            {Value,_} = string:to_integer(lists:flatten(Result)),
            [Value];
        true ->   
            lists:map(fun(E)->{Value,_}=string:to_integer(E),Value end, Result)
    end.


circle_primes (Numbers) ->
    circle_primes(Numbers, []).

circle_primes ([], Numbers) ->
    Numbers;
circle_primes ([H|T], Result) ->
    CircleNum = find_circle_num(H),
    R = ordsets:is_subset(ordsets:from_list(CircleNum),ordsets:from_list([H|T])),
    case R of
        true ->
            FilteredNumbers = ordsets:subtract(ordsets:from_list([H|T]),ordsets:from_list(CircleNum)),
            circle_primes(FilteredNumbers,Result++CircleNum);
        false ->
            circle_primes(T, Result)
  end.


main() ->
    length(circle_primes(generatePrimes:generatePrimes(1000000))).


    
