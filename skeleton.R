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
              dest = '/rawdata/box_office.csv')

gdp_data <- WDI(indicator = c('NY.GDP.MKTP.KD', 'NY.GDP.MKTP.KD.ZG',
                              'NY.GDP.MKTP.CD', 'NY.GDP.PCAP.KD',
                              'NY.GDP.PCAP.CD', 'NY.GDP.PCAP.KD.ZG'), 
                country = 'US', start = 1966, end = 2014)
write.csv(file = '/rawdata/gdp_data.csv', x = gdp_data)

#create README.md
file.create('README.md')

# how did the genre change over the years? (recently superhero movies) - individual titles