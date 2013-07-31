%%%-------------------------------------------------------------------
%%% @author jaejinyun <skplanet@jaejinmac.local>
%%% @copyright (C) 2013, jaejinyun
%%% @doc
%%%
%%% @end
%%% Created : 30 Jul 2013 by jaejinyun <skplanet@jaejinmac.local>
%%%-------------------------------------------------------------------
-module(euler52).

-export([main/0]).

main()->
    L = lists:seq(100000,999999),
    [X || X <- L,
          XSort= lists:sort(integer_to_list(X)),
          X2= lists:sort(integer_to_list(X*2)),
          XSort =:= X2,
          X3= lists:sort(integer_to_list(X*3)),
          XSort =:= X3,
          X4= lists:sort(integer_to_list(X*4)),
          XSort =:= X4,
          X5= lists:sort(integer_to_list(X*5)),
          XSort =:= X5,
          X6= lists:sort(integer_to_list(X*6)),
          XSort =:= X6].
          
          
          
       

          
