lifeexpectancy<-function(dataset){
    library(tidyverse,ggplot2,ggpubr)

    countrydata<-dataset %>%
        group_by(location) %>% filter(!grepl('income',location)) %>%
        filter(!grepl("Africa|Asia|Oceania|North America|Europe|South America|Antartica", location)) %>%
        drop_na(total_cases_per_million, life_expectancy) %>%
        group_by(location) %>%
        summarise_at(.vars=c('total_cases_per_million', 'life_expectancy'), .funs=~max(.)) %>%
        mutate(totalcases=round(total_cases_per_million,0))



   g <- countrydata %>%
       ggplot() +
       geom_point(aes(x=life_expectancy,y=totalcases, colour=factor(location))) +
       theme_classic() +
       theme(axis.text.x=element_text(angle = 90, hjust = 0.5, vjust=0), legend.position="below", plot.title=element_text(hjust=0.5)) +
       labs(x="Life expectancy", y="Total cases")


g
}


