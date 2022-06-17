readplayerranking<-function(rankingspath,playerpath){

library(readr, tidyverse)

list_of_files <- list.files(path = rankingspath,
                            recursive = TRUE,
                            pattern = "\\.csv$",
                            full.names = TRUE)
datatokeep<- list_of_files[grepl("atp_rankings", list_of_files)]

df <- readr::read_csv(datatokeep, id = "file_name")

players<-read_csv(playerpath)
players<- players %>% rename(player=player_id)

playersandrankings<-right_join(df,players,by='player') %>% select(-file_name)
view(playersandrankings)
}
