covidresponse<- function(data){

    hospital <- data%>%
        group_by(location) %>% filter(!grepl('income',location)) %>%
        filter(!grepl("Africa|Asia|Oceania|North America|Europe|South America|Antartica", location)) %>%
        drop_na(hospital_beds_per_thousand, weekly_icu_admissions_per_million) %>%
        mutate(icuperthousand=weekly_icu_admissions_per_million*1000) %>%
        group_by(continent, date) %>%
        summarise_at(.vars=c('weekly_icu_admissions_per_million', 'hospital_beds_per_thousand'), .funs=~mean(.)) %>%
        drop_na(continent)

   g<- hospital %>% ggplot() +
       geom_line(aes(x=date,y=hospital_beds_per_thousand)) +
       geom_line(aes(x=date, y=weekly_icu_admissions_per_million))+
       facet_wrap(~continent, scales="free") +
       theme_classic() +
       theme(axis.text.x=element_text(angle = 90, hjust = 0.5, vjust=0), legend.position="none", plot.title=element_text(hjust=0.5)) +
       labs(x="Date", y="ICU admissions per million and hospital beds per thousand")


    g



}
