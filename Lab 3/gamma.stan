data {
    int alfa;
    int beta;
}

generated quantities {
    real theta = gamma_rng(alfa,beta);
    real theta_inv = inv_gamma_rng(alfa,beta);
}