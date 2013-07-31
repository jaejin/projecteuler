%%%-------------------------------------------------------------------
%%% @author jaejinyun <skplanet@jaejinmac.local>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created :  4 Jun 2013 by jaejinyun <skplanet@jaejinmac.local>
%%%-------------------------------------------------------------------
-module(euler341).
-compile(export_all).

golSeq(N)->
    golSeq([1,2,2],3,N).

golSeq(L,_Current,N) when length(L) >= N->
    lists:nth(N,L);
golSeq(L,Current,N) ->
    golSeq(L ++ lists:duplicate(golSeq(Current),Current),Current+1,N).




