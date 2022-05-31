source('src/basic_functions.R')
library(data.table)
library(ggplot2)

# wrażliwość na zmianę Strike

Strikes <- seq(18, 78, by=1)
strike_price_simulation <- read.csv(file='simulations/strike_price_simulation.csv', row.names = 1)
g1 <- ggplot(strike_price_simulation)+
  geom_line(aes(x = Strike, y = Price, color = Continent, linetype = Verb))+
  scale_color_discrete(labels = c("Amerykańskie", "Europejskie"))+
  labs(y = "Cena", color = "Typ:", linetype = "Typ:")+
  theme_bw()

ggsave("plots/Sensetivity_plots/Strike.png", g1)





# wrażliwość na zmianę Time



time_price_simulation <- read.csv(file='simulations/time_price_simulation.csv', row.names = 1)
g2 <- ggplot(time_price_simulation)+
  geom_line(aes(x = Time, y = Price, color = Continent, linetype = Verb))+
  scale_color_discrete(labels = c("Amerykańskie", "Europejskie"))+
  labs(y = "Cena", color = "Typ:", linetype = "Typ:", x = "T")+
  theme_bw()

ggsave("plots/Sensetivity_plots/Time.png", g2)


## amerykańska nie może spaść b możemy wykonoać wcześniej
## jak za długo czekamy to europejska spada


# wrażliwość na zmianę S0


s0_price_simulation <- read.csv(file='simulations/S0_price_simulation.csv', row.names = 1)
g3 <- ggplot(s0_price_simulation)+
  geom_line(aes(x = S0, y = Price, color = Continent, linetype = Verb))+
  scale_color_discrete(labels = c("Amerykańskie", "Europejskie"))+
  labs(y = "Cena", color = "Typ:", linetype = "Typ:")+
  theme_bw()

ggsave("plots/Sensetivity_plots/S0.png", g3)


# wrażliwość na zmianę Sigma

sigma_price_simulation <- read.csv(file='simulations/sigma_price_simulation.csv', row.names = 1)
g4 <- ggplot(sigma_price_simulation)+
  geom_line(aes(x = Sigma, y = Price, color = Continent, linetype = Verb))+
  scale_color_discrete(labels = c("Amerykańskie", "Europejskie"))+
  labs(y = "Cena", color = "Typ:", linetype = "Typ:")+
  theme_bw()

ggsave("plots/Sensetivity_plots/Sigma.png", g4)


# wrażliwość na zmianę r


r_price_simulation <- read.csv(file='simulations/r_price_simulation.csv', row.names = 1)
g5 <- ggplot(r_price_simulation)+
  geom_line(aes(x = r, y = Price, color = Continent, linetype = Verb))+
  scale_color_discrete(labels = c("Amerykańskie", "Europejskie"))+
  labs(y = "Cena", color = "Typ:", linetype = "Typ:")+
  theme_bw()

ggsave("plots/Sensetivity_plots/r.png", g5)


# wrażliwość na zmianę DeltaT

DeltaTs <- seq(0.01, 1, by=0.001)
parity <- as.integer(2/DeltaTs) %%2

DeltaT_price_simulation <- read.csv(file='simulations/DeltaT_price_simulation.csv', row.names = 1)
g6 <-
  ggplot(cbind(DeltaT_price_simulation))+
  geom_line(aes(x = DeltaT, y = Price, linetype = Verb, color = Continent))+
  # geom_line(aes(x = DeltaT, y = Price,linetype = Continent), alpha= 0.2, size = 0.1)+
  # facet_grid(~Verb)+
  scale_color_discrete(labels = c("Amerykańskie", "Europejskie"))+
  labs(y = "Cena", color = "Typ:", linetype = "Typ:")+
  theme_bw()

ggsave("plots/Sensetivity_plots/deltaT.png", g6)

# g7 <-
#   ggplot(cbind(DeltaT_price_simulation, parity = parity)[DeltaT_price_simulation$Continent == "America" & DeltaT_price_simulation$Verb=="put", ])+
#   geom_point(aes(x = DeltaT, y = Price, color = as.factor(parity)), shape = 20, alpha = 1, size = 0.1)+
#   scale_color_discrete(labels = c("Amerykańskie", "Europejskie"))+
#   labs(y = "Cena", color = "Parzystość:")+
#   theme_bw()
# 
# ggsave("plots/Sensetivity_plots/deltaT_parity.png", g7)


# skąd sie bierze parzyste nieparzyste -> 

## kluczowe dla 4 podstawowych opcji, analiza wrażliwości jako coś ekstra

## mamy cenę opcji V_t
## P_t to ma być cena portfela
# portfel ma replikować cenę opcji - V_t = P_t
# popatrzeć na deltę w różnych węzłach drzewa, co się dzieje, czyli chcemy ten portfel jakby reorganizować co dT

