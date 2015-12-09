# Scripts to clean data

gdp_data = read.csv(file =
          'C:/Users/tjf00_000/OneDrive/Documents/finalproj/rawdata/gdp_data.csv')

# Need to change column names to something clearer
colnames(gdp_data) <- c('x', 'iso2c', 'country', 'year',
                        'GDP (constant 2005 US$)', 'GDP (current US$)',
                        'GDP growth (annual %)',
                        'GDP per capita (constant 2005 US$)',
                        'GDP per capita (current US$)',
                        'GDP per capita growth (annual %)')

# Only need years 1970 - 2014
gdp_data <- subset(gdp_data, year >= 1970)

# Don't need the column 'iso2c' since it's the same as 'country'
gdp_data <- gdp_data[c(3:10)]
