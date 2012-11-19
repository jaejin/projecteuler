%%%-------------------------------------------------------------------
%%% @author jaejin <>
%%% @copyright (C) 2012, jaejin
%%% @doc
%%%The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:

%% 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

%% By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.

%% Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

%% http://mathforum.org/library/drmath/view/57162.html


%% In order to know if a number is triangular or not, it's helpful to 
%% know the formula for triangular numbers:

%%      n(n+1)
%% T = --------
%%        2

%% Given a number to test, I'd do it this way:

%% For example, 66.

%%     66 = n(n+1)/2
%%    132 = n(n+1)

%% Now I reason that n and (n+1) are numbers relatively close together. 
%% So if I found the square root of 132, it should be close to the 
%% smaller "n" .

%% Sure enough, sqrt(132) = 11.xxxxx.

%% So if I now use 11 in the formula for "n" I have

%%    11(11 + 1)/2 = 11(12)/2 = 11(6) = 66.  And it works!

%% If another number, like 100, was tested in this way, things don't work 
%% out.

%%          100 = n(n+1)/2
%%          200 = n(n+1)

%%    sqrt(200) = 14.xxxx

%% But 14(15)/2  = 105, which does not equal 100.  etc. Okay?

%% Testing  for squares should be easy on a calculator, if the number 
%% isn't too large of course. But do remember one simple fact: if the 
%% number ends with a 2, 3, 7, or 8, it CANNOT be square, no matter what. 
%% Do you see why?

%% - Doctor Terrel, The Math Forum
%%   http://mathforum.org/dr.math/   

%%% @end
%%% Created : 13 Feb 2012 by jaejin <>
%%%-------------------------------------------------------------------
-module('euler42').
-compile(export_all).

test_triangle_num(N)->
    T = erlang:round(math:sqrt(N*2)),
    (T*(T+1)) div 2 == N.


sum_text(String)->
    lists:foldl(fun(S,Sum)->(S-64) + Sum end, 0, String).

load(F)->
  string:tokens(util:gsub(util:gsub(binary_to_list(element(2,file:read_file(F))),"\n",","),"\"",""),",").

main(F)->
    lists:foldl(fun(E,Sum)->
                        R = test_triangle_num(sum_text(E)),
                        if
                            R ->
                                Sum+1;
                            true ->
                                Sum
                        end
                        end,0,load(F)).

