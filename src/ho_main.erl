-module(ho_main).
-behaviour(gen_server).

-export([add/2, sub/2]).

-export([start_link/0]).
-export([terminate/2]).
-export([init/1]).
-export([handle_call/3]).

%%
%% 外部向けAPI
%%

add(A,B) ->
	Reply = gen_server:call(?MODULE, {add, A, B}),
	{ok, V} = Reply,
	V.

sub(A,B) ->
	Reply = gen_server:call(?MODULE, {sub, A, B}),
	{ok, V} = Reply,
	V.

%%
%% ビヘイビアのコールバック定義（処理の実体）
%%

start_link() ->
	Args = [],
	gen_server:start_link({local, ?MODULE}, ?MODULE, Args, []).

init(_Args) ->
	NewState = [],
	{ok, NewState}.

terminate(_Reason, State) ->
	ok.

handle_call({add, A, B}, From, State) ->
	{reply, {ok, A+B+1000}, State};

handle_call({sub, A, B}, From, State) ->
	{reply, {ok, A-B+1000}, State}.


