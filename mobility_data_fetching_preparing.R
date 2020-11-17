# set path to current folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(dplyr)

# get a list of all counties in the US
ind <- read.csv('https://storage.googleapis.com/covid19-open-data/v2/index.csv')
ind <- ind %>% filter(country_name == 'United States of America' & aggregation_level == 2)

# demographic data for filtering by population density
dom <- read.csv('https://storage.googleapis.com/covid19-open-data/v2/demographics.csv')

# longitude, latitude, and area information
geo <- read.csv('https://storage.googleapis.com/covid19-open-data/v2/geography.csv')
geo <- geo %>% select('key', 'latitude', 'longitude','area')

# join the above data to form our counties data
counties <- left_join(ind, dom, use = 'key') %>% 
  select('key', 'subregion1_code', 'subregion2_name', 'population') %>% 
  mutate(fips_code = as.numeric(substring(key, 7, 11)))
counties <- left_join(counties, geo, use = 'key')

# download the Google Mobility data & join to county data
temp <- tempfile()
download.file("https://www.gstatic.com/covid19/mobility/Region_Mobility_Report_CSVs.zip",temp, mode="wb")
unzip(temp, "2020_US_Region_Mobility_Report.csv")
mob <- read.csv("2020_US_Region_Mobility_Report.csv")

mob <- mob %>% rename(fips_code=census_fips_code, retail_traffic=retail_and_recreation_percent_change_from_baseline) %>%
  select('fips_code', 'date', 'retail_traffic')
  
counties_mob <- left_join(counties, mob, use = 'fips_code') %>%
  mutate(date = as.Date(date)) %>%
  rename(state=subregion1_code, city=subregion2_name) %>%
  filter(!is.na(retail_traffic))

# filter for only the latest update
update_time <- max(counties_mob$date)

counties_mob_current = counties_mob %>% filter(date == update_time) %>%
  arrange(retail_traffic)

# calculate population density. Since this data has long tail, we transform by log10
counties_mob_current <- counties_mob_current %>%
  mutate(density_log = log10(population/area))

# save the data
write.csv(city_mob_current, 'data_for_dashboard.csv', row.names = TRUE)
