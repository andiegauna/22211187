tanzaniacases <-function(dataset){
    Tanzania<- dataset %>% filter(location=="Tanzania")

    g<-Tanzania %>% ggplot() +
        geom_point(aes(x=date,y=total_cases)) +
        theme_classic() +
        theme(axis.text.x=element_text(angle = 90, hjust = 0, vjust=0), legend.position="none", plot.title=element_text(hjust=0.5), plot.subtitle=element_text(hjust=0.5)) +
        labs(x="Date", y="Total cases")



g
}
