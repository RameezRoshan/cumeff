# Function to calculate Ne, inbreeding per generation, and cumulative inbreeding
calculate_inbreeding <- function(Nm, Nf) {
  # Number of generations
  n <- length(Nm)

  # Initialize vectors to store results
  Ne_per_generation <- numeric(n)        # Effective population size per generation
  Inbreeding_per_generation <- numeric(n) # Inbreeding per generation
  Cumulative_inbreeding <- numeric(n)     # Cumulative inbreeding


  Inverse_Ne <- numeric(n)
  sumOfInverse <- numeric(n)
  HM <- numeric(n)


  # Loop over each generation to calculate Ne and inbreeding
  for (i in 1:n) {
    # Calculate Ne for the i-th generation
    Ne_per_generation[i] <- (4 * Nm[i] * Nf[i]) / (Nm[i] + Nf[i])

    # Calculate the inbreeding coefficient for the i-th generation
    Inbreeding_per_generation[i] <- 1 / (2 * Ne_per_generation[i])

    # Calculate the inverse of Ne for i-th generation
    Inverse_Ne[i] =  Ne_per_generation[i]^(-1)

    # Calculate the cumulative inbreeding coefficient
    if (i == 1) {
      # For the first generation, the harmonic mean of Ne is just the Ne of that generation
      sumOfInverse[i]= Inverse_Ne[i]
      HM[i]=i/sumOfInverse[i]
      # For the first generation, cumulative inbreeding is just the inbreeding of that generation
      Cumulative_inbreeding[i] = Inbreeding_per_generation[i]
    } else {
      # Calculate the harmonic mean for subsequent generations
      sumOfInverse[i]=sum(Inverse_Ne)
      HM[i]=i/sumOfInverse[i]
      # For subsequent generations, cumulative inbreeding takes into account past generations
      Cumulative_inbreeding[i] <- (1/(2*HM[i])) + (1 - (1/(2*HM[i]))) *  Cumulative_inbreeding[i - 1]
    }
  }

  # Create a dataframe to show the results for each generation
  result <- data.frame(
    Generation = 1:n,
    Males = Nm,
    Females = Nf,
    Ne = round(Ne_per_generation,2),
    Inbreeding = round(Inbreeding_per_generation,4)*100,
    Net = round(HM,2),
    newF = round((1/(2*HM)),4)*100,
    cumF = round(Cumulative_inbreeding,4)*100
  )

  return(result)
}
