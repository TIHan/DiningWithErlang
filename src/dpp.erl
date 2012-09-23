%% Dining Philosopher's Problem (WORK IN PROGRESS HOLY SHIT)
%% By: William F. Smith

-module(dpp).
-export([double/1, fac/1, mult/2]).
-export([convert/2]).
-export([convert_length/1]).

double(X) -> 2 * X.

fac(1) ->
	1;
fac(N) ->
	N * fac (N - 1).

mult(X, Y) ->
	X * Y.

convert(M, inch) ->
	M / 2.54;

convert(N, centimeter) ->
	N * 2.54.

convert_length({centimeter, X}) ->
	{inch, X / 2.54};
convert_length({inch, Y}) ->
	{centimeter, Y * 2.54}.