utils::globalVariables(c(".", "time", "kids", "id", "text"))

hackr_unnest <- function(x, unnest) {
  has_kids <- any(grepl("kids", names(x)) == TRUE)

  if (has_kids & !unnest)
    tidyr::nest(x, kids)
  else
    x
}

hackr_parse <- function(x, n) {
  x %>%
    .[1:n] %>%
    paste0("/item/", ., ".json") %>%
    purrr::map(hackr_raw) %>%
    purrr::map(dplyr::as_tibble) %>%
    dplyr::bind_rows()
}

hackr_parse_time <- function(x) {
  dplyr::mutate(x, time = as.POSIXct(time, origin = "1970-01-01"))
}

hackr_join_comments <- function(x, comments) {
  has_kids <- any(grepl("kids", names(x)) == TRUE)
  has_data <- any(grepl("data", names(x)) == TRUE)

  if (has_data & comments)
    cat("Can't fetch comments, unnest kids column with unnest = TRUE.\n")

  if (has_kids & comments) {
    cat("Fetching comments...\n")

    y <- x %>%
      .[["kids"]] %>%
      paste0("/item/", ., ".json") %>%
      purrr::map(hackr_raw) %>%
      purrr::map(dplyr::as_tibble) %>%
      dplyr::bind_rows() %>%
      dplyr::select(id, text) %>%
      dplyr::distinct() %>%
      purrr::set_names("kids", "comment")

    dplyr::left_join(x, y)
  }
  else {
    x
  }
}
