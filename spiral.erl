%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%% 
%%% @end
%%% Created : 3 Apr 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(spiral).

-export([make/1,get/3,set/4,getAllbydirection/5]).

make_array(Size)->
    L= lists:map(fun(_E)->    0 end, lists:seq(0,Size-1)),
    ColumnArray = array:from_list(L),
    lists:foldl(fun(E,Array)->    
                      array:set(E,ColumnArray,Array)
              end,array:new(),lists:seq(0,Size-1)).

get(Row,Column,Array)->
   array:get(Column,array:get(Row,Array)).

set(Row,Column,Array,Value) ->
    array:set(Row,array:set(Column,Value,array:get(Row,Array)),Array).
    

make(Size) ->
    Array = make_array(Size),
    check((Size div 2),(Size div 2)+1,left,set(Size div 2, Size div 2,Array,1),2,Size).



check(Row,Column,Direction,Array,Value, Size) ->
    CheckValue = Size*Size,
    if CheckValue =:= Value ->
            set(Row,Column,Array,Value);
       true->
            in(Row,Column,Direction,Array,Value,Size)
    end.

in(Row,Column,left,Array,Value, Size)->
   A0 = set(Row,Column,Array,Value),
   CheckValue =  get(Row+1,Column,A0),
   if CheckValue =:= 0 ->
         check(Row+1,Column,down,A0,Value+1,Size);
   true ->
        check(Row,Column+1,left,A0,Value+1,Size)
   end;
in(Row,Column,down,Array,Value, Size)->
    A0 = set(Row,Column,Array,Value),
   CheckValue =  get(Row,Column-1,A0),
   if CheckValue =:= 0 ->
         check(Row,Column-1,right,A0,Value+1,Size);
   true ->
        check(Row+1,Column,down,A0,Value+1,Size)
   end;
in(Row,Column,right,Array,Value, Size)->
    A0 = set(Row,Column,Array,Value),
   CheckValue =  get(Row-1,Column,A0),
   if CheckValue =:= 0 ->
         check(Row-1,Column,up,A0,Value+1,Size);
   true ->
        check(Row,Column-1,right,A0,Value+1,Size)
   end;
in(Row,Column,up,Array,Value, Size) ->
    A0 = set(Row,Column,Array,Value),
   CheckValue =  get(Row,Column+1,A0),
   if CheckValue =:= 0 ->
         check(Row,Column+1,left,A0,Value+1,Size);
   true ->
        check(Row-1,Column,up,A0,Value+1,Size)
   end.

getAllbydirection(Row,Column,Direction,Size,Array)->
    case Direction of 
        lddu ->
            getAllbydirection(Row,Column,lddu,Size,Array,[]);
        rddu ->
            getAllbydirection(Row,Column,rddu,Size,Array,[])
    end.

getAllbydirection(Row,Column,lddu,Size,Array,Result) ->
    if
        Row =< Size - 1,
        Column =< Size -1 ->
            getAllbydirection(Row+1,Column+1,lddu,Size,Array,Result ++ [get(Row,Column,Array)]);
        Row > Size - 1,
        Column > Size - 1->
            Result
   end;
getAllbydirection(Row,Column,rddu,Size,Array,Result) ->
    if
        Row =< Size - 1,
        Column >= 0 ->
            getAllbydirection(Row+1,Column-1,rddu,Size,Array,Result ++ [get(Row,Column,Array)]);
        Row > Size - 1,
        Column < 0 ->
            Result
   end.        
            


    


