source('src/basic_functions.R')

# Time vs S0
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

# Strike vs S0
Strikes <- seq(18, 78, by=1)
S0s <- seq(1, 100, by=1)

heat_matrix_EurCall <- matrix(nrow=length(S0s), ncol=length(Strikes))
heat_matrix_EurPut <- matrix(nrow=length(S0s), ncol=length(Strikes))
heat_matrix_AmericaCall <- matrix(nrow=length(S0s), ncol=length(Strikes))
heat_matrix_AmericaPut <- matrix(nrow=length(S0s), ncol=length(Strikes))

for(j in 1:length(Strikes)){
  for(i in 1:length(S0s)){
    cat(i, ',', j, '...\n')
    EurCall <- make_option(TypeContinent = "Europe", TypeVerb = "call", Strike = Strikes[j], S0 = S0s[i])
    EurPut <- make_option(TypeContinent = "Europe", TypeVerb = "put", Strike = Strikes[j], S0 = S0s[i])
    AmericaCall <- make_option(TypeContinent = "America", TypeVerb = "call", Strike = Strikes[j], S0 = S0s[i])
    AmericaPut <- make_option(TypeContinent = "America", TypeVerb = "put", Strike = Strikes[j], S0 = S0s[i])
    
    heat_matrix_EurCall[i, j] <- option_profit_from_tree(make_tree(EurCall))
    heat_matrix_EurPut[i, j] <- option_profit_from_tree(make_tree(EurPut))
    heat_matrix_AmericaCall[i, j] <- option_profit_from_tree(make_tree(AmericaCall))
    heat_matrix_AmericaPut[i, j] <- option_profit_from_tree(make_tree(AmericaPut))
  }
}

heatmap(heat_matrix_EurCall, Rowv=NA, Colv=NA)
write.csv(heat_matrix_EurCall, "simulations/s0_vs_Strike_EurCall_heatmap.csv")

heatmap(heat_matrix_EurPut, Rowv=NA, Colv=NA)
write.csv(heat_matrix_EurPut, "simulations/s0_vs_Strike_EurPut_heatmap.csv")

heatmap(heat_matrix_AmericaCall, Rowv=NA, Colv=NA)
write.csv(heat_matrix_AmericaCall, "simulations/s0_vs_Strike_AmericaCall_heatmap.csv")

heatmap(heat_matrix_AmericaPut, Rowv=NA, Colv=NA)
write.csv(heat_matrix_AmericaPut, "simulations/s0_vs_Strike_AmerciaPut_heatmap.csv")

# Sigma vs r
Sigmas <- seq(0.1, 0.6, by=0.01)
rs <- seq(0.001, 0.2, by=0.001)

heat_matrix_EurCall <- matrix(nrow=length(rs), ncol=length(Sigmas))
heat_matrix_EurPut <- matrix(nrow=length(rs), ncol=length(Sigmas))
heat_matrix_AmericaCall <- matrix(nrow=length(rs), ncol=length(Sigmas))
heat_matrix_AmericaPut <- matrix(nrow=length(rs), ncol=length(Sigmas))

for(j in 1:length(Sigmas)){
  for(i in 1:length(rs)){
    cat(i, ',', j, '...\n')
    EurCall <- make_option(TypeContinent = "Europe", TypeVerb = "call", Sigma = Sigmas[j], r = rs[i])
    EurPut <- make_option(TypeContinent = "Europe", TypeVerb = "put", Sigma = Sigmas[j], r = rs[i])
    AmericaCall <- make_option(TypeContinent = "America", TypeVerb = "call", Sigma = Sigmas[j], r = rs[i])
    AmericaPut <- make_option(TypeContinent = "America", TypeVerb = "put", Sigma = Sigmas[j], r = rs[i])
    
    heat_matrix_EurCall[i, j] <- option_profit_from_tree(make_tree(EurCall))
    heat_matrix_EurPut[i, j] <- option_profit_from_tree(make_tree(EurPut))
    heat_matrix_AmericaCall[i, j] <- option_profit_from_tree(make_tree(AmericaCall))
    heat_matrix_AmericaPut[i, j] <- option_profit_from_tree(make_tree(AmericaPut))
  }
}

heatmap(heat_matrix_EurCall, Rowv=NA, Colv=NA)
write.csv(heat_matrix_EurCall, "simulations/r_vs_Sigma_EurCall_heatmap.csv")

heatmap(heat_matrix_EurPut, Rowv=NA, Colv=NA)
write.csv(heat_matrix_EurPut, "simulations/r_vs_Sigma_EurPut_heatmap.csv")

heatmap(heat_matrix_AmericaCall, Rowv=NA, Colv=NA)
write.csv(heat_matrix_AmericaCall, "simulations/r_vs_Sigma_AmericaCall_heatmap.csv")

heatmap(heat_matrix_AmericaPut, Rowv=NA, Colv=NA)
write.csv(heat_matrix_AmericaPut, "simulations/r_vs_Sigma_AmerciaPut_heatmap.csv")


# Time vs r
Times <- seq(1, 30, by=1)
rs <- seq(0.01, 0.2, by=0.01)

heat_matrix_EurCall <- matrix(nrow=length(rs), ncol=length(Times))
heat_matrix_EurPut <- matrix(nrow=length(rs), ncol=length(Times))
heat_matrix_AmericaCall <- matrix(nrow=length(rs), ncol=length(Times))
heat_matrix_AmericaPut <- matrix(nrow=length(rs), ncol=length(Times))

for(j in 1:length(Times)){
  for(i in 1:length(rs)){
    cat(i, ',', j, '...\n')
    EurCall <- make_option(TypeContinent = "Europe", TypeVerb = "call", Time = Times[j], r = rs[i])
    EurPut <- make_option(TypeContinent = "Europe", TypeVerb = "put", Time = Times[j], r = rs[i])
    AmericaCall <- make_option(TypeContinent = "America", TypeVerb = "call", Time = Times[j], r = rs[i])
    AmericaPut <- make_option(TypeContinent = "America", TypeVerb = "put", Time = Times[j], r = rs[i])
    
    heat_matrix_EurCall[i, j] <- option_profit_from_tree(make_tree(EurCall))
    heat_matrix_EurPut[i, j] <- option_profit_from_tree(make_tree(EurPut))
    heat_matrix_AmericaCall[i, j] <- option_profit_from_tree(make_tree(AmericaCall))
    heat_matrix_AmericaPut[i, j] <- option_profit_from_tree(make_tree(AmericaPut))
  }
}

heatmap(heat_matrix_EurCall, Rowv=NA, Colv=NA)
write.csv(heat_matrix_EurCall, "simulations/r_vs_Time_EurCall_heatmap.csv")

heatmap(heat_matrix_EurPut, Rowv=NA, Colv=NA)
write.csv(heat_matrix_EurPut, "simulations/r_vs_Time_EurPut_heatmap.csv")

heatmap(heat_matrix_AmericaCall, Rowv=NA, Colv=NA)
write.csv(heat_matrix_AmericaCall, "simulations/r_vs_Time_AmericaCall_heatmap.csv")

heatmap(heat_matrix_AmericaPut, Rowv=NA, Colv=NA)
write.csv(heat_matrix_AmericaPut, "simulations/r_vs_Time_AmerciaPut_heatmap.csv")


# Time vs Strike
Times <- seq(1, 30, by=1)
Strikes <- seq(18, 78, by=1)

heat_matrix_EurCall <- matrix(nrow=length(Strikes), ncol=length(Times))
heat_matrix_EurPut <- matrix(nrow=length(Strikes), ncol=length(Times))
heat_matrix_AmericaCall <- matrix(nrow=length(Strikes), ncol=length(Times))
heat_matrix_AmericaPut <- matrix(nrow=length(Strikes), ncol=length(Times))

for(j in 1:length(Times)){
  for(i in 1:length(Strikes)){
    cat(i, ',', j, '...\n')
    EurCall <- make_option(TypeContinent = "Europe", TypeVerb = "call", Time = Times[j], Strike = Strikes[i])
    EurPut <- make_option(TypeContinent = "Europe", TypeVerb = "put", Time = Times[j], Strike = Strikes[i])
    AmericaCall <- make_option(TypeContinent = "America", TypeVerb = "call", Time = Times[j], Strike = Strikes[i])
    AmericaPut <- make_option(TypeContinent = "America", TypeVerb = "put", Time = Times[j], Strike = Strikes[i])
    
    heat_matrix_EurCall[i, j] <- option_profit_from_tree(make_tree(EurCall))
    heat_matrix_EurPut[i, j] <- option_profit_from_tree(make_tree(EurPut))
    heat_matrix_AmericaCall[i, j] <- option_profit_from_tree(make_tree(AmericaCall))
    heat_matrix_AmericaPut[i, j] <- option_profit_from_tree(make_tree(AmericaPut))
  }
}

heatmap(heat_matrix_EurCall, Rowv=NA, Colv=NA)
write.csv(heat_matrix_EurCall, "simulations/Strike_vs_time_EurCall_heatmap.csv")

heatmap(heat_matrix_EurPut, Rowv=NA, Colv=NA)
write.csv(heat_matrix_EurPut, "simulations/Strike_vs_time_EurPut_heatmap.csv")

heatmap(heat_matrix_AmericaCall, Rowv=NA, Colv=NA)
write.csv(heat_matrix_AmericaCall, "simulations/Strike_vs_time_AmericaCall_heatmap.csv")

heatmap(heat_matrix_AmericaPut, Rowv=NA, Colv=NA)
write.csv(heat_matrix_AmericaPut, "simulations/Strike_vs_time_AmerciaPut_heatmap.csv")

