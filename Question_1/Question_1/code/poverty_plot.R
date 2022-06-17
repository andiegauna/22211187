poverty_plot<-function(dataset){
    library(tidyverse,ggplot2,ggpubr)

    averagecasesbyincomelevel<-dataset %>%
        filter(grepl('income',location)) %>%
        group_by(location) %>%
        drop_na(total_cases_per_million) %>%
        summarise_at(.vars=c('total_cases_per_million', 'total_deaths_per_million', 'total_tests_per_thousand'), .funs=~max(.)) %>%
        mutate(totalcases=round(total_cases_per_million,0)) %>% arrange(totalcases)

    c<- averagecasesbyincomelevel %>% ggplot() +
        geom_bar(aes(x=location, y=total_cases_per_million, fill=location), stat="identity") +
        geom_label(aes(x=location, y=total_cases_per_million, label=totalcases)) +
        theme_classic() +
        theme(axis.text.x=element_text(angle = 90, hjust = 0.5, vjust=0), legend.position="none", plot.title=element_text(hjust=0.5)) +
        labs(x="Income level", y="Average total cases per million")

    c

    averagedeathsbyincomelevel<-dataset%>%
        filter(grepl('income',location)) %>%
        group_by(location) %>%
        drop_na(total_deaths_per_million) %>%
        summarise_at(.vars=c('total_cases_per_million', 'total_deaths_per_million', 'total_tests_per_thousand'), .funs=~max(.)) %>%
        mutate(totaldeaths=round(total_deaths_per_million,0)) %>% arrange(totaldeaths)

    d<- averagedeathsbyincomelevel %>% ggplot() +
        geom_bar(aes(x=location, y=totaldeaths, fill=location), stat="identity") +
        geom_label(aes(x=location, y=totaldeaths, label=totaldeaths)) +
        theme_classic() +
        theme(axis.text.x=element_text(angle = 90, hjust = 0.5, vjust=0), legend.position="none", plot.title=element_text(hjust=0.5)) +
        labs(x="Income level", y="Average deaths per million")

  plot<- ggarrange(c,d)
  plot


}


