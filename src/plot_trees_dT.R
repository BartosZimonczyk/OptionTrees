source('src/basic_functions.R')
source('src/make_plots.R')

rs <- seq(0.001, 0.2, length.out = 50)
for(k in 1:50){
  r <- rs[k]
  option <- make_option(TypeContinent = "America", TypeVerb = "put", r=r)
  tree <- make_tree(option)
  
  png(paste("plots/Trees/rs/AmericaPutTree_rk", k, ".png", sep=''))
  print(plot_tree(option, tree, main="Price of option put, american", log_y = TRUE))
  dev.off()
  # ggsave(paste("plots/Trees/AmericaCallTree_rk", k, ".png", sep=''), plot = p)
}

Ts <- (1:30)
for(k in 1:30){
  t <- Ts[k]
  option <- make_option(TypeContinent = "America", TypeVerb = "put", T = t)
  tree <- make_tree(option)
  
  png(paste("plots/Trees/Ts/AmericaPutTree_T", k, ".png", sep=''))
  print(plot_tree(option, tree, main="Price of option put, american", log_y = TRUE) + scale_x_continuous())
  dev.off()
  # ggsave(paste("plots/Trees/AmericaCallTree_rk", k, ".png", sep=''), plot = p)
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




option <- make_option(TypeContinent = "America", TypeVerb = "put")
option

tree <- make_tree(option)

plot_tree(tree, option)


dTs <- c(seq(0.01, 0.3, by=0.01), seq(0.3, 1, by=0.1))
for(k in 1:length(dTs)){
  dT <- dTs[k]
  option <- make_option(TypeContinent = "America", TypeVerb = "call", DeltaT = dT)
  tree <- make_tree(option)
  
  png(paste("plots/Trees/AmericaCallTree_dT", length(dTs) - k, ".png", sep=''))
  print(plot_tree(option, tree, main="Cena opcji Amerykańskiej Call", log_y = TRUE))
  dev.off()
  # ggsave(paste("plots/Trees/AmericaCallTree_rk", k, ".png", sep=''), plot = p)
}


dTs <- c(seq(0.01, 0.3, by=0.01), seq(0.3, 1, by=0.1))
for(k in 1:length(dTs)){
  dT <- dTs[k]
  option <- make_option(TypeContinent = "America", TypeVerb = "put", DeltaT = dT)
  tree <- make_tree(option)
  
  png(paste("plots/Trees/AmericaPutTree_dT", length(dTs) - k, ".png", sep=''))
  print(plot_tree(option, tree, main="Cena opcji Amerykańskiej Put", log_y = TRUE))
  dev.off()
  # ggsave(paste("plots/Trees/AmericaCallTree_rk", k, ".png", sep=''), plot = p)
}


dTs <- c(seq(0.01, 0.3, by=0.01), seq(0.3, 1, by=0.1))
for(k in 1:length(dTs)){
  dT <- dTs[k]
  option <- make_option(TypeContinent = "America", TypeVerb = "put", DeltaT = dT)
  tree <- make_tree(option)
  
  png(paste("plots/Trees/AmericaPutTree_no_log_dT", length(dTs) - k, ".png", sep=''))
  print(plot_tree(option, tree, main="Cena opcji Amerykańskiej Put", log_y = FALSE))
  dev.off()
}

option <- make_option(TypeContinent = "America", TypeVerb = "put")
tree <- make_tree(option)
png(paste("plots/Trees/AmericaPutTree.png", sep=''))
print(plot_tree(option, tree, main="Cena opcji Amerykańskiej Put", log_y = TRUE))
dev.off()


option <- make_option(TypeContinent = "America", TypeVerb = "call")
tree <- make_tree(option)
png(paste("plots/Trees/AmericaCallTree.png", sep=''))
print(plot_tree(option, tree, main="Cena opcji Amerykańskiej Call", log_y = TRUE))
dev.off()

option <- make_option(TypeContinent = "Europe", TypeVerb = "put")
tree <- make_tree(option)
png(paste("plots/Trees/EuropePutTree.png", sep=''))
print(plot_tree(option, tree, main="Cena opcji Europejskiej Put", log_y = TRUE))
dev.off()


option <- make_option(TypeContinent = "Europe", TypeVerb = "call")
tree <- make_tree(option)
png(paste("plots/Trees/EuropeCallTree.png", sep=''))
print(plot_tree(option, tree, main="Cena opcji Europejskiej  Call", log_y = TRUE))
dev.off()


