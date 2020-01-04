comb.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
comb.coal <- SCC$SCC[comb.coal]

require(dplyr)
emissions.cc <- NEI %>% 
    subset(SCC %in% comb.coal) %>%
    mutate(year = as.factor(year)) %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))

require(ggplot2)
ggplot(data=emissions.cc, aes(x=year, y=Emissions / 1000)) +
    geom_bar(stat="identity", fill="steelblue") +
    ylab(expression("PM"[2.5]*" emissions in kilotons")) +
    ggtitle("Coal combusted emissions, 1999 to 2008")
    
    
    

