N=10; x='x+O('x^N);
a(n) = sigma(n);
Vec(serlaplace(exp(sum(n=1, N, u*a(n)*x^n/n))))

a(n) = sumdiv(n, d, (-1)^(d+1)*n/d);
Vec(serlaplace(exp(sum(n=1, N, u*a(n)*x^n/n))))
