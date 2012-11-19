%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%
%%% @end
%%% Created : 2 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler28).

-compile(export_all).


run()->
    Array = spiral:make(1001),
    lists:foldl(fun(E,Sum)->
                        E+Sum end,
                        0,
                        spiral:getAllbydirection(0,0,lddu,1001,Array) ++
                        spiral:getAllbydirection(0,1000,rddu,1001,Array) -- [1]).





    





    
