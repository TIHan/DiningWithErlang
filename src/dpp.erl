% Dining Philosopher's Problem (WORK IN PROGRESS)
% By: William F. Smith

-module(dpp).

-export([get_min/1]).
-export([replace_element/3]).
-export([bubble_sort/1]).
-export([selection_sort/1]).

% Other Functions
get_min([X | L]) ->
    get_min (L, X).
    
get_min([], M) ->
    M;

get_min([X|L], M) when X < M ->
    get_min (L, X);
get_min([_|L], M) ->
    get_min (L, M).

replace_element(L, I, V) ->
    replace_element([], L, I, V, 0).

replace_element(NL, [], _, _, _) ->
    NL;

replace_element(NL, [_ | L], I, V, CI) when CI == I ->
    NL ++ [V] ++ L;
replace_element(NL, [X | L], I, V, CI) ->
    replace_element(NL ++ [X], L, I, V, CI + 1).
% End Other Functions

%%% Sorting Algorithms

%% Bubble Sort
% http://en.wikipedia.org/wiki/Bubble_sort
% L - List
% NL - New List

% First Attempt
bubble_sort(L) ->
    bubble_sort([], L, false).

bubble_sort(NL, [X | []], false) ->
    NL ++ [X];

bubble_sort(NL, [X | []], true) ->
    bubble_sort([], NL ++ [X], false);

bubble_sort(NL, [X,Y |L], C) ->
    if
	Y < X ->
	    bubble_sort(NL ++ [Y], [X | L], true); 
	true ->
	    bubble_sort(NL ++ [X], [Y | L], C)
    end.
% End Bubble Sort

%% Selection Sort
% http://en.wikipedia.org/wiki/Selection_sort
% L - List
% HL - Head List
% TL - Tail List
% NL - New List

% First Attempt
selection_sort([X | L]) ->
    selection_sort([], [], [X], L).
 
selection_sort(NL, [], [X,Y | TL], []) ->
    selection_sort(NL ++ [X], [], [Y], TL);

selection_sort(NL, [], [X | []], []) ->
    selection_sort(NL ++ [X], [], [], []);

selection_sort(NL, [], [], []) ->
    NL;

selection_sort(NL, [X,Y | HT], [Z | TL], []) when Z < X ->
    selection_sort(NL ++ [Z], [], [Y], HT ++ [X | TL]);
selection_sort(NL, [X,Y | HT], [Z | TL], []) -> 
    selection_sort(NL ++ [X], [], [Y], HT ++ [Z | TL]);

selection_sort(NL, [X | []], [Y | TL], []) when Y < X ->
    selection_sort(NL ++ [Y], [], [X], TL);
selection_sort(NL, [X | []], [Y | TL], []) ->
    selection_sort(NL ++ [X], [], [Y], TL);

selection_sort(NL, HT, [X | TL], [Y | L]) when Y < X ->
    selection_sort(NL, HT ++ [X | TL], [Y], L);
selection_sort(NL, HT, TL, [X | L]) ->
    selection_sort(NL, HT, TL ++ [X], L).    
% End Selection Sort
    
%% Insertion Sort
% http://en.wikipedia.org/wiki/Insertion_sort
% TODO:
% End Insertion Sort
    
    
