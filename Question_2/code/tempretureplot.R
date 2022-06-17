tempretureplot <- function(data){
library(tidyverse)
   datafortempplot<- data %>% filter(date>"2019-12-31") %>% drop_na(mean_temp)
   averagetemp<- mean(datafortempplot$mean_temp)

   f<- datafortempplot %>% ggplot() +
    geom_point(aes(x=date,y=mean_temp)) +
    geom_hline(aes(yintercept=averagetemp,color="London")) +
    geom_hline(aes(yintercept=17.5, color="South Africa")) +
       labs(x = "Date",
            y = "Average temperature",
            color = "Annual average temperature",
            title="Average temperatures in London for 2020")+
       theme_classic()+
       theme(legend.position="bottom")

f
}

