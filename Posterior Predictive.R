prior_mean <- 150
prior_sd <- 40
sample_mean <- 120
sample_sd <- 20
sample_size <- 10
# Calculate posterior distribution parameters
posterior_mean <- (prior_sd^2 * sample_mean + sample_sd^2 * prior_mean) / (prior_sd^2 + sample_sd^2)
posterior_sd <- sqrt((prior_sd^2 * sample_sd^2) / (prior_sd^2 + sample_sd^2))
# Display posterior distribution parameters
posterior_mean
posterior_sd
# Calculate posterior predictive distribution parameters for Y
population_sd <- 20  # Given population standard deviation
predictive_mean <- posterior_mean
predictive_sd <- sqrt(posterior_sd^2 + population_sd^2)
# Display posterior predictive distribution parameters for Y
predictive_mean
predictive_sd
# Calculate 95% posterior interval for θ
lower_posterior <- qnorm(0.025, posterior_mean, posterior_sd)
upper_posterior <- qnorm(0.975, posterior_mean, posterior_sd)
# Calculate 95% posterior predictive interval for Y
lower_predictive <- qnorm(0.025, predictive_mean, predictive_sd)
upper_predictive <- qnorm(0.975, predictive_mean, predictive_sd)
# Display 95% posterior interval for θ and 95% posterior predictive interval for Y
lower_posterior
upper_posterior
lower_predictive
upper_predictive

