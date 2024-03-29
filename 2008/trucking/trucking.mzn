%------------------------------------------------------------------------------%
% trucking.mzn
% Jakob Puchinger
% December 2007
% vim: ft=zinc ts=4 sw=4 et tw=0
% Original model comes from Peters Student Tim
% There are N Trucks which have to can be used in every time period,
% Each truck can transport a given Load of material.
% Each truck has an associated cost.
% In each time period a demand has to be fulfilled.
% Truck1 and Truck2 have some further constraints, disallowing
% them to be used more than once in consecutive or two consecutive time periods.
% The goal is to minimise the cost
%------------------------------------------------------------------------------%

    % Time Periods
int: T;
    % Trucks
int: N;

1..N: Truck1;
1..N: Truck2;

array[1..T] of int: Demand;
array[1..N] of int: Cost;
array[1..N] of int: Loads;

array[1..N, 1..T] of var 0..1: x;

constraint
    forall(t in 1..T)(
        sum(i in 1..N)( Loads[i] * x[i,t]) >= Demand[t] 
            %:: colgen_subproblem_constraint("sp1", "mip", t)
    );

constraint
    forall(tau in 1..T-2)(
        sum(t in tau..tau+2)( x[Truck1, t] ) <= 1
    );

constraint
    forall(tau in 1..T-1)(
        sum(t in tau..tau+1)( x[Truck2, t] ) <= 1
    );

solve :: int_search( [ x[i,t] | i in 1..N, t in 1..T ], "smallest", "indomain_min", "complete")
minimize total_cost;

var int: total_cost;
constraint
    total_cost = sum(i in 1..N)(sum(t in 1..T )( Cost[i] * x[i,t] ));

output 
[ "% Cost = ",  show(total_cost), "\n" ] ++ 
[ "% X = \n%\t" ] ++
[ show(x[i, t]) ++ if t = T then "\n%\t" else " " endif |
    i in 1..N, t in 1..T ] ++ ["\n"] ++
["x = array2d(1..", show(N), ", 1..", show(T), ", ", show(x), ");\n"] ++
["total_cost = ", show(total_cost), ";\n"];
