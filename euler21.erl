-module(euler21).
-author('spyrogira256@gmail.com').

-export([result/0,divideSum/3]).

result() ->
    amicableNum(lists:seq(1,10000),0).

divideSum(N,M,Result) when N =:= M ->
    Result+1;
divideSum(N,M,Result) when N rem M =:= 0 ->
    divideSum(N,M+1,Result+M);
divideSum(N,M,Result) when N rem M =/= 0 ->
    divideSum(N,M+1,Result).

amicableNum([],Result) ->
    Result;
amicableNum([H|T],Result) ->
%    io:format("~p~n",[H]),
    IsPrime = isPrime(H),
    if
        IsPrime ->
            amicableNum(T,Result);
        true ->
            R = divideSum(H,2,0),
            R2 = divideSum(R,2,0),
            case R2 =:= H of 
                true ->
                    case H =/= R of
                        true ->
                            amicableNum(lists:delete(R,T),Result+R+H);
                        false ->
                            amicableNum(lists:delete(R,T),Result)
                    end;
                false ->
                    amicableNum(lists:delete(R,T),Result)
            end
        end.
                           


smallestDivisor(N)->
    findDivisor(N,2).

findDivisor(N,TestDivisor) when TestDivisor*TestDivisor > N ->
   N;
findDivisor(N,TestDivisor)  ->
    case divides(TestDivisor,N) of
        true ->
            TestDivisor;
        false ->
            findDivisor(N,TestDivisor+1)
    end.

divides(A,B)->
    B rem A =:= 0.

isPrime(N) ->
    N =:= smallestDivisor(N).
