PROJECT = crypto2

## This is a hack. You can scrutinize the correct thing to do based on
## 'erl +V' and then grabbing the version of Erlang from that and
## determine what version is running.
##
## Right now, I don't care about this detail, however
ERLC_OPTS += -DHAS_HASH -DHAS_STRONG_RAND_BYTES

include erlang.mk

