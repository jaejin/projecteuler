%%%-------------------------------------------------------------------
%%% @author 재진 윤 <spyrogirar256@gmail.com>
%%% @copyright (C) 2013, 재진 윤
%%% @doc
%%%
%%% @end
%%% Created : 16 Apr 2013 by 재진 윤 <spyrogirar256@gmail.com>
%%%-------------------------------------------------------------------
-module(euler39).

-import(euler9,[pyth1/1]).
-export([main/0]).


main()->
    lists:foldl(fun(X,{LX,LMax})->
                       Length= lists:foldl(fun(A,Count)->
                                              lists:foldl(fun(B,Count2)->
                                                                    C = X - A - B,
                                                                    if C*C =:= A*A + B*B ->
                                                                            Count2 +1;
                                                                       true ->
                                                                            Count2
                                                                    end     
                                                                    end,0, lists:seq(1,X-1-A)) + Count
                                       end,0, lists:seq(1,X-2)),
                        if
                            Length > LMax ->
                                {X,Length};
                            true ->
                                {LX,LMax}
                        end
                end,{0,0},lists:seq(12,999)).
