test_that("hackr story functions work", {
  expect_error(hackr_best_stories(1, quiet = TRUE), NA)
  expect_error(hackr_top_stories(1, quiet = TRUE), NA)
  expect_error(hackr_new_stories(1, quiet = TRUE), NA)
})
