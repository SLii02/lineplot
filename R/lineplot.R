utils::globalVariables(c("Index", "count", "variable"))

#' Generate a Line Plot
#'
#' This function takes a dataframe and a list of column names as input and
#' generates a line plot. The plot displays the counts of unique values in
#' the specified columns. Each line in the plot represents one of the
#' specified columns, differentiated by color.
#'
#' @param data A dataframe with rows of data and columns of variables. The
#' The dataframe should contain the columns specified in `cols`.
#' @param cols A vector of column names in `data` to be plotted.
#' These columns should contain categorical or discrete numerical values
#' for which counts will be plotted.
#'
#' @return A `ggplot` object representing a line plot of counts of unique
#' values for the specified columns in `data`. Each line is colored
#' differently to distinguish between the variables represented by the
#' columns in `cols`.
#' @export
#'
#' @examples
#' data <- data.frame(
#'   Names = c("Alice", "Bob", "Charlie"),
#'   Ages = c(25, 30, 22),
#'   Height = c(21, 33, 21))
#'
#' cols <- c("Ages", "Height")
#' lineplot(data, cols)
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
      dplyr::group_by(!!rlang::sym(col)) |>
      dplyr::summarize(count = dplyr::n(), .groups = "drop") |>
      dplyr::mutate(variable = col) |>
      dplyr::rename(Index = !!rlang::sym(col))

    return(temp_data)
  }) |>
    dplyr::bind_rows()

  # Create the plot
  plot <- ggplot2::ggplot(combined_data,
                          ggplot2::aes(x = Index,
                                       y = count,
                                      color = variable)) +
    ggplot2::geom_line() +
    ggplot2::xlab("Index") +
    ggplot2::ylab("Counts") +
    ggplot2::ggtitle("Index of Different Variables") +
    ggplot2::scale_color_manual(values = c("Income_2021" = "blue",
                                  "Education_2021" = "red",
                                  "Labour_Force_Activity_2021" = "yellow",
                                  "Housing_2021" = "green",
                                  "CWB_2021" = "black")) +
    ggplot2::theme_minimal()

  return(plot)
}


