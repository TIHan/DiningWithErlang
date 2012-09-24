% Dining Philosopher's Problem (WORK IN PROGRESS HOLY SHIT)
% By: William F. Smith

-module(dpp).

-export([double/1, fac/1, mult/2]).
-export([convert/2]).
-export([convert_length/1]).
-export([list_length/1]).
-export([format_temps/1]).
-export([list_max/1]).
-export([reverse/1]).
-export([convert_list_to_c/1]).
-export([get_min_to_max_temp_cities/1]).

double(X) -> 2 * X.

fac(1) ->
	1;
fac(N) ->
	N * fac (N - 1).

mult(X, Y) ->
	io:format("Hey\n"),
	X * Y.

convert(M, inch) ->
	M / 2.54;

convert(N, centimeter) ->
	N * 2.54.

convert_length({centimeter, X}) ->
	{inch, X / 2.54};
convert_length({inch, Y}) ->
	{centimeter, Y * 2.54}.

list_length([]) ->
	0;
list_length([First | Rest]) ->
	1 + list_length(Rest).

format_temps([])->
    ok;
format_temps([City | Rest]) ->
    print_temp(convert_to_celsius(City)),
    format_temps(Rest).

convert_to_celsius({Name, {c, Temp}}) ->
    {Name, {c, Temp}};
convert_to_celsius({Name, {f, Temp}}) ->
    {Name, {c, (Temp - 32) * 5 / 9}}.

print_temp({Name, {c, Temp}}) ->
    io:format("~-15w ~w c~n", [Name, Temp]);
print_temp({Name, {f, Temp}}) ->
    io:format("~-15w ~w f~n", [Name, Temp]).

convert_list_to_c([{Name, {f, Temp}} | Rest]) ->
    Converted_City = convert_to_celsius({Name, {f, Temp}}),
    print_temp(Converted_City),
    [Converted_City | convert_list_to_c(Rest)];
convert_list_to_c([{Name, {c, Temp}} | Rest]) ->
    io:format("OH MY GOD ITS A CELSIUS :O~n"),
    print_temp({Name, {c, Temp}}),
    [{Name, {c, Temp}} | convert_list_to_c(Rest)];
convert_list_to_c([]) ->
    [].

% [{moscow, {c, -10}}, {london, {c, 10}}, {mohave, {c, 100}}]
get_min_to_max_temp_cities([{Name, {c, Temp}} | Rest]) ->
    get_min_to_max_temp_cities([Name], Rest, Temp).

get_min_to_max_temp_cities(List, [{Name, {c, Temp}} | Rest], Min) when Temp < Min ->
    New_List = [Name] ++ List,
    get_min_to_max_temp_cities(New_List, Rest, Temp);

get_min_to_max_temp_cities(List, [{Name, {c, Temp}} | Rest], Min) ->
    New_List = List ++ [Name],
    get_min_to_max_temp_cities(New_List, Rest, Min);

get_min_to_max_temp_cities(List, [], Min) ->
    List.

    
    
list_max([Head | Rest]) ->
    list_max(Rest, Head).

list_max([], Res) ->
    Res;
list_max([Head | Rest], Result_so_far) when Head > Result_so_far ->
    list_max(Rest, Head);
list_max([Head | Rest], Result_so_far) ->
    list_max(Rest, Result_so_far).

reverse(List) ->
    reverse(List, []).

reverse([Head | Rest], Reversed_List) ->
    reverse(Rest, [Head | Reversed_List]);
reverse([], Reversed_List) ->
    Reversed_List.








