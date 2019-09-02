
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
can override this with `unnest = TRUE` and show comments with `comments
= TRUE`:

``` r
library(hackr)
library(dplyr)

hackr_top_stories()
#> Fetching top 10 stories...
#> # A tibble: 10 x 10
#>    by    descendants     id score time                title type  url  
#>    <chr>       <int>  <int> <int> <dttm>              <chr> <chr> <chr>
#>  1 JPLe…          46 2.09e7   117 2019-09-02 07:36:29 Effe… story http…
#>  2 mrzo…          72 2.09e7   106 2019-09-02 07:38:12 Tire… story http…
#>  3 curr…          19 2.09e7   113 2019-09-02 06:07:45 The … story http…
#>  4 ingve          24 2.09e7   119 2019-09-02 03:14:10 An i… story http…
#>  5 pris…           3 2.09e7    14 2019-09-01 22:53:02 More… story http…
#>  6 star…          23 2.09e7   187 2019-09-02 00:28:52 Buil… story http…
#>  7 octo…          41 2.09e7   111 2019-09-02 07:14:55 Just… story http…
#>  8 prom…          13 2.09e7    97 2019-09-02 02:35:01 Show… story <NA> 
#>  9 craz…           0 2.09e7     6 2019-09-02 07:58:22 Quas… story http…
#> 10 curt…           9 2.08e7    57 2019-08-31 15:41:44 Idah… story http…
#> # … with 2 more variables: text <chr>, data <list>
hackr_top_stories(n = 1, unnest = TRUE, comments = TRUE) %>% 
  select(title, comment)
#> Fetching top 1 stories...
#> Fetching comments...
#> # A tibble: 11 x 2
#>    title                         comment                                   
#>    <chr>                         <chr>                                     
#>  1 Effects of short-term fastin… I had a wake-up call when my Doctor said …
#>  2 Effects of short-term fastin… The article explains that fasting is ofte…
#>  3 Effects of short-term fastin… I really like practical, simple solutions…
#>  4 Effects of short-term fastin… From what I understand cancer grows based…
#>  5 Effects of short-term fastin… I know there are certain countries&#x2F;r…
#>  6 Effects of short-term fastin… Short Term Fasting helps the treatment of…
#>  7 Effects of short-term fastin… I didn’t see it mentioned in the study bu…
#>  8 Effects of short-term fastin… <NA>                                      
#>  9 Effects of short-term fastin… The progress in nutrition is very encoura…
#> 10 Effects of short-term fastin… TLDR Nutrient restriction causes healthy …
#> 11 Effects of short-term fastin… Oh how many times have I been banned and …
hackr_new_stories(2)
#> Fetching 2 new stories...
#> # A tibble: 2 x 9
#>   by    descendants     id score time                title type  url  
#>   <chr>       <int>  <int> <int> <dttm>              <chr> <chr> <chr>
#> 1 mcca…           0 2.09e7     1 2019-09-02 09:16:36 iPad… story http…
#> 2 jmil…           0 2.09e7     1 2019-09-02 09:16:10 Perc… story <NA> 
#> # … with 1 more variable: text <chr>
hackr_best_stories(2)
#> Fetching 2 best stories...
#> # A tibble: 2 x 10
#>   by    descendants     id score text  time                title type 
#>   <chr>       <int>  <int> <int> <chr> <dttm>              <chr> <chr>
#> 1 ramp…         355 2.09e7  1641 I’m … 2019-09-01 12:27:00 Tell… story
#> 2 troy…         180 2.08e7   792 <NA>  2019-08-29 18:22:57 A de… story
#> # … with 2 more variables: url <chr>, data <list>
```

That’s it for now. Will add more features soon.
