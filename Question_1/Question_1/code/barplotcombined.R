barplotcombined <-function(dataset){

    library(tidyverse)
    library(ggpubr)
    library(ggplot2)


    averagecasesbycontinent<-owidcoviddata %>% group_by(location,continent) %>%
        summarise_at(.vars=c('total_cases_per_million', 'total_deaths_per_million', 'stringency_index'), .funs=~max(.)) %>%
        drop_na(continent, total_cases_per_million)  %>%
        group_by(continent) %>%
        summarise_at(.vars=c('total_cases_per_million'), .funs=~mean(.))  %>%
        mutate(totalcasesround=round(total_cases_per_million,0)) %>%
        arrange(totalcasesround)

    caseorder <- averagecasesbycontinent %>% pull(continent)

    a<- averagecasesbycontinent %>%
        plot_orderset(., Column='continent', Order=caseorder) %>%
        ggplot() +
        geom_bar(aes(x=continent, y=totalcasesround, fill=continent), stat="identity") +
        geom_label(aes(x=continent, y=totalcasesround, label=totalcasesround)) +
        theme_classic() +
        theme(axis.text.x=element_text(angle = 90, hjust = 0.5, vjust=0), legend.position="none", plot.title=element_text(hjust=0.5)) +
        labs(x="Continent", y="Average total cases per million")


    averagetestsbycontinent<- owidcoviddata %>% drop_na(total_tests_per_thousand) %>% group_by(location,continent) %>%
        summarise_at(.vars=c('total_cases_per_million', 'total_deaths_per_million', 'stringency_index', 'total_tests_per_thousand'), .funs=~max(.)) %>%
        group_by(continent) %>%
        summarise_at(.vars='total_tests_per_thousand', .funs=~mean(.)) %>%
        mutate(totaltests=round(total_tests_per_thousand,0)) %>% arrange(total_tests_per_thousand)

    testorder <- averagetestsbycontinent %>% pull(continent)

    b<- averagetestsbycontinent %>%
        plot_orderset(., Column='continent', Order=testorder) %>%
        ggplot() +
        geom_bar(aes(x=continent, y=totaltests, fill=continent), stat="identity") +
        geom_label(aes(x=continent, y=totaltests, label=totaltests)) +
        theme_classic() +
        theme(axis.text.x=element_text(angle = 90, hjust = 0.5, vjust=0), legend.position="none", plot.title=element_text(hjust=0.5)) +
        labs(x="Continent", y="Average total tests per thousand")

   combinedplot<- ggarrange(a,b)
   combinedplot




}


