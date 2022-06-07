source('src/basic_functions.R')
source('src/plot_functions.R')



option_europe_put <- make_option(TypeContinent = "Europe", TypeVerb = "put")
tree_europe_put <- make_tree(option_europe_put)
plot_tree(option_europe_put, tree_europe_put)
plot_tree(option_europe_put, tree_europe_put, log_y = TRUE)

option_europe_call <- make_option(TypeContinent = "Europe", TypeVerb = "call")
tree_europe_call <- make_tree(option_europe_call)
plot_tree(option_europe_call, tree_europe_call)
plot_tree(option_europe_call, tree_europe_call, log_y = TRUE)


option_america_put <- make_option(TypeContinent = "America", TypeVerb = "put")
tree_america_put <- make_tree(option_america_put)
plot_tree(option_america_put, tree_america_put)
plot_tree(option_america_put, tree_america_put, log_y = TRUE)

option_america_call <- make_option(TypeContinent = "America", TypeVerb = "call")
tree_america_call <- make_tree(option_america_call)
plot_tree(option_america_call, tree_america_call)
plot_tree(option_america_call, tree_america_call, log_y = TRUE)
