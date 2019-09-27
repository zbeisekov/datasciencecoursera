complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating 
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    rf <- data.frame("ID" = c(), "nobs" = c())
    ## names(rf) <- c("ID", "nobs")
    
    
    for (i in id) {
        filePath <- file.path(directory, sprintf("%.3d.csv",i))
        myframe <- read.csv(filePath)
        nobs <- sum( !is.na(myframe$sulfate) & !is.na(myframe$nitrate) )
        ## rf[nrow(rf) + 1, ] <- list(ID = i, nobs = nobs)
        rf <- rbind(rf, list(ID = i, nobs = nobs))
        ## print(nobs)
    }
    
    rf
}