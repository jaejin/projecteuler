%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%% 

%% Possible Paths across a Rectangular Grid

%% Date: 02/16/2005 at 21:59:13
%% From: Wenying
%% Subject: How many different paths from A to B are possible?

%% Consider a grid that has 3 rows of 4 squares in each row with the
%% lower left corner named A and upper right corner named B. 

%% Suppose that starting at point A you can go one step up or one step to 
%% the right at each move.  This is continued until the point B is 
%% reached.  How many different paths from A to B are possible?

%% I thought about using a tree diagram starting from point A.  From 
%% point A there are 2 ways to reach the points up and to the right.  So 
%% I multiply 2 when I reach each point.  I don't know how to continue 
%% from the upper left and lower right corners.


%% Date: 02/17/2005 at 14:43:17
%% From: Doctor Ricky
%% Subject: Re: How many different paths from A to B are possible?

%% Hi Wenying,

%% Thanks for writing Dr. Math!

%% Going from your description, your diagram looks like this:

%%              _____________________________________ B
%%              |        |        |        |        |
%%              |________|________|________|________|
%%              |        |        |        |        |
%%              |________|________|________|________|
%%              |        |        |        |        |
%%              |________|________|________|________|
%%             A

%% Now let's look at some sample paths we can figure out by inspection.

%% If we start at A and move towards B, we find we can follow the path

%%   RRRRUUU 

%% (where R = Right one unit, U = Up one unit), 

%%   UUURRRR, 
%%   RURURUR, 
%%   RRUUURR, 

%% and so on. 

%% By analyzing our good routes, we see that every good route consists of
%% seven moves and we have four R moves and three U moves.  We can use
%% this to generalize a formula to find the number of possible routes.  

%% Since as we've shown, order does not matter in our paths (we can have
%% an R in any place of our 7 moves), we can use our combination formula:

%%                n!
%%   C(n,r) = -----------
%%             r!*(n-r)!

%% The number of how many good routes we have can be found by finding how
%% many combinations of 4 R's we can have in our 7 moves, so we want to
%% calculate:

%%                 7!
%%   C(7,4) = -----------
%%             4!*(7-4)!

%% You can see that since there have to be 4 R's, there must be 3 U's, so
%% you can also use the combination formula to find how many different
%% combinations of 7 moves with 3 U's there are, and you will end up with
%% the exact same result.

%% This is because we only have two choices for moves: right and up.  If
%% we had more choices, this equality might not hold true.  Since we only
%% have two possible moves, it does.

%% I hope this helps!  If you have any more questions or concerns, feel 
%% free to write back.

%% - Doctor Ricky, The Math Forum
%%   http://mathforum.org/dr.math/ 

%% euler problem 15

%% How many routes are there through a 2020 grid?
%%% @end
%%% Created : 1 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module(euler15).

-compile(export_all).

fact(N)->
    fact(N,1).

fact(0,Result)->
    Result;
fact(N,Result)->
    fact(N-1,Result*N).

combi(N,R) ->
    fact(N) div (fact(R) * fact(N-R)).

