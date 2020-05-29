data {
    real lambd;
}

generated quantities {
    real theta = poisson_rng(lambd);
}