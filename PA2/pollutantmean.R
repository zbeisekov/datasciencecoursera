pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating 
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either 'sulface' or 'nitrate'
    
    ## 'id' is an integer vector indicating the monitor ID numbers to be used
    
    ## return the mean of the pollutant all monitors list in the 'id' vector
    ## (ignoring NA values)
    ## Note: Do not round the results.
    
    v <- c()
    for (i in id) {
        filePath <- file.path(directory, sprintf("%.3d.csv",i))
        myframe <- read.csv(filePath)
        pll <- myframe[pollutant]
        v <- c(v, pll[!is.na(pll)] )
    }
    mean(v)
}