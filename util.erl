-module(util).
-export([stringToList/1,sub/3,gsub/3,read_file_to_list/1]).
-import(string).

stringToList(S)->
    stringToList(S,1,[]).

stringToList(S,N,L) when N == length(S) ->
    L ++ [list_to_integer(string:substr(S,N,1))];
stringToList(S,N,L) ->
    stringToList(S,N+1,L ++ [list_to_integer(string:
substr(S,N,1))]).

sub(Str,Old,New) ->

   Lstr = string:len(Str),
   Lold = string:len(Old),
   Pos  = string:str(Str,Old),
   if 
      Pos =:= 0 -> 
                   Str;
      true      ->
           LeftPart = string:left(Str,Pos-1),
           RitePart = string:right(Str,Lstr-Lold-Pos+1),
           string:concat(string:concat(LeftPart,New),RitePart)
   end.

gsub(Str,Old,New) ->
  Acc = sub(Str,Old,New),
  subst(Acc,Old,New,Str).

subst(Str,_Old,_New, Str) -> Str;
subst(Acc, Old, New,_Str) ->
         Acc1 = sub(Acc,Old,New),
         subst(Acc1,Old,New,Acc).


read_file_to_list(F) ->
    util:stringToList(util:gsub(binary_to_list(element(2,file:read_file(F))),"\n","")).
