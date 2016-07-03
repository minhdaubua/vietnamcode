library(vietnamcode)
context("Province name conversion")

test_that("Edge case for number of strings", {
  expect_equal(vietnamcode(c("Đà Nẵng"), "province_name", "province_name"), "Da Nang")
})

test_that("Returns non-match as NA", {
  expect_equal(vietnamcode(c(""), "province_name", "pci"), NA_character_)
  expect_equal(vietnamcode(c("haha"), "province_name", "pci"), NA_character_)
  expect_equal(vietnamcode(c("haha", "b"), "province_name", "pci"),
               c(NA_character_, NA_character_))
})

test_that("Handles null argument", {
  expect_error(vietnamcode(c(), "pci", "enterprise_census"), "sourcevar cannot be NULL")
  expect_error(vietnamcode(NULL, "pci", "enterprise_census"), "sourcevar cannot be NULL")
})

test_that("Handles province name with diacritics", {
  expect_equal(vietnamcode(c("Đà Nẵng"), "province_name", "province_name"),
              c("Da Nang"))
  expect_equal(vietnamcode(c("Bắc Kạn", "Sóc Trăng"), "province_name", "province_name"),
               c("Bac Kan", "Soc Trang"))
})

test_that("Handles lower / upper case", {
  expect_equal(vietnamcode(c("hA nOI"), "province_name", "province_name"),
               c("Ha Noi"))
})

test_that("Search province name using regex", {
  expect_equal(vietnamcode(c("HCMC", "TP Ho Chi Minh", "TP. Ho Chi Minh"),
                           "province_name", "province_name"),
               rep("TP HCM", 3))
  expect_equal(vietnamcode(c("BR.VT", "BR-VT", "Ba Ria-Vung Tau"),
                           "province_name", "province_name"),
               rep("BRVT", 3))
})