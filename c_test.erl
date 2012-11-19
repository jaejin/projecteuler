%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%
%%% @end
%%% Created : 2 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(c_test).

-export([c_break/1]).
c_break(Bindings)->
    case int:get_binding('N', Bindings) of
        {value,3} ->
            true;
        _ ->
            false
    end.
