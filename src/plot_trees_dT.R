source('src/basic_functions.R')

rs <- (1:50)/100
for(k in 1:50){
  r <- rs[k]
  option <- make_option(TypeContinent = "America", TypeVerb = "call", r=r)
  tree <- make_tree(option)
  
  png(paste("plots/Trees/AmericaCallTree_rk", k, ".png", sep=''))
  plot_tree(option, tree, main="Price of option call, american")
  dev.off()
}

Times <- 2:50
prices <- rep(0, 50)
S0s <- 25:75
for(k in 1:51){
  S0 <- S0s[k]
  option <- make_option(S0=S0)
  tree <- make_tree(option)
  
  prices[k] <- option_profit_from_tree(tree)
}
plot(S0s, prices, type="p", pch=16)




option <- make_option()
option

make_tree(option)
