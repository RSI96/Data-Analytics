data {
  int N;
  vector[N] miles;
  int deaths[N];
}

parameters {
  real beta;
}

transformed parameters {
  vector[N] lambda = miles*beta;
}

model {
  beta ~ beta(2,10);
  deaths ~ poisson(lambda);
}

generated quantities {
  real deaths_gen[N];
  for (i in 1:N) {
    deaths_gen[i] = poisson_rng(lambda[i]);
  }
}