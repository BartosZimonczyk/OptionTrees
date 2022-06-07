source('src/basic_functions.R')
library(data.table)

# wrażliwość na zmianę Strike

Strikes <- seq(18, 78, by=1)
price_EurCall <- rep(0, length(Strikes))
price_EurPut <- rep(0, length(Strikes))
price_AmericaCall <- rep(0, length(Strikes))
price_AmericaPut <- rep(0, length(Strikes))

for(k in 1:length(Strikes)){
  cat(k, '...\n')
  EurCall <- make_option(TypeContinent = "Europe", TypeVerb = "call", Strike = Strikes[k])
  EurPut <- make_option(TypeContinent = "Europe", TypeVerb = "put", Strike = Strikes[k])
  AmericaCall <- make_option(TypeContinent = "America", TypeVerb = "call", Strike = Strikes[k])
  AmericaPut <- make_option(TypeContinent = "America", TypeVerb = "put", Strike = Strikes[k])
  
  price_EurCall[k] <- option_profit_from_tree(make_tree(EurCall))
  price_EurPut[k] <- option_profit_from_tree(make_tree(EurPut))
  price_AmericaCall[k] <- option_profit_from_tree(make_tree(AmericaCall))
  price_AmericaPut[k] <- option_profit_from_tree(make_tree(AmericaPut))
}

plot(Strikes, price_EurCall, type='l', col='red', ylim=c(0, max(c(price_EurPut, price_EurCall, price_AmericaCall, price_AmericaPut))))
lines(Strikes, price_EurPut, col='black')
lines(Strikes, price_AmericaCall, col='green', lwd=2, lty='dashed')
lines(Strikes, price_AmericaPut, col='blue', lwd=2, lty='dashed')

output <- data.frame(
  'Strike'=rep(Strikes, times=4),
  'Price'=c(price_EurCall, price_EurPut, price_AmericaCall, price_AmericaPut),
  'Continent'=c(rep('Europe', times=2*length(Strikes)), rep('America', times=2*length(Strikes))),
  'Verb'=c(rep('call', times=length(Strikes)), rep('put', times=length(Strikes)), rep('call', times=length(Strikes)), rep('put', times=length(Strikes)))
)

write.csv(output, file='simulations/strike_price_simulation.csv')

# wrażliwość na zmianę Time
Times <- seq(1, 50, by=1)
price_EurCall <- rep(0, length(Times))
price_EurPut <- rep(0, length(Times))
price_AmericaCall <- rep(0, length(Times))
price_AmericaPut <- rep(0, length(Times))

for(k in 1:length(Times)){
  cat(k, '...\n')
  EurCall <- make_option(TypeContinent = "Europe", TypeVerb = "call", Time = Times[k])
  EurPut <- make_option(TypeContinent = "Europe", TypeVerb = "put", Time = Times[k])
  AmericaCall <- make_option(TypeContinent = "America", TypeVerb = "call", Time = Times[k])
  AmericaPut <- make_option(TypeContinent = "America", TypeVerb = "put", Time = Times[k])
  
  price_EurCall[k] <- option_profit_from_tree(make_tree(EurCall))
  price_EurPut[k] <- option_profit_from_tree(make_tree(EurPut))
  price_AmericaCall[k] <- option_profit_from_tree(make_tree(AmericaCall))
  price_AmericaPut[k] <- option_profit_from_tree(make_tree(AmericaPut))
}

plot(Times, price_EurCall, type='l', col='red', ylim=c(0, max(c(price_EurPut, price_EurCall, price_AmericaCall, price_AmericaPut))))
lines(Times, price_EurPut, col='black')
lines(Times, price_AmericaCall, col='green', lwd=2, lty='dashed')
lines(Times, price_AmericaPut, col='blue', lwd=2, lty='dashed')

output <- data.frame(
  'Time'=rep(Times, times=4),
  'Price'=c(price_EurCall, price_EurPut, price_AmericaCall, price_AmericaPut),
  'Continent'=c(rep('Europe', times=2*length(Times)), rep('America', times=2*length(Times))),
  'Verb'=c(rep('call', times=length(Times)), rep('put', times=length(Times)), rep('call', times=length(Times)), rep('put', times=length(Times)))
)

write.csv(output, file='simulations/time_price_simulation.csv')

# wrażliwość na zmianę S0
S0s <- seq(1, 100, by=1)
price_EurCall <- rep(0, length(S0s))
price_EurPut <- rep(0, length(S0s))
price_AmericaCall <- rep(0, length(S0s))
price_AmericaPut <- rep(0, length(S0s))

for(k in 1:length(S0s)){
  cat(k, '...\n')
  EurCall <- make_option(TypeContinent = "Europe", TypeVerb = "call", S0 = S0s[k])
  EurPut <- make_option(TypeContinent = "Europe", TypeVerb = "put", S0 = S0s[k])
  AmericaCall <- make_option(TypeContinent = "America", TypeVerb = "call", S0 = S0s[k])
  AmericaPut <- make_option(TypeContinent = "America", TypeVerb = "put", S0 = S0s[k])
  
  price_EurCall[k] <- option_profit_from_tree(make_tree(EurCall))
  price_EurPut[k] <- option_profit_from_tree(make_tree(EurPut))
  price_AmericaCall[k] <- option_profit_from_tree(make_tree(AmericaCall))
  price_AmericaPut[k] <- option_profit_from_tree(make_tree(AmericaPut))
}

plot(S0s, price_EurCall, type='l', col='red', ylim=c(0, max(c(price_EurPut, price_EurCall, price_AmericaCall, price_AmericaPut))))
lines(S0s, price_EurPut, col='black')
lines(S0s, price_AmericaCall, col='green', lwd=2, lty='dashed')
lines(S0s, price_AmericaPut, col='blue', lwd=2, lty='dashed')

output <- data.frame(
  'S0'=rep(S0s, S0s=4),
  'Price'=c(price_EurCall, price_EurPut, price_AmericaCall, price_AmericaPut),
  'Continent'=c(rep('Europe', times=2*length(S0s)), rep('America', times=2*length(S0s))),
  'Verb'=c(rep('call', times=length(S0s)), rep('put', times=length(S0s)), rep('call', times=length(S0s)), rep('put', times=length(S0s)))
)

write.csv(output, file='simulations/S0_price_simulation.csv')

# wrażliwość na zmianę Sigma
Sigmas <- seq(0.01, 0.6, by=0.01)
price_EurCall <- rep(0, length(Sigmas))
price_EurPut <- rep(0, length(Sigmas))
price_AmericaCall <- rep(0, length(Sigmas))
price_AmericaPut <- rep(0, length(Sigmas))

for(k in 1:length(Sigmas)){
  cat(k, '...\n')
  EurCall <- make_option(TypeContinent = "Europe", TypeVerb = "call", Sigma = Sigmas[k])
  EurPut <- make_option(TypeContinent = "Europe", TypeVerb = "put", Sigma = Sigmas[k])
  AmericaCall <- make_option(TypeContinent = "America", TypeVerb = "call", Sigma = Sigmas[k])
  AmericaPut <- make_option(TypeContinent = "America", TypeVerb = "put", Sigma = Sigmas[k])
  
  price_EurCall[k] <- option_profit_from_tree(make_tree(EurCall))
  price_EurPut[k] <- option_profit_from_tree(make_tree(EurPut))
  price_AmericaCall[k] <- option_profit_from_tree(make_tree(AmericaCall))
  price_AmericaPut[k] <- option_profit_from_tree(make_tree(AmericaPut))
}

plot(Sigmas, price_EurCall, type='l', col='red', ylim=c(0, max(c(price_EurPut, price_EurCall, price_AmericaCall, price_AmericaPut))))
lines(Sigmas, price_EurPut, col='black')
lines(Sigmas, price_AmericaCall, col='green', lwd=2, lty='dashed')
lines(Sigmas, price_AmericaPut, col='blue', lwd=2, lty='dashed')

output <- data.frame(
  'Sigma'=rep(Sigmas, Sigmas=4),
  'Price'=c(price_EurCall, price_EurPut, price_AmericaCall, price_AmericaPut),
  'Continent'=c(rep('Europe', times=2*length(Sigmas)), rep('America', times=2*length(Sigmas))),
  'Verb'=c(rep('call', times=length(Sigmas)), rep('put', times=length(Sigmas)), rep('call', times=length(Sigmas)), rep('put', times=length(Sigmas)))
)

write.csv(output, file='simulations/Sigma_price_simulation.csv')

# wrażliwość na zmianę r
rs <- seq(0.001, 0.2, by=0.001)
price_EurCall <- rep(0, length(rs))
price_EurPut <- rep(0, length(rs))
price_AmericaCall <- rep(0, length(rs))
price_AmericaPut <- rep(0, length(rs))

for(k in 1:length(rs)){
  cat(k, '...\n')
  EurCall <- make_option(TypeContinent = "Europe", TypeVerb = "call", r = rs[k])
  EurPut <- make_option(TypeContinent = "Europe", TypeVerb = "put", r = rs[k])
  AmericaCall <- make_option(TypeContinent = "America", TypeVerb = "call", r = rs[k])
  AmericaPut <- make_option(TypeContinent = "America", TypeVerb = "put", r = rs[k])
  
  price_EurCall[k] <- option_profit_from_tree(make_tree(EurCall))
  price_EurPut[k] <- option_profit_from_tree(make_tree(EurPut))
  price_AmericaCall[k] <- option_profit_from_tree(make_tree(AmericaCall))
  price_AmericaPut[k] <- option_profit_from_tree(make_tree(AmericaPut))
}

plot(rs, price_EurCall, type='l', col='red', ylim=c(0, max(c(price_EurPut, price_EurCall, price_AmericaCall, price_AmericaPut))))
lines(rs, price_EurPut, col='black')
lines(rs, price_AmericaCall, col='green', lwd=2, lty='dashed')
lines(rs, price_AmericaPut, col='blue', lwd=2, lty='dashed')

output <- data.frame(
  'r'=rep(rs, rs=4),
  'Price'=c(price_EurCall, price_EurPut, price_AmericaCall, price_AmericaPut),
  'Continent'=c(rep('Europe', times=2*length(rs)), rep('America', times=2*length(rs))),
  'Verb'=c(rep('call', times=length(rs)), rep('put', times=length(rs)), rep('call', times=length(rs)), rep('put', times=length(rs)))
)

write.csv(output, file='simulations/r_price_simulation.csv')

# wrażliwość na zmianę DeltaT
DeltaTs <- seq(0.01, 1, by=0.001)
price_EurCall <- rep(0, length(DeltaTs))
price_EurPut <- rep(0, length(DeltaTs))
price_AmericaCall <- rep(0, length(DeltaTs))
price_AmericaPut <- rep(0, length(DeltaTs))
parity <- as.integer(2/DeltaTs) %%2


for(k in 1:length(DeltaTs)){
  cat(k, '...\n')
  EurCall <- make_option(TypeContinent = "Europe", TypeVerb = "call", DeltaT = DeltaTs[k])
  EurPut <- make_option(TypeContinent = "Europe", TypeVerb = "put", DeltaT = DeltaTs[k])
  AmericaCall <- make_option(TypeContinent = "America", TypeVerb = "call", DeltaT = DeltaTs[k])
  AmericaPut <- make_option(TypeContinent = "America", TypeVerb = "put", DeltaT = DeltaTs[k])
  
  price_EurCall[k] <- option_profit_from_tree(make_tree(EurCall))
  price_EurPut[k] <- option_profit_from_tree(make_tree(EurPut))
  price_AmericaCall[k] <- option_profit_from_tree(make_tree(AmericaCall))
  price_AmericaPut[k] <- option_profit_from_tree(make_tree(AmericaPut))
}

plot(DeltaTs, price_EurCall, type='l', col='red', ylim=c(0, max(c(price_EurPut, price_EurCall, price_AmericaCall, price_AmericaPut))))
lines(DeltaTs, price_EurPut, col='black')
lines(DeltaTs, price_AmericaCall, col='green', lwd=2, lty='dashed')
lines(DeltaTs, price_AmericaPut, col='blue', lwd=2, lty='dashed')

output <- data.frame(
  'DeltaT'=rep(DeltaTs, DeltaTs=4),
  'Price'=c(price_EurCall, price_EurPut, price_AmericaCall, price_AmericaPut),
  'Continent'=c(rep('Europe', times=2*length(DeltaTs)), rep('America', times=2*length(DeltaTs))),
  'Verb'=c(rep('call', times=length(DeltaTs)), rep('put', times=length(DeltaTs)), rep('call', times=length(DeltaTs)), rep('put', times=length(DeltaTs))),
  'parity' = rep(parity,4)
)

write.csv(output, file='simulations/DeltaT_price_simulation.csv')