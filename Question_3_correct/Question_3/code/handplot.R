handplot<- function(x){

    library(tidyverse,tidyr,ggplot2)


    handed<-playersandrankings%>% filter(rank<6) %>%
        mutate(fullname=paste(name_first,"",name_last)) %>%
        group_by(name_last) %>% summarise_at(.vars=c("rank", "points", "height"),.funs=~mode(.))

    joint <- right_join(handed,players,by='name_last') %>% drop_na %>% count(hand) %>%
        mutate(percentage=((n/sum(n))*100)) %>% mutate(percentageround=round(percentage,0)) %>%
        mutate(percentage1=(paste(percentageround, "%")))

    g<- joint %>% ggplot()+ geom_bar(aes(x=hand,y=n, fill=hand), stat="identity") +
        geom_label(aes(x=hand, y=n, label=percentage1)) +
        theme_classic() +
        theme(legend.position="none") +
        labs(x="Hand", y="Frequency")
g
}
