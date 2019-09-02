
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hackr

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/tyluRp/hackr.svg?branch=master)](https://travis-ci.org/tyluRp/hackr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/tyluRp/hackr?branch=master&svg=true)](https://ci.appveyor.com/project/tyluRp/hackr)
[![Codecov test
coverage](https://codecov.io/gh/tyluRp/hackr/branch/master/graph/badge.svg)](https://codecov.io/gh/tyluRp/hackr?branch=master)
<!-- badges: end -->

The goal of hackr is to wrap the Hacker News API in R.

## Installation

You can install the development version from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("tylurp/hackr")
```

## Example

You can fetch top stories, new stories, or best stories. By default, a
`tibble` is returned, if there is a *kids* column (comments identifier),
it will be nested in order to return a single row for each story. You
can override this with `unnest = FALSE`:

``` r
library(hackr)

hackr_top_stories()
#> Fetching top 10 stories...
#> # A tibble: 10 x 10
#>    by    descendants     id score time                title type  url  
#>    <chr>       <int>  <int> <int> <dttm>              <chr> <chr> <chr>
#>  1 user…          13 2.09e7    35 2019-09-01 18:11:43 Frid… story http…
#>  2 BafS           30 2.09e7   305 2019-09-01 11:58:06 Leon… story http…
#>  3 rspi…          70 2.09e7   380 2019-09-01 09:48:00 What… story http…
#>  4 arch…           5 2.09e7    89 2019-09-01 13:23:45 Esch… story http…
#>  5 badr…          65 2.09e7    74 2019-09-01 14:00:39 Wind… story http…
#>  6 resp…           0 2.08e7    14 2019-08-31 17:21:46 Pers… story http…
#>  7 mhb           109 2.09e7   144 2019-09-01 13:01:10 The … story http…
#>  8 ramp…         218 2.09e7   929 2019-09-01 12:27:00 Tell… story <NA> 
#>  9 Reedx          28 2.09e7    43 2019-09-01 13:46:53 Easy… story http…
#> 10 self           26 2.09e7    74 2019-09-01 10:56:28 Magr… story http…
#> # … with 2 more variables: text <chr>, data <list>
hackr_new_stories(2)
#> Fetching 2 new stories...
#> # A tibble: 2 x 9
#>   by    descendants     id score time                title type  url  
#>   <chr>       <int>  <int> <int> <dttm>              <chr> <chr> <chr>
#> 1 Comp…           0 2.09e7     1 2019-09-01 19:11:52 Why … story http…
#> 2 Zaid…           0 2.09e7     1 2019-09-01 19:09:11 Indi… story <NA> 
#> # … with 1 more variable: text <chr>
hackr_best_stories(2)
#> Fetching 2 best stories...
#> # A tibble: 2 x 9
#>   by    descendants     id score time                title type  url  
#>   <chr>       <int>  <int> <int> <dttm>              <chr> <chr> <chr>
#> 1 troy…         177 2.08e7   784 2019-08-29 18:22:57 A de… story http…
#> 2 edmo…         259 2.08e7   711 2019-08-30 08:33:02 The … story http…
#> # … with 1 more variable: data <list>
```

That’s it for now. Will add more features soon.
