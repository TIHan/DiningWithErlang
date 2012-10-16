-module(pe).

-export([problem1/0]).
-export([problem2/0]).
-export([problem3/0]).
-export([problem4/0]).
-export([problem5/0]).

%% http://projecteuler.net/problem=1
problem1() ->
	problem1(1, 1000, 0).

problem1(X, Y, Sum) when X == Y ->
	Sum;
problem1(X, Y, Sum) when X rem 3 == 0 ->
	problem1(X + 1, Y, Sum + X);
problem1(X, Y, Sum) when X rem 5 == 0 ->
	problem1(X + 1, Y, Sum + X);
problem1(X, Y, Sum) ->
	problem1(X + 1, Y, Sum).

%% http://projecteuler.net/problem=2
problem2() ->
	problem2(1, 2, 0).

problem2(_, Y, Sum) when Y > 4000000 ->
	Sum;
problem2(X, Y, Sum) when Y rem 2 == 0 ->
	problem2(Y, Y + X, Sum + Y);
problem2(X, Y, Sum) ->
	problem2(Y, Y + X, Sum).

%% http://projecteuler.net/problem=3
is_prime(X) ->
	is_prime(2, X).

is_prime(X, Y) when X == Y ->
	true;
is_prime(X, Y) when Y rem X == 0 ->
	false;
is_prime(X, Y) ->
	is_prime(X + 1, Y).

problem3() ->
	Num = 600851475143,
	problem3(0, 2, Num, trunc(math:sqrt(Num))).

problem3(X, Y, _, MaxNum) when Y == MaxNum ->
	X;
problem3(X, Y, Num, MaxNum) when Num rem Y == 0 ->
	Prime = is_prime(Y),
	if
		Prime == true ->
			problem3(Y, Y + 1, Num, MaxNum);
		true ->
			problem3(X, Y + 1, Num, MaxNum)
	end;
problem3(X, Y, Num, MaxNum) ->
	problem3(X, Y + 1, Num, MaxNum).

%% http://projecteuler.net/problem=4
is_palindrome(X) ->
	List = integer_to_list(X),
	ReverseList = lists:reverse(integer_to_list(X)),
	is_palindrome(List, ReverseList).

is_palindrome([], []) ->
	true;
is_palindrome([X | _], [Y | _]) when X =/= Y ->
	false;
is_palindrome([_ | List], [_ | ReverseList]) ->
	is_palindrome(List, ReverseList).

problem4() ->
	problem4(999, 999, 0).

problem4(X, Y, MaxPalindrome) when X == 100 ->
	problem4(999, Y - 1, MaxPalindrome);
problem4(_, Y, MaxPalindrome) when Y == 100 ->
	MaxPalindrome;
problem4(X, Y, MaxPalindrome) ->
	Num = X * Y,
	Palindrome = is_palindrome(Num),
	if
		Palindrome == true ->
			if
				Num > MaxPalindrome ->
					problem4(X - 1, Y, Num);
				true ->
					problem4(X - 1, Y, MaxPalindrome)
			end;
		true ->
			problem4(X - 1, Y, MaxPalindrome)
	end.

%% http://projecteuler.net/problem=5
% Note: Slow
problem5() ->
	problem5(1, 1).

problem5(Num, Div) when Num rem 2 == 0 ->
	if
		(Num rem Div == 0) and (Div =< 20) ->
			if
				Div == 20 ->
					Num;
				true ->
					problem5(Num, Div + 1)
			end;
		true ->
			problem5(Num + 1, 1)
	end;
problem5(Num, _) ->
	problem5(Num + 1, 1).