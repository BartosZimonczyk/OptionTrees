source('src/basic_functions.R')

Times <- seq(1, 30, by=1)
S0s <- seq(1, 100, by=1)

heat_matrix_EurCall <- matrix(nrow=length(S0s), ncol=length(Times))
heat_matrix_EurPut <- matrix(nrow=length(S0s), ncol=length(Times))
heat_matrix_AmericaCall <- matrix(nrow=length(S0s), ncol=length(Times))
heat_matrix_AmericaPut <- matrix(nrow=length(S0s), ncol=length(Times))

for(j in 1:length(Times)){
  for(i in 1:length(S0s)){
    cat(i, ',', j, '...\n')
    EurCall <- make_option(TypeContinent = "Europe", TypeVerb = "call", Time = Times[j], S0 = S0s[i])
    EurPut <- make_option(TypeContinent = "Europe", TypeVerb = "put", Time = Times[j], S0 = S0s[i])
    AmericaCall <- make_option(TypeContinent = "America", TypeVerb = "call", Time = Times[j], S0 = S0s[i])
    AmericaPut <- make_option(TypeContinent = "America", TypeVerb = "put", Time = Times[j], S0 = S0s[i])
    
    heat_matrix_EurCall[i, j] <- option_profit_from_tree(make_tree(EurCall))
    heat_matrix_EurPut[i, j] <- option_profit_from_tree(make_tree(EurPut))
    heat_matrix_AmericaCall[i, j] <- option_profit_from_tree(make_tree(AmericaCall))
    heat_matrix_AmericaPut[i, j] <- option_profit_from_tree(make_tree(AmericaPut))
  }
}

heatmap(heat_matrix_EurCall, Rowv=NA, Colv=NA)
write.csv(heat_matrix_EurCall, "simulations/s0_vs_time_EurCall_heatmap.csv")

heatmap(heat_matrix_EurPut, Rowv=NA, Colv=NA)
write.csv(heat_matrix_EurPut, "simulations/s0_vs_time_EurPut_heatmap.csv")

heatmap(heat_matrix_AmericaCall, Rowv=NA, Colv=NA)
write.csv(heat_matrix_AmericaCall, "simulations/s0_vs_time_AmericaCall_heatmap.csv")

heatmap(heat_matrix_AmericaPut, Rowv=NA, Colv=NA)
write.csv(heat_matrix_AmericaPut, "simulations/s0_vs_time_AmerciaPut_heatmap.csv")
