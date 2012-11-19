%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%
%%% @end
%%% Created : 10 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler29).

-compile(export_all).

main(N)->
    length(gb_sets:to_list(gb_sets:from_list([math:pow(A,B) || A <-lists:seq(2,N), B<-lists:seq(2,N)]))).
