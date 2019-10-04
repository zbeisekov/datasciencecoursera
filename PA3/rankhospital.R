rankhospital <- function(state, outcome, num) {
    
    colnum <- check_col(outcome)
    state_outcome <- load_helper(state, outcome)
    has_outcome <- !is.na(state_outcome[, colnum])
    state_outcome <- state_outcome[has_outcome,]
    hospitals <- state_outcome$Hospital.Name[ order(state_outcome[, colnum], state_outcome$Hospital.Name) ]
    
    if (num == "best") {
        num <- 1
    } else if (num == "worst") {
        num <- length(hospitals)
    }
    
    return(hospitals[num])
    
}