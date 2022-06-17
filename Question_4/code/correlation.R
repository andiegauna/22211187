correlations <- function(x){

    library(corrplot)
    correlationdata<- x %>%
        select(runtime, imdb_score, imdb_votes, tmdb_popularity, tmdb_score) %>%
        drop_na(runtime, imdb_score, imdb_votes, tmdb_popularity, tmdb_score)
    M<- cor(correlationdata)
    plot<- corrplot(M, method='circle')
    recordPlot()

}

