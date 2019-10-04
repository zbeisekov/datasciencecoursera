corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of CSV file
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all variable)
    ## required to compute the correlation between 
    ## nitrate and sulfate; the default is 0.
    
    ## Return a numeric version of correlations
    ## NOTE: Do not round the result!
    
    cs <- numeric()
    
    full <- complete(directory)
    full.ids <- full$ID[ full$nobs >= threshold ]
    
    for (i in full.ids) {
        filePath <- file.path(directory, sprintf("%.3d.csv",i))
        myframe <- read.csv(filePath)
        full <- !is.na(myframe$sulfate) & !is.na(myframe$nitrate)
        c <- cor( myframe$sulfate[full], myframe$nitrate[ full])
        if (!is.na(c)) {
            cs <- c(cs, c)
        }
    }
    
    cs
}