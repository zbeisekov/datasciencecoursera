setwd("..")
source("rankhospital.R")

test_that("4th best hospital in TX for heart failure",{
    expect_equal(rankhospital("TX", "heart failure", 4), "DETAR HOSPITAL NAVARRO")
})

test_that("The worst hospital for heart attack in MD",{
    expect_equal(rankhospital("MD", "heart attack", "worst"), "HARFORD MEMORIAL HOSPITAL")
})

test_that("Out of the scale",{
    expect_equal( is.na(rankhospital("MN", "heart attack", 5000)), TRUE )
})

