using PATHSolver
using Base.Test

M = [0  0 -1 -1 ;
     0  0  1 -2 ;
     1 -1  2 -2 ;
     1  2 -2  4 ]

q = [2; 2; -2; -6]

myfunc(x) = M*x + q

n = 4
lb = zeros(n)
ub = 100*ones(n)

path_options(   "convergence_tolerance 1e-2",
                "output yes",
                "time_limit 3600"      )

z, f = solveMCP(myfunc, lb, ub)

@show z
@show f




# write your own tests here
@test z == [2.8, 0.0, 0.8, 1.2]
