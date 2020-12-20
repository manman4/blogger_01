T(n) = if(n==0, 1, u*(n-1)!*sum(k=1, n, k*numdiv(k)*T(n-k)/(n-k)!));
print("A338864");
for(n=0, 10, print(n, " ", Vecrev(T(n))))

T(n) = if(n==0, 1, u*(n-1)!*sum(k=1, n, k*sigma(k)*T(n-k)/(n-k)!));
print("A338865");
for(n=0, 10, print(n, " ", Vecrev(T(n))))

T(n) = if(n==0, 1, u*sum(k=1, n, binomial(n-1, k-1)*numdiv(k)*T(n-k)));
print("A338870");
for(n=0, 10, print(n, " ", Vecrev(T(n))))

T(n) = if(n==0, 1, u*sum(k=1, n, binomial(n-1, k-1)*sigma(k)*T(n-k)));
print("A338871");
for(n=0, 10, print(n, " ", Vecrev(T(n))))
