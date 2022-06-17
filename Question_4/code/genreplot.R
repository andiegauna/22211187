genreplot<- function(dataset){

    library(tidyverse,tidyr,ggplot2)

    genredataset <- dataset %>% filter(type=='MOVIE') %>%
        separate(genres, c('genre1','genre2','genre3','genre4','genre5'), extra="merge",fill="right") %>%
        mutate(Popularity=round(tmdb_popularity,0)) %>%
        group_by(genre2) %>%
        drop_na(Popularity,imdb_score) %>%
        summarise_at(.vars=c('Popularity','imdb_score'),.funs=~median(.)) %>%
        arrange(Popularity) %>% head(10)

    g<- genredataset %>% ggplot() +
        geom_bar(aes(x=genre2,y=Popularity,fill=genre2), stat="identity") +
        theme_classic() +
        theme(axis.text.x=element_text(angle = 90, hjust = 0), legend.position="none", plot.title=element_text(hjust=0)) +
        labs(title="10 most popular genres",subtitle="by median TMDb Popularity",x="Genre", y="Score", caption="Source:IMDb")
g
}


