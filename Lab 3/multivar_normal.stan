data {
    int<lower=0> n;
    vector[n] mu; //location vector
    matrix[n,n] sigma; //covariance matrix
}

parameters {
    vector[n] y;
}

model {
    y ~ multi_normal(mu, sigma);
}