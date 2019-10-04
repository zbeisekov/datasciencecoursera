source("load_helper.R")

best <- function(state, outcome) {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    colnum <- check_col(outcome)
    state_outcome <- load_helper(state, outcome)
    has_outcome <- !is.na(state_outcome[, colnum])
    min_outcome <- min(state_outcome[, colnum][has_outcome])
    
    m <- match(min_outcome, state_outcome[, colnum])
    ordered <- sort(state_outcome$Hospital.Name[m])
    return(ordered[1])
}