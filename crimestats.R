#install.packages(c("httr", "jsonlite", "readr", "tidyverse"))
#install.packages("taskscheduleR", repos = "http://www.datatailor.be/rcube", type = 
"source")
#install.packages("pivottabler")

library(dplyr)
library(readr)
library(pivottabler)
library(tidyverse)

rawStats <- read.csv("Q42021.csv")

provinces <- as.data.frame(table(rawStats$prov))
colnames(provinces)[1] <- "Province"

crimeNames <- as.data.frame(table(rawStats$Crime_Category))
colnames(crimeNames)[1] <- "Crime category"

annualCrimes <- rawStats %>% 
                      group_by(prov, Crime_Category) %>%
                      summarize(March2016 = sum(April.to.March.2015_16),
                                March2017 = sum(April.to.March.2016_17),
                                March2018 = sum(April.to.March.2017_18),
                                March2019 = sum(April.to.March.2018_19.1),
                                March2020 = sum(April.to.March.2019_20),
                                )
                            