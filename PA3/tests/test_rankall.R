setwd("..")
source("rankall.R")

test_that("20th hospitals for heart attack",{
    test_data <- read.csv("tests/heartattack20.csv",na.strings = "<NA>")
    test <- data.frame( hospital = test_data$hospital,
                        state = test_data$state,
                        row.names = test_data$row.names)
    result <- rankall("heart attack", 20)
    result <- result[1:10,]
    print(result$hospital)
    print(test$hospital)
    expect_equal(as.character(result$hospital), as.character(test$hospital))
    expect_equal(as.character(result$state), as.character(test$state))
})
