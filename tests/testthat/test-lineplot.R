sample_data <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 22),
  Height = c(170, 180, 175)
)

test_that("Function returns a ggplot object", {
  plot <- lineplot(sample_data, c("Age", "Height"))
  expect_s3_class(plot, "gg")
})

test_that("Function stops with an error if 'data' is not a dataframe", {
  expect_error(lineplot(matrix(1:10, ncol = 2), c("V1", "V2")),
               "Data must be a dataframe")
})

test_that("Function stops with an error if any column in 'cols' is not found in 'data'", {
  expect_error(lineplot(sample_data, c("Age", "Weight")),
               "Column Weight not found in data")
})

test_that("Function works with different numbers of columns", {
  plot_single_col <- lineplot(sample_data, c("Age"))
  plot_multiple_cols <- lineplot(sample_data, c("Age", "Height"))

  expect_s3_class(plot_single_col, "gg")
  expect_s3_class(plot_multiple_cols, "gg")
})

test_that("Function handles different types of categorical data", {
  df_categorical <- data.frame(
    Category = factor(c("A", "B", "A")),
    Value = c(1, 2, 1)
  )
  plot <- lineplot(df_categorical, c("Category"))
  expect_s3_class(plot, "gg")
})
