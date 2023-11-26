data <- list(
  groupA = c(62, 60, 63, 59),
  groupB = c(63, 67, 71, 64, 65, 66),
  groupC = c(68, 66, 71, 67, 67, 68, 68),
  groupD = c(56, 62, 60, 61, 63, 64, 63, 59)
)

num_groups <- length(data)

num_samples <- 20
theta_samples <- matrix(0, nrow = num_samples, ncol = num_groups)

sigma_squared <- 16
prior_mean <- 62
prior_sd <- 4

for (i in 1:num_samples) {
  for (group in 1:num_groups) {
    current_theta <- rnorm(1, prior_mean, prior_sd)  
    
    log_likelihood <- sum(dnorm(data[[group]], mean = current_theta, sd = sqrt(sigma_squared), log = TRUE))
    
    log_prior <- sum(dnorm(current_theta, mean = prior_mean, sd = prior_sd, log = TRUE))
    
    proposed_theta <- rnorm(1, current_theta, 0.5)
    
    proposed_log_likelihood <- sum(dnorm(data[[group]], mean = proposed_theta, sd = sqrt(sigma_squared), log = TRUE))
    
    proposed_log_prior <- sum(dnorm(proposed_theta, mean = prior_mean, sd = prior_sd, log = TRUE))
    
    acceptance_ratio <- exp(proposed_log_likelihood + proposed_log_prior - log_likelihood - log_prior)
    
    if (runif(1) < acceptance_ratio) {
      current_theta <- proposed_theta
    }
    
    theta_samples[i, group] <- current_theta
  }
}
print(theta_samples)
