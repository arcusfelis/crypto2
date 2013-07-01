%% @doc Crypto compatibility layer.
-module(crypto2).
-export([strong_rand_bytes/1,
         sha/1,
         init_random_generator/0]).

-ifdef('HAS_HASH').
sha(Data) ->
    crypto:hash(sha, Data).
-else.
sha(Data) ->
    crypto:sha(Data).
-endif.

-ifdef('HAS_STRONG_RAND_BYTES').
strong_rand_bytes(Len) ->
    crypto:strong_rand_bytes(Len).
-else.
strong_rand_bytes(Len) ->
    crypto:srand_bytes(Len).
-endif.

init_random_generator() ->
    Def = random:seed0(),
    case get(random_seed) of
        Def         -> new_seed();
        undefined   -> new_seed();
        _           -> ok
    end.

new_seed() ->
    <<A1:32, A2:32, A3:32>> = strong_rand_bytes(12),
    random:seed(A1, A2, A3),
    ok.

