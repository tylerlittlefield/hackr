hackr_unnest <- function(x) {
  has_kids <- any(grepl("kids", names(x)) == TRUE)

  if (has_kids)
    tidyr::nest(x, kids)
  else
    x
}

hackr_parse <- function(x, n) {
  x %>%
    .[1:n] %>%
    paste0("/item/", ., ".json") %>%
    purrr::map(hackr_raw) %>%
    purrr::map(tibble::as_tibble) %>%
    dplyr::bind_rows()
}

hackr_parse_time <- function(x) {
  dplyr::mutate(x, time = as.POSIXct(time, origin = "1970-01-01"))
}
