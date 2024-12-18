REBAR ?= rebar3

.PHONY: all clean check

all: include/tz_index.hrl
	@$(REBAR) compile

clean:
	@$(REBAR) clean
	@rm -f include/tz_index.hrl

check:
	@$(REBAR) eunit

include/tz_index.hrl: src/ibuild.erl include/tz_database.hrl
	cd include && ln -s ../src/ibuild.erl && escript ibuild.erl; EV=$$?; rm ibuild.erl; exit $$EV
