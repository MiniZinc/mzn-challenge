
predicate eq1(var int:x, var int:y, int: n, array[int] of var int:z) =
      assert(index_set(z) == 1..n, " eq1: index set of third argument must be 1..n",
      assert(0 <= min(dom(x)) /\ max(dom(x)) <= n, " eq1: domain of first argument must be 0..n, but has range \(min(dom(x)))..\(max(dom(x)))",
      assert(0 <= min(dom(y)) /\ max(dom(y)) <= n, " eq1: domain of second argument must be 0..n, but has range \(min(dom(y)))..\(max(dom(y)))",

      forall(i in 1..n-1)(
             z[i] != 0 /\
             x != z[i] /\ y != z[i] /\
           forall(j in i+1..n-1)( z[i] != z[j] ) 
      ) 
      /\ z[n] == 0
      /\ x != 0
      /\ y != 0
      )));

predicate eq2(var int:x, var int:y, int: n, array[int] of var int:z) =
      assert(index_set(z) == 1..n, " eq2: index set of third variable must be 1..n",
      assert(0 <= min(dom(x)) /\ max(dom(x)) <= n, " eq2: domain of first argument must be 0..n, but has range \(min(dom(x)))..\(max(dom(x)))",
      assert(0 <= min(dom(y)) /\ max(dom(y)) <= n, " eq2: domain of second argument must be 0..n, but has range \(min(dom(y)))..\(max(dom(y)))",

      forall(i in 1..n) 
        (0 <= z[i] /\ z[i] <= 1)
      /\
      x = sum(i in 1..n) (z[i]) /\
      y = sum(i in 1..n) (z[i]) /\ 
      x != 0 /\ 
      y != 0
      )));

predicate eq3(var int:x, var int:y, int: n, array[int] of var int:z) =
	assert(index_set(z) == 1..n, " eq3: index set of first argument must be 1..n",
	assert(0 <= min(dom(x)) /\ max(dom(x)) <= n, " eq3: domain of first argument must be 0..n, but has range \(min(dom(x)))..\(max(dom(x)))",
	assert(0 <= min(dom(y)) /\ max(dom(y)) <= n, " eq3: domain of second argument must be 0..n, but has range \(min(dom(y)))..\(max(dom(y)))",

	x <= z[1] /\ 
	forall(i in 2..n)(z[i-1] <= z[i]) /\
	z[n] <= y /\
	x >= y /\
	x != 0 /\
	y != 0
	)));


predicate eq4(var int:x, var int:y, int: n, array[int] of var int:z) =
    assert(index_set(z) == 1..n, " eq4: index set of first argument must be 1..n",
	assert(0 <= min(dom(x)) /\ max(dom(x)) <= n, " eq4: domain of first argument must be 0..n, but has range \(min(dom(x)))..\(max(dom(x)))",
	assert(0 <= min(dom(y)) /\ max(dom(y)) <= n, " eq4: domain of second argument must be 0..n, but has range \(min(dom(y)))..\(max(dom(y)))",

	x == y \/ (x >= y /\ x <= y) \/ not (x != y) /\
	forall(i in 1..n)(z[i] == 0)
	/\ x != 0
	/\ y != 0
	)));


int: m; % number of copies of equality
int: n; % size of domains

array[1..m,0..n] of var 0..n: t :: output_var;

constraint
    forall(i in 1..m-1)(
        if i mod 4 == 1 then
            eq1(t[i, 0], t[i + 1, 0], n, [ t[i, j] | j in 1..n])
        elseif i mod 4 == 2 then
            eq2(t[i, 0], t[i + 1, 0], n, [ t[i, j] | j in 1..n])
        elseif i mod 4 == 3 then
            eq3(t[i, 0], t[i + 1, 0], n, [ t[i, j] | j in 1..n])
        else 
            eq4(t[i, 0], t[i + 1, 0], n, [ t[i, j] | j in 1..n])
        endif
    );

constraint t[1,0] != t[m,0];

solve :: int_search([ t[i,j] | i in 1..m, j in 0..n ], input_order, 
                    indomain_min, complete)
         satisfy;
