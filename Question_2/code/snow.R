maxsnowdepthplot <-function(x){
    library("jpeg")
    library("ggplot2")
    library("patchwork")

   maxsnow <- x %>% arrange(desc(snow_depth)) %>% head(1)
g<- maxsnow %>% ggplot() + geom_bar(aes(y=snow_depth),  color="blue") +
    theme_classic() +
    labs(x = "",
         y = "Snow Depth",
         title="The maximum snow depth in London is taller than a cat")
img<- readJPEG("cat.jpg", native =T)

img_graph <- g +
    inset_element(p = img,
                  left = 0.05,
                  bottom =0,
                  right = 1,
                  top = 0.95)

img_graph

}
