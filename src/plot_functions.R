source('src/basic_functions.R')
library("ggplot2")


plot_tree <- function(option, tree, main = " ", max_price = NULL, max_asset_price = NULL, log_y = FALSE){
  
  tree_df = tree_to_df(tree, option)
  # wyświetla prosty wykres cen o tytule main, naszego drzewa, dla podanej opcji
  # wydaje mi się, że warto to przerobić na ggplot2
  # ogólnie wygląda to ładnie, warto wrzucić kilka takich smaczków do raportu
  # depth <- length(tree$price_tree)
  if (is.null(max_price)){
    max_price <- max(sapply(tree$price_tree, max))
  }
  if (is.null(max_asset_price)){
    max_asset_price <- max(sapply(tree$asset_price_tree, max))
  }
  
  
  graph <- ggplot() +
    geom_point(data = tree_df,
               aes(x = times, y = asset_prices, color = prices, shape = as.factor(moments)))+
    scale_shape_manual(values = c(2, 16)) +
    scale_color_viridis_c() +
    theme_bw()
  
  if (log_y){
    graph <- graph + scale_y_continuous(trans = "log")
  }
  
  return(graph)
  
}



