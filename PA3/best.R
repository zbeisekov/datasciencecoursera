best <- function(state, outcome) {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    data(state)
    if (!state %in% state.abb) {
        stop("invalid state")
    } 
    
    outcome_colnum <- data.frame( 
        outcome = c("heart attack", "heart failure", "pneumonia"),
        colnum = c(11, 17, 23))
    num <- match(outcome, outcome_colnum$outcome)
    if(is.na(num)) {
        stop("invalid outcome")
    }
    colnum <- outcome_colnum$colnum[num]
    
    outcome_care <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outcome_care[, colnum] <- as.numeric(outcome_care[, colnum])
    state_outcome <- outcome_care[ outcome_care$State == state,]
    
    has_outcome <- !is.na(state_outcome[, colnum])
    min_outcome <- min(state_outcome[, colnum][has_outcome])
    
    m <- match(min_outcome, state_outcome[, colnum])
    ordered <- sort(state_outcome$Hospital.Name[m])
    return(ordered[1])
}