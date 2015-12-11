library(WDI)

#create directories
dir.create('./rawdata')
dir.create('./data')
dir.create('./images')
dir.create('./code')
dir.create('./resources')
dir.create('./report')

#download raw data
download.file(url = 'https://www.quandl.com/api/v3/datasets/MOJO/BOXOFFICE_A.csv',
              dest = '/rawdata/raw_box_office.csv')

gdp_data <- WDI(indicator = c('NY.GDP.MKTP.KD', 'NY.GDP.MKTP.KD.ZG',
                              'NY.GDP.MKTP.CD', 'NY.GDP.PCAP.KD',
                              'NY.GDP.PCAP.CD', 'NY.GDP.PCAP.KD.ZG'),
                country = 'US', start = 1966, end = 2014)
write.csv(file = '/rawdata/raw_gdp_data.csv', x = gdp_data)

url <- 'http://www.the-numbers.com/movies/#tab=year'
rawpt <- readHTMLTable(url, which = 1, stringsAsFactors = FALSE)
write.csv(file = '/rawdata/raw_top_grossing_movie_yearly.csv', x = rawpt)

#create README.md
file.create('README.md')
