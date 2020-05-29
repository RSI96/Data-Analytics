data {
    real nu;
    real mu;
    real sigma; 
}

generated quantities {
    real y_student_t = student_t_rng(nu, mu, sigma);
    real y_normal = normal_rng(mu, sigma);
    real y_cauchy = cauchy_rng(mu, sigma);
}