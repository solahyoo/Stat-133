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

# Only need years 1980 - current
gdp_data <- subset(gdp_data, year >= 1980)

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

# Don't need Avg.Cost column
box_office <- box_office[c(1:8)]

# Change Total Gross and Tickets Sold to millions
box_office$Total.Gross <- box_office$Total.Gross * 1000000
box_office$Tickets.Sold <- box_office$Tickets.Sold * 1000000

# Don't need year 2015
box_office <- subset(box_office, Year < 2015)

# Reorder data so that Year 1980 is on top
box_office <- box_office[order(box_office$Year), ]

# Write to csv file
write.csv(file = '/data/box_office.csv', x = box_office, row.names = FALSE)


# Clean data for top grossing movie of the year
top_movie <- read.csv(file = '/rawdata/raw_top_grossing_movie_yearly.csv',
                      stringsAsFactors = FALSE)
top_movie <- subset(top_movie, Year >= 1980 & Year < 2015)
top_movie <- top_movie[c("Year", 'Movie', 'Genre', 'Production.Budget',
                         'Total.Domestic.Box.Office')]
# Convert budget to numeric
budget <- top_movie$Production.Budget
top_movie$Production.Budget <- as.numeric(gsub(",", "",
                                               gsub("\\$", "", budget)))

# Convert total box office to numeric
total_box_office <- top_movie$Total.Domestic.Box.Office
top_movie$Total.Domestic.Box.Office <- as.numeric(gsub(",", "",
                                        gsub("\\$", "", total_box_office)))
# Reorder rows
top_movie <- top_movie[order(top_movie$Year), ]

# Renumber rows
row.names(top_movie) <- 1:nrow(top_movie)

# Add decades column
for (i in 1:nrow(top_movie)) {
  top_movie$Decade[i] <- top_movie$Year[i] - (top_movie$Year[i] %% 10)
}
top_movie$Decade <- as.factor(top_movie$Decade)
levels(top_movie$Decade) = c("1980s", "1990s", "2000s", "2010s")

# Write to csv file
write.csv(file = '/data/top_grossing_movie_yearly.csv',
          x = top_movie, row.names = FALSE)




