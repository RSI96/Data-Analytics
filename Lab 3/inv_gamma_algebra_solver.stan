functions {
    vector tail_delta(vector y, vector theta, real[] x_r, int[] x_i) {
        vector[2] deltas;
        deltas[1] = inv_gamma_cdf(theta[1], y[1], y[2]) - 0.99; //1%>10
        deltas[2] = inv_gamma_cdf(theta[2], y[1], y[2]) - 0.01; //1%<5
        return deltas;
  }
}

data {
    vector<lower=0>[2] y_guess; // Initial guess of Gamma distribution
    vector<lower=0>[2] theta;   // Target quantile
}

transformed data {
    vector[2] y;
    real x_r[0];
    int x_i[0];

  // Find Gamma distribution parameters that ensures 98% probabilty between 5 and 10
  y = algebra_solver(tail_delta, y_guess, theta, x_r, x_i, 1e-10, 1e-3, 1e3);
  print("Alpha  = ", y[1]);
  print("Beta = ", y[2]);
}

generated quantities {
  real alpha = y[1];
  real beta = y[2];
}