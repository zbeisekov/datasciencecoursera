require(dplyr)

te <- NEI %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))
with(te, barplot(height = Emissions / 1000, names = year,
                 ylab=expression('PM'[2.5]*' emission in kilotons'),
                 main = expression('Total PM'[2.5]*' emissions in various years in kilotons')))
