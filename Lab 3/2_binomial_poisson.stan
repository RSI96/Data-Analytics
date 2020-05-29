data {
    real alfa;
    real beta;
    
}

generated quantities {
    real lambda = alfa*beta/(1-beta);
    real y_binomial = neg_binomial_rng(alfa,beta);
    real y_poisson = poisson_rng(lambda);
}