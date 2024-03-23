
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lineplot

<!-- badges: start -->
<!-- badges: end -->

\*\*NOTE: This lineplot function is part of a demonstration package
designed for educational and illustrative purposes within the context of
data visualization techniques in R. It serves to showcase the
implementation of custom visualization functions using ggplot2 and data
manipulation with dplyr. This package is not intended for production
use. For comprehensive data manipulation and visualization needs,
consider exploring established packages such as `ggplot2`, `dplyr`,
`tidyr`, and `plotly`.

## Installation

You can install the development version of our visualization package
from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github(SLii02/lineplot)
```

## Usage

Creating line plots for categorical or discrete numerical variables to
explore the distribution and counts within datasets is a common task in
data analysis. Our package’s `lineplot()` function simplifies this
process by allowing users to generate line plots directly from a data
frame.

``` r
# Assume we have a dataframe 'df' with columns 'Category1', 'Category2', and 'Count'
(df <- data.frame(
  Category1 = c("A", "A", "B", "B"),
  Category2 = c("X", "Y", "X", "Y"),
  Count = c(10, 20, 15, 25)
))

# To plot 'Category1' and 'Category2' using our lineplot function
cols_to_plot <- c("Category1", "Category2")
lineplot(df, cols_to_plot)
```

Notice how `lineplot()` takes the dataframe and the list of columns you
wish to plot, and generates a line plot where each line represents the
counts of unique values in the specified columns, with each line colored
differently for distinction.

This function is part of our visualization package, designed to handle
common plotting tasks with minimal coding effort. It uses `ggplot2` for
plotting, ensuring high-quality and customizable visuals.

``` r
# For more advanced usage, you can customize your plots further with ggplot2
library(ggplot2)

custom_plot <- lineplot(df, cols_to_plot) + 
  theme_minimal() +
  labs(title = "Custom Line Plot",
       subtitle = "Plot generated using lineplot function",
       x = "Variable",
       y = "Counts")

custom_plot
```

Use `lineplot()` when you need a quick and informative visualization of
counts across different categories or discrete numerical variables
within your data. This function is built to be flexible and integrates
seamlessly with the `ggplot2` ecosystem for further customization.
