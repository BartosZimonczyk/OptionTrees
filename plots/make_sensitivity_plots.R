source('src/basic_functions.R')
library(data.table)
library(ggplot2)

# wrażliwość na zmianę Strike

Strikes <- seq(18, 78, by=1)
strike_price_simulation <- read.csv(file='simulations/strike_price_simulation.csv', row.names = 1)
ggplot(strike_price_simulation)+
  geom_line(aes(x = Strike, y = Price, color = Continent, linetype = Verb))+
  theme_bw()


# wrażliwość na zmianę Time



time_price_simulation <- read.csv(file='simulations/time_price_simulation.csv', row.names = 1)
ggplot(time_price_simulation)+
  geom_line(aes(x = Time, y = Price, color = Continent, linetype = Verb))+
  theme_bw()


# wrażliwość na zmianę S0


s0_price_simulation <- read.csv(file='simulations/S0_price_simulation.csv', row.names = 1)
ggplot(s0_price_simulation)+
  geom_line(aes(x = S0, y = Price, color = Continent, linetype = Verb))+
  theme_bw()


# wrażliwość na zmianę Sigma

sigma_price_simulation <- read.csv(file='simulations/sigma_price_simulation.csv', row.names = 1)
ggplot(sigma_price_simulation)+
  geom_line(aes(x = Sigma, y = Price, color = Continent, linetype = Verb))+
  theme_bw()


# wrażliwość na zmianę r


r_price_simulation <- read.csv(file='simulations/r_price_simulation.csv', row.names = 1)
ggplot(r_price_simulation)+
  geom_line(aes(x = r, y = Price, color = Continent, linetype = Verb))+
  theme_bw()



# wrażliwość na zmianę DeltaT


DeltaT_price_simulation <- read.csv(file='simulations/DeltaT_price_simulation.csv', row.names = 1)
ggplot(DeltaT_price_simulation)+
  geom_line(aes(x = DeltaT, y = Price, color = Continent, linetype = Verb))+
  theme_bw()
