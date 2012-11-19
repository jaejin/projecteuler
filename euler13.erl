-module(euler13).
-author(spyrogira256@gmail.com).

-compile(export_all).

-import(util).

result(File) ->
    lists:foldl(fun(X,Sum)->{Value,_}= string:to_integer(X),Value+Sum end,0, string:tokens(binary_to_list(element(2,file:read_file(File))),"\n")).
