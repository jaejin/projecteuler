%%%-------------------------------------------------------------------
%%% @author jaejinyun <spyrogira256@gmail.com>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created : 11 Apr 2013 by jaejinyun <spyrogira256@gmail.com>
%%%-------------------------------------------------------------------
-module(euler19).

-compile(export_all).

main()->
    lists:foldl(fun(Y,Sum)->
                       Sum + lists:foldl(fun(M,MS)->
                                                 case getWeekDay(Y,M) of
                                                     1 ->
                                                         MS +1;
                                                     _Else ->
                                                         MS
                                                 end
                                         end,0,lists:seq(1,12))
                        end, 0,lists:seq(1901,2000)).

getWeekDay(Year,1)->
    getWeekDay(Year-1,13);
getWeekDay(Year,2)->
    getWeekDay(Year-1,14);
getWeekDay(Year,Month)  ->
            ( 1 + (26 * (Month +1)) div 10 + Year + Year div 4 + 6 * (Year div 100) +   Year div 400 ) rem 7.

