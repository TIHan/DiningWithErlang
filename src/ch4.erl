-module(ch4).

-export([min_steps/2]).

min_steps(X, Y) ->
    min_steps(Y - X, 1, 0, 0).

min_steps(Dist, _, Steps, Sum) when Dist =< Sum ->
    Steps;
min_steps(Dist, StepDist, Steps, Sum) when Dist =< Sum + StepDist ->
    Steps + 1;
min_steps(Dist, StepDist, Steps, Sum) ->
    min_steps(Dist, StepDist + 1, Steps + 2, Sum + (StepDist * 2)).

    


