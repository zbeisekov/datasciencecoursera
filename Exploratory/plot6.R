require(dplyr)
require(ggplot2)

emissions <- NEI %>% 
    subset(fips %in% c("24510", "06037")) %>%
    mutate(year = as.factor(year)) %>%
    group_by(fips, year) %>%
    summarise(Emissions = sum(Emissions) / 1000) %>%
    mutate(city = ifelse(fips == "24510", "Baltimore City", "Los Angeles"))

qplot(year, Emissions, data = emissions, color = city,
      ylab = expression("PM"[2.5]*" emissions in kilotons"),
      main = "Emissions in Baltimore and Los Angeles in kilotons")

