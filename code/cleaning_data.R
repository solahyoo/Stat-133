# Scripts to clean data

# Clean GDP data
# Read data
gdp_data <- read.csv(file = '/rawdata/raw_gdp_data.csv')

# Need to change column names to something with more meaning
colnames(gdp_data) <- c('x', 'iso2c', 'country', 'year',
                        'GDP (constant 2005 US$)',
                        'GDP growth (annual %)',
                        'GDP (current US$)',
                        'GDP per capita (constant 2005 US$)',
                        'GDP per capita (current US$)',
                        'GDP per capita growth (annual %)')

# Only need years 1970 - current
gdp_data <- subset(gdp_data, year >= 1970)

# Renumber rows
row.names(gdp_data) <- 1:nrow(gdp_data)

# Don't need the column 'iso2c' since it's the same as 'country'
gdp_data <- gdp_data[c(3:10)]

# Export to csv file
write.csv(file = '/data/gdp_data.csv', x = gdp_data, row.names = FALSE)

# Clean Box Office data
box_office <- read.csv(file = '/rawdata/raw_box_office.csv')

# Change date to show only the year (as numeric)
box_office$Year <- as.numeric(gsub("12/31/", "",
                                   as.character(box_office$Year)))

# Don't need percent change columns
box_office <- box_office[c(1, 2, 4, 6:8)]

# Change Total Gross and Tickets Sold to millions
box_office$Total.Gross <- box_office$Total.Gross * 1000000
box_office$Tickets.Sold <- box_office$Tickets.Sold * 1000000

# Write to csv file
write.csv(file = '/data/box_offce.csv', x = box_office, row.names = FALSE)
