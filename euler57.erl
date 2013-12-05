%%%-------------------------------------------------------------------
%%% @author jaejinyun <skplanet@jaejinmac.local>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created :  5 Dec 2013 by jaejinyun <skplanet@jaejinmac.local>
%%%-------------------------------------------------------------------
-module(euler57).

-export([new/2,plus/2,sqrt/1,rootD/1,main/0]).

-record(fraction, {numer, denom}).

new(N,{fraction,N1,D1}) ->
    #fraction{numer=(N*D1),denom=N1};
new(N,D)->
    #fraction{numer=N,denom=D}.

plus({fraction,N1,D1},{fraction,N2,D2}) when D1 =:= D2 ->
    {fraction,N1+N2,D2};
plus({fraction,N1,D1},{fraction,N2,D2}) when D1 =/= D2 ->
     {fraction,N1*D2+N2*D1,D1*D2};
plus(Int,{fraction,N,D})->
    {fraction,Int*D+N,D};
plus(Int,Int) ->
     Int+Int.


sqrt(1)->
    plus(1,rootD(1));
sqrt(2) ->
    plus(1,rootD(2));
sqrt(N) ->
    plus(1,rootD(N)).

rootD(1)->
    new(1,2);
rootD(2) ->
    new(1,plus(2,rootD(1)));
rootD(N) ->
    new(1,plus(2,rootD(N-1))).

main()->
    lists:foldl(fun(Num,Count)->
                        {fraction,N,D} = sqrt(Num),
                    NLength = length(integer_to_list(N)),
                    DLength = length(integer_to_list(D)),
                    if NLength > DLength ->
                            Count+1;
                       true ->
                            Count
                    end end,0,lists:seq(1,1000)).
