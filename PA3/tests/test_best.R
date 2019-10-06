setwd("..")
source("best.R")

test_that("Test TX and Heart attack",{
    expect_equal(best("TX", "heart attack"), "CYPRESS FAIRBANKS MEDICAL CENTER")
})

test_that("Test TX and Heart failure",{
    expect_equal(best("TX", "heart failure"), "FORT DUNCAN MEDICAL CENTER")
})

test_that("Test MD and Heart attack",{
    expect_equal(best("MD", "heart attack"), "JOHNS HOPKINS HOSPITAL, THE")
})

test_that("Test MD and pneumonia", {
    expect_equal(best("MD", "pneumonia"), "GREATER BALTIMORE MEDICAL CENTER")
})

test_that("Test invalid state", {
    expect_error(best("BB", "heart attack"), "invalid state")
})

test_that("Test invalid outcome", {
    expect_error(best("NY", "hert attack"), "invalid outcome")
})