#' Get Hacker News via Raw Endpoint
#'
#' Provide the raw endpoint, do not include the prefix
#' (https://hacker-news.firebaseio.com/v0), hackr will add it for you. The
#' forward slash must be included, i.e. /item/8863.json
#'
#' @param x Endpoint
#' @param ... Any arguments you can pass to \code{jsonlite::fromJSON}
#'
#' @export
hackr_raw <- function(x, ...) {
  if (!grepl("^/", x))
    stop("Forward slash missing from beginning of: ", x)

  uri <- paste0("https://hacker-news.firebaseio.com/v0", x)
  jsonlite::fromJSON(uri, ...)
}

#' Get Top Stories
#'
#' Fetches the top 10 stories. You can fetch more by adjusting the n parameter.
#' By default, a tibble is returned and the "kids" column nested (if present).
#'
#' @param n The number of top stories to return, defaults to 10.
#' @param unnest Should "kids" column be nested? Defaults to TRUE.
#' @param comments Should comments be joined? Defaults to FALSE.
#' @param quiet Should function hide message? Defaults to FALSE.
#'
#' @export
hackr_top_stories <- function(n = 10, unnest = FALSE, comments = FALSE,
                              quiet = FALSE) {
  if (!quiet) cat("Fetching top", n, "stories...\n")

  hackr_raw("/topstories.json") %>%
    hackr_parse(n) %>%
    hackr_parse_time() %>%
    hackr_unnest(unnest) %>%
    hackr_join_comments(comments)
}

#' Get New Stories
#'
#' Fetches 10 new stories. You can fetch more by adjusting the n parameter. By
#' default, a tibble is returned and the "kids" column nested (if present).
#'
#' @param n The number of top stories to return, defaults to 10.
#' @param unnest Should "kids" column be nested? Defaults to TRUE.
#' @param comments Should comments be joined? Defaults to FALSE.
#' @param quiet Should function hide message? Defaults to FALSE.
#'
#' @export
hackr_new_stories <- function(n = 10, unnest = FALSE, comments = FALSE,
                              quiet = FALSE) {
  if (!quiet) cat("Fetching", n, "new stories...\n")

  hackr_raw("/newstories.json") %>%
    hackr_parse(n) %>%
    hackr_parse_time() %>%
    hackr_unnest(unnest) %>%
    hackr_join_comments(comments)
}

#' Get Best Stories
#'
#' Fetches 10 best stories. You can fetch more by adjusting the n parameter. By
#' default, a tibble is returned and the "kids" column nested (if present).
#'
#' @param n The number of top stories to return, defaults to 10.
#' @param unnest Should "kids" column be nested? Defaults to TRUE.
#' @param comments Should comments be joined? Defaults to FALSE.
#' @param quiet Should function hide message? Defaults to FALSE.
#'
#' @export
hackr_best_stories <- function(n = 10, unnest = FALSE, comments = FALSE,
                               quiet = FALSE) {
  if (!quiet) cat("Fetching", n, "best stories...\n")

  hackr_raw("/beststories.json") %>%
    hackr_parse(n) %>%
    hackr_parse_time() %>%
    hackr_unnest(unnest) %>%
    hackr_join_comments(comments)
}
