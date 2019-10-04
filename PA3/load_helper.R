check_col <- function(outcome) {
    outcome_colnum <- data.frame( 
        outcome = c("heart attack", "heart failure", "pneumonia"),
        colnum = c(11, 17, 23))
    num <- match(outcome, outcome_colnum$outcome)
    if(is.na(num)) {
        stop("invalid outcome")
    }
    colnum <- outcome_colnum$colnum[num]
    return(colnum)
}

load_helper <- function(state, outcome) {
    data(state)
    if (!state %in% state.abb) {
        stop("invalid state")
    } 
    
    colnum <- check_col(outcome)
    outcome_care <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outcome_care[, colnum] <- as.numeric(outcome_care[, colnum])
    state_outcome <- outcome_care[ outcome_care$State == state,]
    
    return(state_outcome)
}