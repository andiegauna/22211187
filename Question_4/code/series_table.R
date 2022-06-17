series_table<- function(x, Latex=T){
    options(xtable.comment = FALSE)
    library(tidyverse,tidyr,ggplot2)
    library(xtable)
    popularseries <- x %>% filter(type=='SHOW') %>%
        arrange(desc(tmdb_popularity)) %>%
        head(10) %>%
        separate(genres, c('genre1','genre2','genre3','genre4','genre5'), extra="merge",fill="right") %>%
        mutate(Popularity=round(tmdb_popularity,0)) %>%
        rename(Title=title,Runtime=runtime,"IMDb Score"=imdb_score, "TMDb Score"=tmdb_score,"Primary genre"=genre2, Seasons=seasons) %>%
        select(c(Title, Runtime, 'IMDb Score', "TMDb Score", "Primary genre", Popularity, Seasons))

    Tab <- xtable(popularseries, caption = "Source:IMDb \\label{tab1}")
    tab<-kable(popularseries)

    tab
}
