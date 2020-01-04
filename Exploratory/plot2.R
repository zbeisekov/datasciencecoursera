require(dplyr)

bc <- NEI %>%
    subset(fips == "24510") %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))
with(bc, barplot(height = Emissions / 1000, names = year,
              ylab=expression('PM'[2.5]*' emission in kilotons'),
              main = expression('Total PM'[2.5]*' emissions in Baltimore City-MD in kilotons')))
