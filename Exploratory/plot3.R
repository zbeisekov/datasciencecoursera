require(ggplot2)
require(dplyr)

bc <- NEI %>% 
    subset(fips == "24510") %>%
    mutate(type = as.factor(type)) %>%
    group_by(type, year) %>%
    summarise(Emissions = sum(Emissions))

qplot(year, Emissions / 1000, data = bc, color = type, geom = c("point", "smooth"),
      ylab = expression("PM"[2.5]*" emissions in kilotons"),
      main = "Emissions in Baltimore by type in kilotons")
