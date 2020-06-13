data {
    int N;
    real miles[N];
}

generated quantities {
    real beta = beta_rng(2,10); 
    // beta distribution becouse death rate in our data is less than 1 nad more than 0, 
    int deaths[N];
    for(i in 1:N) {
        deaths[i] = poisson_rng(miles[i]*beta);
    }
}