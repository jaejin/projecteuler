%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%
%%% @end
%%% Created : 13 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler24).
-compile(export_all).

main(N,L)->
    lists:nth(N,perms(L)).

perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L--[H])].


