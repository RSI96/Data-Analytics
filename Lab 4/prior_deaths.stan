
generated quantities {
    real lambda = normal_rng(692,250); //Mean is the mean of data, sigma higher for better representation
    int deaths = poisson_rng(lambda);
}