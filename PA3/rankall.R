source("load_helper.R")

rank <- function(outcome, num, colnum) {
    outcome <- outcome[ !is.na(outcome[, colnum]) , ]
    ordered <- order(outcome[, colnum], outcome$Hospital.Name)
    outcome <- outcome[ordered,]
    
    if (num == "best") {
        num <- 1
    } else if (num == "worst") {
        num <- nrow(outcome)
    }
    
    return(outcome$Hospital.Name[num])
} 


rankall <- function(outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    
    colnum <- check_col(outcome)
    outcome <- load_helper("all", outcome)
    l <- lapply(split(outcome, outcome$State), rank, num, colnum)
    states <- names(l)
    ranking <- data.frame( hospital = unlist(l),
                           state = states,
                           row.names = states)
    return(ranking)
}
