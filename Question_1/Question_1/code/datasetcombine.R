datasetcombine<-function(dataset){
    library(tidyverse)
    library(lubridate)

    owidcoviddata$date <- as.Date(owidcoviddata$date, format="%Y-%m-%d")
    owidcoviddata$Year<-format(owidcoviddata$date,format="%Y")
    preparetojoin<- owidcoviddata %>% group_by(Year,location) %>%
        summarise_at(.vars=c('total_cases_per_million', 'total_deaths_per_million', 'stringency_index'), .funs=~max(.)) %>%
        rename(Entity=location)

    jointdata <- right_join(preparetojoin, deathbycause, by="Entity")


}