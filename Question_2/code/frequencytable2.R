frequencytable2<-function(weather){
    library(tidyverse,plyr, xtable, huxtable, knitr)

    diditrain<- weather %>% mutate(rainyday=case_when(precipitation>0 ~'Rainy',
                                                   precipitation==0 ~'No Rain')) %>%
        group_by(rainyday) %>% count('rainyday') %>% drop_na(rainyday) %>%
        dplyr::rename(Frequency=freq, Weather=rainyday) %>%
        mutate(Percentage=round((Frequency/sum(Frequency))*100),0)


    e <- knitr::kable(diditrain, "html")

    e
}

