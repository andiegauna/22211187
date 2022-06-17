barplotcases <-function(dataset){

library(tidyverse)

    averagecasesbycontinent<-dataset %>% group_by(location,continent) %>%
        summarise_at(.vars=c('total_cases_per_million', 'total_deaths_per_million', 'stringency_index'), .funs=~max(.)) %>%
        drop_na(continent, total_cases_per_million)  %>%
        group_by(continent) %>%
        summarise_at(.vars=c('total_cases_per_million'), .funs=~mean(.))  %>%
        mutate(totalcasesround=round(total_cases_per_million,0))

    a<- averagecasesbycontinent %>% ggplot() +
        geom_bar(aes(x=continent, y=totalcasesround, fill=continent), stat="identity") +
        geom_label(aes(x=continent, y=totalcasesround, label=totalcasesround)) +
        theme_classic() +
        theme(axis.text.x=element_text(angle = 90, hjust = 0.5, vjust=0), legend.position="none", plot.title=element_text(hjust=0.5)) +
        labs(title="Africa has the lowest average total cases per million",x="Continent", y="Average total cases per million")

    a






}

