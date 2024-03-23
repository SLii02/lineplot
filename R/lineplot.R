lineplot <- function(data, cols) {
  # Ensure 'data' is a dataframe
  if (!is.data.frame(data)) {
    stop("Data must be a dataframe")
  }

  combined_data <- lapply(cols, function(col) {
    # Ensure 'col' is a valid column in 'data'
    if (!col %in% names(data)) {
      stop(paste("Column", col, "not found in data"))
    }

    # Process each specified column
    temp_data <- data |>
      group_by(!!sym(col)) |>
      summarize(count = n(), .groups = "drop") |>
      mutate(variable = col) |>
      rename(Index = !!sym(col))

    return(temp_data)
  }) |>
    bind_rows()

  # Create the plot
  plot <- ggplot(combined_data, aes(x = Index, y = count, color = variable)) +
    geom_line() +
    xlab("Index") +
    ylab("Counts") +
    ggtitle("Index of Different Variables") +
    scale_color_manual(values = c("Income_2021" = "blue",
                                  "Education_2021" = "red",
                                  "Labour_Force_Activity_2021" = "yellow",
                                  "Housing_2021" = "green",
                                  "CWB_2021" = "black")) +
    theme_minimal()

  return(plot)
}


