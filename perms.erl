%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%% 순열 
%%% @end
%%% Created : 13 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(perms).

-compile(export_all).

perms([]) ->
             [[]];
perms(L) ->
    [[H|T] || H <-L,
               T <- perms(L -- [H])].
