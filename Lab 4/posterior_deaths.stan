data {
    int N;
    int deaths[N];
}

parameters{
    real<lower=0> lambda;
}

model {
    lambda ~ normal(692,250);
    deaths ~ poisson(lambda);
}

generated quantities {
    int deaths_gen = poisson_rng(lambda);
}