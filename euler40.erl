%%%-------------------------------------------------------------------
%%% @author jaejinyun <skplanet@jaejinmac.local>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created : 26 Jul 2013 by jaejinyun <skplanet@jaejinmac.local>
%%%-------------------------------------------------------------------
-module(euler40).

-export([makeDecimal/1]).

makeDecimal(Nth)->
    makeDecimal(Nth,0,1,"").
makeDecimal(Nth,CurrentLength,_CurrentNum,S) when CurrentLength > Nth ->
    list_to_integer([lists:nth(Nth,S)]);
makeDecimal(Nth,_CurrentLength,CurrentNum,S) ->
    makeDecimal(Nth,length(S),CurrentNum+1,S++integer_to_list(CurrentNum)).
    
    
