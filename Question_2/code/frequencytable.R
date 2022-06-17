frequencytable<-function(data, Latex=TRUE){
    options(xtable.comment = FALSE)
    library(tidyverse,tidyr,ggplot2)
    library(xtable)
    library(Texevier)
    library(knitr)
    diditrain<- data %>% mutate(rainyday=case_when(precipitation>0 ~'Rainy',
                                                 precipitation==0 ~'No Rain')) %>%
        group_by(rainyday) %>% count('rainyday') %>% drop_na(rainyday) %>%
        dplyr::rename(Frequency=freq, Weather=rainyday) %>%
        mutate(Percentage=round((Frequency/sum(Frequency))*100),0)


    Tab <- xtable(diditrain, caption = "Source:Weather \\label{tab1}")
    tab<-kable(diditrain)

    tab



}
