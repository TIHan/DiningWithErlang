-module(pe).

-export([problem1/0]).
-export([problem2/0]).
-export([problem3/0]).
-export([problem4/0]).
-export([problem5/0]).
-export([problem6/0]).
-export([problem7/0]).
%-export([problem8/0]).

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
% Slow =(
is_prime(X) ->
	is_prime(2, X).

is_prime(_, Y) when Y =< 1 ->
	false;
is_prime(X, Y) when X == Y ->
	true;
is_prime(X, Y) when Y rem X == 0 ->
	false;
is_prime(X, Y) ->
	is_prime(X + 1, Y).

problem3() ->
	Num = 600851475143,
	problem3(0, 1, Num, trunc(math:sqrt(Num))).

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
% Note: Slowhttp://projectehttp://projecteuler.net/problem=8uler.net/problem=8
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

%% http://projecteuler.net/problem=6
sum_of_squares(100) ->
  math:pow(100, 2);
sum_of_squares(X) ->
  math:pow(X, 2) + sum_of_squares(X + 1).

sum(100) ->
  100;
sum(X) ->
  X + sum(X + 1).
    
problem6() ->
  math:pow(sum(1), 2) - sum_of_squares(1).

%% http://projecteuler.net/problem=7
% Slow, URRHGHHGHG
problem7()->
  problem7(10001, 1, 0).

problem7(Prime, Num, Count) when Prime == Count ->
  Num - 1; % Eh, not happy about this.
problem7(Prime, Num, Count) ->
  IsPrime = is_prime(Num),
  if
		IsPrime == true ->
	    problem7(Prime, Num + 1, Count + 1);
		true ->
	    problem7(Prime, Num + 1, Count)
  end.

%% http://projecteuler.net/problem=8
%problem8() ->
%	problem8(integer_to_list(7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450), [], 0).


