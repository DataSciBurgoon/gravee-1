context("calculate_menger_curvature.R")

test_that("Does Menger Curvature calculation perform as expected?", {
  # Does the function stop if the input vectors are incorrect length?
  expect_error(calculate_menger_curvature(1:2, 1:2))
  expect_error(calculate_menger_curvature(1:4, 1:4))
  # Does the function return only a single value?
  expect_length(calculate_menger_curvature(c(1, 1.5, 8), c(5, 5.8, 12)), 1)
  # Are straight lines and identical points calculated correctly?
  expect_equal(calculate_menger_curvature(c(1, 2, 3), c(1, 2, 3)), 0)
  expect_true(is.nan(calculate_menger_curvature(c(1, 1, 1), c(1, 1, 1))))
  # Do we get the expected output?
  x <- c(1, 2, 3)
  y <- c(1, 4, 9)
  z <- round(calculate_menger_curvature(x, y), 2)
  expect_equal(z, 0.03)
  # Do the output make sense?
  y_2 <- c(2, 3, 9)
  a <- calculate_menger_curvature(x, y_2)
  expect_gt(a, z)
})
