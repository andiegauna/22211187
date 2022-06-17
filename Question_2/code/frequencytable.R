frequencytable<-function(data, Latex=TRUE){
    options(xtable.comment = FALSE)
    library(tidyverse,tidyr,ggplot2)
    library(xtable)
    library(Texevier)
    library(knitr)
    diditrain<- london_weather %>% mutate(rainyday=case_when(precipitation>0 ~'Rainy',
                                                 precipitation==0 ~'No Rain')) %>%
        group_by(rainyday) %>% count(rainyday) %>% drop_na(rainyday) %>%
        rename(Frequency='n', Weather='rainyday') %>%
        mutate(Percentage=Frequency/sum(Frequency)*100)


    Tab <- xtable(diditrain, caption = "Source:Weather \\label{tab1}")
    tab<-kable(diditrain)

    tab



}
