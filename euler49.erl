%%%-------------------------------------------------------------------
%%% @author jaejinyun <skplanet@jaejinmac.local>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created : 30 Jul 2013 by jaejinyun <skplanet@jaejinmac.local>
%%%-------------------------------------------------------------------
-module(euler49).

-export([main/0]).

dict_from_list([H|T])->
    Dict = dict:new(),
   dict_from_list(T,dict:append(integer_to_list(H),H,Dict)).
dict_from_list([],Dict)->
    Dict;
dict_from_list([H|T],Dict) ->
   dict_from_list(T,dict:append(integer_to_list(H),H,Dict)).

main()->
   Primes =  lists:filter(fun(X)->length(integer_to_list(X))> 3 end, generatePrimes:generatePrimes(10000)),
    DictPrimes = dict_from_list(Primes),
    find(Primes,DictPrimes).

find(Primes,DictPrimes)->
    find(Primes,DictPrimes,[]).

find([],_DictPrimes,Result)->
    Result;
find([H|T],DictPrimes,Result) ->
    F =lists:usort(lists:map(fun(X)->
                         list_to_integer(X) end,
                    lists:filter(fun(X)->
                             dict:is_key(X,DictPrimes) end,perms:perms(integer_to_list(H))))),
    Flength = length(F),
    if
        Flength > 2 ->
             find(lists:subtract(T,F),DictPrimes,Result++continueNum(F));
       true ->
            find(lists:subtract(T,F),DictPrimes,Result)
    end.

continueNum(F)->
    [{A,B,C}||
     A<-F,
     B<-F,
     C<-F,
     C > B,
     B > A,
     B-A =:= C-B].
     
                              
                         
    
    

