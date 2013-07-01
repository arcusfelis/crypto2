-module(crypto2_tests).
-include_lib("eunit/include/eunit.hrl").

-ifdef(TEST).

sha_test_() ->
    [?_assertEqual(<<112,55,128,113,152,194,42,125,43,8,7,55,29,118,55,121,168,79,223,207>>,
                   crypto2:sha(<<1,2,3>>))].

init_random_generator_test() ->
    crypto2:init_random_generator(),
    ok.

-endif.
