heightplot<- function(x, Latex=TRUE){

    library(tidyverse,tidyr,ggplot2)
    library(xtable)
    library(Texevier)
    library(knitr)
    options(xtable.comment = FALSE)

    height<-x%>% filter(rank<6) %>%
        mutate(fullname=paste(name_first,"",name_last)) %>%
        group_by(fullname) %>% summarise_at(.vars=c("rank", "points", "height"),.funs=~mean(.))

    correlation<- cor(height$height,height$rank)

     g<- height %>%
        ggplot() +
        geom_point(aes(x=height,y=rank, colour=factor(fullname))) +
        theme_classic() +
        theme(axis.text.x=element_text(angle = 90, hjust = 0.5, vjust=0), legend.position="below", plot.title=element_text(hjust=0.5)) +
        labs(x="Height (cm)", y="Rank", caption="Source:Jeff Sackmann") +
        annotate(geom="text",x=195,y=2.5,label="Correlation=0.06")



g
}
