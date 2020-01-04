v <- grepl("[Vv]ehicle", SCC$EI.Sector)
v <- SCC$SCC[v]

require(dplyr)
emissions.v <- NEI %>% 
    subset(SCC %in% v & fips == "24510") %>%
    mutate(year = as.factor(year)) %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))

require(ggplot2)
ggplot(data=emissions.v, aes(x=year, y=Emissions / 1000)) +
    geom_bar(stat="identity", fill="steelblue") +
    ylab(expression("PM"[2.5]*" emissions in kilotons")) +
    ggtitle("Baltimore vehicle emissions, 1999 to 2008")
