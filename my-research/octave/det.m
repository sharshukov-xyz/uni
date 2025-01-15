pkg load symbolic;

syms lambda real; % lambda
syms h positive real;
syms a0 a1 real;

alpha1 = a0 / a1 - a0;

syms c1 c2 real;
syms w real;

A = [
     [lambda - (lambda/a1) * e^(lambda * h) + a0 / a1 * e^(lambda * h);
      1 + (a0 * h) / a1 * e^(lambda * h) - e^(lambda * h) / a1 - (lambda * h) / a1 * e^(lambda * h)]';
     [2 * a0 * lambda + a1 * e^(lambda * h) + lambda - a0;
     2 * a0 + a1 * h * e^(lambda * h) + 1]'
  ]

A = subs(A, lambda, alpha1/2);
A = subs(A, a0, 2 * a1^2 / (1 + a1));
C = A \ [0; -w];

printf("Solution found.\n");

A * C

## d = det(A)
## sol = solve(d == 0)
## sol = subs(sol, lambda, alpha1/2)
## sol = subs(sol, a0, 2 * a1^2 / (1 + a1))
## simplify(sol)
