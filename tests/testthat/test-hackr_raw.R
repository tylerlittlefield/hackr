test_that("hackr_raw works", {

  # Don't expect error if forward slash at beginning
  expect_error(hackr_raw("/item/8863.json"), NA)

  # Expect error if forward slash missing from beginning
  expect_error(hackr_raw("item/8863.json"))
})
