% Will Smith
% Air-Lang

-module(ch3).

-export([sum/1]).
-export([sum/2]).
-export([create/1]).
-export([reverse_create/1]).
-export([print_integers/1]).
-export([print_even_integers/1]).
-export([db_new/0]).
-export([db_destroy/1]).
-export([db_write/3]).
-export([db_delete/2]).
-export([db_read/2]).
-export([db_match/2]).
-export([filter/2]).
-export([reverse/1]).
-export([parse/1]).

%% 3-1

% Direct Recursive Style
sum(N) when N > 0 ->
    N + sum(N - 1);
sum(0) ->
    0.

% Tail-Recursive Style
sum(N, M) ->
    sum(N, M, N).

sum(N, M, Sum) ->
    if N < M ->
	    sum(N + 1, M, Sum + (N + 1));
       N == M ->
	    Sum
    end.

%% 3-2

create(N) ->
    create(N, []).

create(N, L) when N > 0 ->
    create(N - 1, [N | L]);
create(0, L) ->
    L.

reverse_create(N) when N > 0 ->
    [N | reverse_create(N - 1)];
reverse_create(0) ->
    [].

% 3-3

print_integers(N) ->
    print_integers(N, 1).

print_integers(N, C) when N > 0 ->
    io:format("Number:~p~n", [C]),
    print_integers(N - 1, C + 1);
print_integers(0, _) ->
    ok.

print_even_integers(N) ->
    print_even_integers(N, 1).

print_even_integers(N, _) when N =< 0 ->
    ok;
print_even_integers(N, C) when C rem 2 == 0 ->
    io:format("Number:~p~n", [C]),
    print_even_integers(N - 1, C + 1);
print_even_integers(N, C) ->
    print_even_integers(N - 1, C + 1).

% 3-4

db_new() ->
    [].

db_destroy(Db) ->
    Db.

db_write(Key, Element, Db) ->
    [{{key, Key}, {element, Element}} | Db].

db_delete(Key, Db) ->
    db_delete(Key, Db, []).

% Gives me wrong order. Just noting it.
db_delete(_, [], NewDb) ->
    NewDb;
db_delete(Key, [{{key, X}, {element, _}} | Db], NewDb) when Key == X ->
    db_delete(Key, Db, NewDb);
db_delete(Key, [X | Db], NewDb) ->
    db_delete(Key, Db, [X | NewDb]).

db_read(_, []) ->
    {error, instance};
db_read(Key, [{{key, X}, {element, Element}} | _]) when Key == X ->
    {ok, Element};
db_read(Key, [_ | Db]) ->
    db_read(Key, Db).

db_match(_, []) ->
    [];
db_match(Element, [{{key, Key}, {element, X}} | Db]) when Element == X ->
    [Key | db_match(Element, Db)];
db_match(Element, [_ | Db]) ->
    db_match(Element, Db).

% 3-5

filter(L, N) ->
    filter(L, N, []).

filter([], _, NL) ->
    NL;
filter([X | L], N, NL) when X =< N ->  
    filter(L, N, NL ++ [X]);
filter([_ | L], N, NL) ->
    filter(L, N, NL).

reverse(L) ->
    reverse(L, []).

reverse([], NL) ->
    NL;
reverse([X | L], NL) ->
    reverse(L, [X | NL]).
    
% 3-8

parse(L) ->
    parse(L, []).

% [(, 2, +, 3, )]

parse([], NL) when not is_tuple(NL) ->
    erlang:list_to_tuple(NL);
parse([], NL) ->
    NL;
parse([X | _], NL) when X == 41 ->
    erlang:list_to_tuple(NL);
parse([X | L], NL) when X == 40 ->
    Tuple = erlang:list_to_tuple(NL),
    NextTuple = parse(L),
    if tuple_size(Tuple) == 0 ->
       NextTuple;
    true ->
       erlang:append_element(Tuple, NextTuple)
    end;
parse([X | L], NL) when X == 43 ->
    parse(L, [plus | NL]);
parse([X | L], NL) when X == 45 ->
    parse(L, [minus | NL]);
parse([X | L], NL) when X == 42 ->
    parse(L, [multiply | NL]);
parse([X | L], NL) when X == 32 ->
    parse(L, NL);
parse([X | L], NL) ->
    parse(L, NL ++ [{num, element(1, string:to_integer([X]))}]).
