data {
    real<lower=0> alpha;
    real<lower=0> beta;
}

parameters {
    real y;
}

model {
    y ~ gamma(alpha, beta);
}