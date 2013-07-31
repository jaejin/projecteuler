-module(combination).
-compile(export_all).

combos(1, L) -> [[X] || X <-L];
combos(K, L) when K == length(L) -> [L];
combos(K, [H|T]) ->
    [[H | Subcombos] || Subcombos <- combos(K-1, T)]
    ++(combos(K, T)).

combos(L) ->
    lists:foldl(
        fun(K, Acc) -> Acc++(combos(K, L)) end,
        [],
        lists:seq(1, length(L))
    ).


perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L--[H])].
