data {
    real alfa;
    real beta;
    
}

generated quantities {
    real lambda = alfa;
    real y_binomial = neg_binomial_2_rng(alfa,beta);
    real y_poisson = poisson_rng(lambda);
}