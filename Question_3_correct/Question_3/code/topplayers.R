topplayers<- function(x, Latex=TRUE){

    library(tidyverse,tidyr,ggplot2)
    library(xtable)
    library(Texevier)
    library(knitr)
    options(xtable.comment = FALSE)
    smallplayers<-x%>% filter(rank<6) %>%
        mutate(fullname=paste(name_first,"",name_last)) %>%
        group_by(fullname) %>% summarise_at(.vars=c("rank", "points", "height"),.funs=~mean(.)) %>%
        arrange(points) %>% head(10)



    Tab <- xtable(smallplayers, caption = "Source:Jeff Sackmann\\label{tab1}")
    tab<-kable(smallplayers, caption = "Source:Jeff Sackmann")
    tab
    Tab



}