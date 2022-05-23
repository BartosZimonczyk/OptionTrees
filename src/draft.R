source('src/basic_functions.R')

optEurCall <- make_option(TypeContinent = "Europe", TypeVerb = "call")
optEurPut <- make_option(TypeContinent = "Europe", TypeVerb = "put")
optAmericaCall <- make_option(TypeContinent = "America", TypeVerb = "call")
optAmericaPut <- make_option(TypeContinent = "America", TypeVerb = "put")

t1 <- make_tree(optEurCall)
t2 <- make_tree(optEurPut)
t3 <- make_tree(optAmericaCall)
t4 <- make_tree(optAmericaPut)

plot_tree(optEurCall, t1, "Europejska call")
plot_tree(optEurPut, t2, "Europejska put")
plot_tree(optAmericaCall, t3, "Amerykańska call")
plot_tree(optAmericaPut, t4, "Amerykańksa put")
# jedno drzewo z cenami akcji i kolorować na podstrawie ceny opcji
# na koncu jeśli payoff > 0 to warto wykonać
# sprawdzic jaka jest cena koncowa w zależności od parzystości ceny

