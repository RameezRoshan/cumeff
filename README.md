
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cumeff

<!-- badges: start -->
<!-- badges: end -->

The goal of cumeff is to calculate the effective population size (Ne),
population average inbreeding (percentage F) per generation, harmonic
mean of Ne (Net) and cumulative inbreeding (percentage Ft) for
generation ‘t’ from the numbers of male and female parents contributing
offspring in each generation.The output format is a dataframe.

## Installation

You can install the development version of cumeff from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("RameezRoshan/cumeff")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(cumeff)
Nm <- c(26,40,32,32,58,54,54,64,16)  # Number of male parents in each generation
Nf <- c(16,40,40,40,64,54,54,54,18)  # Number of female parents in each generation

result <- calculate_inbreeding(Nm, Nf)
print(result)
#>   Generation Males Females     Ne Inbreeding   Net newF cumF
#> 1          1    26      16  39.62       1.26 39.62 1.26 1.26
#> 2          2    40      40  80.00       0.63 52.99 0.94 2.19
#> 3          3    32      40  71.11       0.70 57.91 0.86 3.04
#> 4          4    32      40  71.11       0.70 60.73 0.82 3.84
#> 5          5    58      64 121.70       0.41 67.49 0.74 4.55
#> 6          6    54      54 108.00       0.46 71.99 0.69 5.21
#> 7          7    54      54 108.00       0.46 75.59 0.66 5.84
#> 8          8    64      54 117.15       0.43 79.10 0.63 6.43
#> 9          9    16      18  33.88       1.48 68.89 0.73 7.11
```
