frequency<-function(x){
    library(tidyverse,plyr, xtable, huxtable)
diditrain<- x %>% mutate(rainyday=case_when(precipitation>0 ~'Rainy',
                                                         precipitation==0 ~'No Rain')) %>%
    group_by(rainyday) %>% count('rainyday') %>% drop_na(rainyday) %>%
    dplyr::rename(Frequency=freq, Weather=rainyday) %>%
    mutate(Percentage=round((Frequency/sum(Frequency))*100),0)


e <- huxtable::hux(diditrain)
e
}