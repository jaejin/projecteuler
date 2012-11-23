%%%-------------------------------------------------------------------
%%% @author desktop <jaejin@ubuntu>
%%% @copyright (C) 2012, desktop
%%% @doc
%%% In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:

%% High Card: Highest value card.
%% One Pair: Two cards of the same value.
%% Two Pairs: Two different pairs.
%% Three of a Kind: Three cards of the same value.
%% Straight: All cards are consecutive values.
%% Flush: All cards of the same suit.
%% Full House: Three of a kind and a pair.
%% Four of a Kind: Four cards of the same value.
%% Straight Flush: All cards are consecutive values of same suit.
%% Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
%% The cards are valued in the order:
%% 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

%% If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.

%% Consider the following five hands dealt to two players:

%% Hand	 	Player 1	 	Player 2	 	Winner
%% 1	 	5H 5C 6S 7S KD
%% Pair of Fives
%%  	2C 3S 8S 8D TD
%% Pair of Eights
%%  	Player 2
%% 2	 	5D 8C 9S JS AC
%% Highest card Ace
%%  	2C 5C 7D 8S QH
%% Highest card Queen
%%  	Player 1
%% 3	 	2D 9C AS AH AC
%% Three Aces
%%  	3D 6D 7D TD QD
%% Flush with Diamonds
%%  	Player 2
%% 4	 	4D 6S 9H QH QC
%% Pair of Queens
%% Highest card Nine
%%  	3D 6D 7H QD QS
%% Pair of Queens
%% Highest card Seven
%%  	Player 1
%% 5	 	2H 2D 4C 4D 4S
%% Full House
%% With Three Fours
%%  	3C 3D 3S 9S 9D
%% Full House
%% with Three Threes
%%  	Player 1
%% The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.

%% How many hands does Player 1 win?
%%% @end
%%% Created : 23 Nov 2012 by desktop <jaejin@ubuntu>
%%%-------------------------------------------------------------------
-module(euler54).
-export([cardValue/1,qsort/1,flush/1,straight/1,getDuplicate/1,max/1]).

cardValueOrder("2")->
    1;
cardValueOrder("3") ->
    2;
cardValueOrder("4") ->
    3;
cardValueOrder("5") ->
    4;
cardValueOrder("6") ->
    5;
cardValueOrder("7") ->
    6;
cardValueOrder("8") ->
    7;
cardValueOrder("9") ->
    8;
cardValueOrder("T") ->
    9;
cardValueOrder("J") ->
    10;
cardValueOrder("Q") ->
    11;
cardValueOrder("K") ->
    12;
cardValueOrder("A") ->
    13.

cardKindOrder("C")->
    1;
cardKindOrder("H") ->
    2;
cardKindOrder("D") ->
    3;
cardKindOrder("S") ->
    4.


qsort([]) ->
    [];
qsort([H | T]) -> 
    {Value,_} = H,
    qsort([ {Value2,Card2} || {Value2,Card2} <- T, Value2 < Value ]) 
        ++ [H] ++ 
        qsort([ {Value1,Card1} || {Value1,Card1} <- T, Value1 >= Value ]).


    
cardValue(Card)->
    {cardValueOrder(string:substr(Card,1,1)),cardKindOrder(string:substr(Card,2))}.

flush([{CardValue,Card}|T])->
    {Result,_} = lists:foldl(fun({_,LCard},{Check,Prev})->
                        if Check , Prev =:= LCard ->
                                {true,LCard};
                           true ->
                                {false,LCard} end end, {true,Card}, T),
    if Result ->
            {6,CardValue,Card};
       true ->
            {0,CardValue,Card}
      end.
                  

straight([{Value,Card}|T])->
      {Result,ResultValue} = lists:foldl(fun({LValue,_},{Check,Prev})->
                                      Result = LValue - Prev,
                                      if Check , Result =:= 1 ->
                                              {true,LValue};
                                         true ->
                                              {false,LValue} end end, {true,Value}, T),
    if Result ->
            {5,ResultValue,Card};
       true ->
            {0,ResultValue,Card}
      end.

mountin([{9,_},{10,_},{11,_},{12,_},{13,_}])->
    1;
mountin(L) ->
    0.

getDuplicate([H|T])->
   {RV,RC,RL} = lists:foldl(fun(X,{Prev,Count,L})->
                        if Prev =:= X->
                                {X,Count+1,L};
                           true ->
                                {X,1,L++[{Prev,Count}]} 
                           end end,{H,1,[]},T),
   RL++[{RV,RC}].

max(L)->
    lists:foldl(fun({X,Count},{MX,Max})->
                        if Max < Count->
                                {X,Count};
                           true ->
                                {MX,Max} 
                        end end,{0,0},L).

fourCard(L) ->
    {Value,Count} = max(getDuplicate(qsort(L))),
    if Count =:= 4 ->
            {8,Value,0};
       true ->
            {0,Value,0} 
       end.
    
    
triple(L)->
    {Value,Count} = max(getDuplicate(qsort(L))),
    if Count =:= 3 ->
            {4,Value,0};
       true ->
            {0,Value,0} 
       end.    

twopair(L)->
    0.

onepair(L)->
    0.

checkCard(L)->
    {FlushResult,FValue,FCard}= flush(L),
    {StraightResult,SValue,SCard}=straight(L),
    {TreeResult,TrValue,TrCard}=triple(L),
    {TwoResult,TwoValue,TwoCard}=twopair(L),
    {OnePairResult,OneValue,OneCard} = onepair(L),
    if FlushResult > 0 ,
       StraightResult > 0->
            {10+mountin(L),SValue,FCard};
       FlushResult > 0  ->
            {0,FValue,FCard};
       StraightResult > 0  ->
            {0,SValue,SCard} end.










    
