source('src/basic_functions.R')
library(ggplot2)

#prosta funckja do policzenia zawartości portfela w danym momencie po podaniu S_A, S_B, V_A, V_B, deltaT i stopy procentowej
#nieużywana później

simple_solver <- function(payoffA,payoffB,profitA,profitB,dt,stopa){
  if (payoffA > 0 & payoffB > 0){
    delta <- (profitA - profitB)/(payoffA - payoffB)
    alpha <- (profitB - delta*payoffB)/exp(stopa*dt)
    portfel <- list('stock'=delta,'cash/loan'=alpha)
    
  } else {
    portfel <- list('stock'=0,'cash/loan'=0)
  }
  return(portfel)
}


wallet <- function(option){
  #liczy ilość delta akcji i alfa gotówki/pożyczki (w zależności czy + czy -) dla opcji
  #output ma taki sam format jak make_tree 
  tree <- make_tree(option)
  depth = as.integer(option$Time / option$DeltaT)
  delta <- list()
  alpha <- list()
  for (j in 1:(depth+1)){
    delta[[j]] <- rep(0,26-j)
    alpha[[j]] <- rep(0,26-j)
  }
  
  #z palca liczę ostatni moment, podzieliłem na put i call osobno bo tak mi było łatwiej to rozkminić
  
  if (option$TypeVerb == 'call'){
    for (p in 1:(depth+1)){
      if (tree$price_tree[[1]][p] != 0){
        delta[[1]][p] <- (tree$price_tree[[1]][1] - tree$price_tree[[1]][2])/(tree$asset_price_tree[[1]][1] - tree$asset_price_tree[[1]][2])
        alpha[[1]][p] <- (tree$price_tree[[1]][2] - delta[[1]][p]*tree$asset_price_tree[[1]][2])/exp(option$r*option$DeltaT)
      }
    }
  } else {
    for (p in 1:(depth+1)){
      if (tree$price_tree[[1]][p] != 0){
        delta[[1]][p] <- (tree$price_tree[[1]][depth] - tree$price_tree[[1]][depth+1])/(tree$asset_price_tree[[1]][depth] - tree$asset_price_tree[[1]][depth+1])
        alpha[[1]][p] <- (tree$price_tree[[1]][depth+1] - delta[[1]][p]*tree$asset_price_tree[[1]][depth+1])/exp(option$r*option$DeltaT)
      }
    }
  }
  
  for (k in 2:(depth+1)){
    for (i in 1:length(tree$price_tree[[k]])){
      delta[[k]][i] = (tree$price_tree[[k-1]][i] - tree$price_tree[[k-1]][i+1])/(tree$asset_price_tree[[k-1]][i] - tree$asset_price_tree[[k-1]][i+1])
      alpha[[k]][i] = (tree$price_tree[[k-1]][i+1] - delta[[k]][i]*tree$asset_price_tree[[k-1]][i+1])/exp(option$r*option$DeltaT)
    }
  }
  
  return(list(
    'stock' = delta,
    'cash_loan' = alpha
  ))
}


#######3 rysowanie ##############

#analogicznie do tree_to_df, potrzebne żeby można było to ggplotem rysować
#biorę input z portfela, drzewa i opcji żeby móc rysować 2 wykresy w odniesieniu do asset_price
wallet_to_df = function(wallet,tree, option){
  stocks = unlist(wallet$stock)
  cash_loans = unlist(wallet$cash_loan)
  
  
  prices = unlist(tree$price_tree)
  asset_prices = unlist(tree$asset_price_tree)
  moments <- unlist(tree$moment_tree)
  
  depth = as.integer(option$Time / option$DeltaT)
  times = unlist(sapply(depth:0, function(k){rep((k)*option$DeltaT, k+1)}))
  return(data.frame("prices" = prices, "asset_prices" = asset_prices, "stocks" = stocks, "cash_loans" = cash_loans, "moments" = moments, "times" = times))
}


#tu jest kodzik do plotowania hajs w portfelu i akcji na jednym wykresie, ale no to wyglądało jak gówno to nie używam XD

# plot_wallet <- function(option,tree,wallet,main = "",max_stock = NULL,max_cash_loan = NULL,log_y = FALSE){
#   wallet_df <- wallet_to_df(wallet,tree,option)
#   
#   if (is.null(max_stock)){
#     max_stock <- max(sapply(wallet$stock, max))
#   }
#   
#   if (is.null(max_cash_loan)){
#     max_cash_loan <- max(sapply(wallet$cash_loan,max))
#   }
#   
#   
#   graph <- ggplot()+
#     geom_point(data = wallet_df,
#                aes(x = times, y = cash_loans, color = stocks, shape = as.factor(moments)))+
#     scale_shape_manual(values = c(2, 16)) +
#     scale_color_viridis_c() +
#     theme_bw()
#   
#   if (log_y){
#     graph <- graph + scale_y_continuous(trans = "log")
#   }
#   
#   return(graph)
# }



# funkcja do rysowania zawartości portfela
#biorę input z portfela, drzewa i opcji żeby móc rysować 2 wykresy w odniesieniu do asset_price
# rysowanie jednego wykresu na którym były i akcje i gotówka z portfela było nieczytelne

plot_tree_wallet <- function(option, tree, wallet, main = "", max_price = NULL, max_asset_price = NULL, max_stock = NULL, max_cash_loan = NULL, log_y = FALSE){
  
  wallet_df <- wallet_to_df(wallet,tree,option)
  
  tree_df = tree_to_df(tree, option)
  
  if (is.null(max_stock)){
    max_stock <- max(sapply(wallet$stock, max))
  }
  
  if (is.null(max_cash_loan)){
    max_cash_loan <- max(sapply(wallet$cash_loan,max))
  }
  
  if (is.null(max_price)){
    max_price <- max(sapply(tree$price_tree, max))
  }
  if (is.null(max_asset_price)){
    max_asset_price <- max(sapply(tree$asset_price_tree, max))
  }
  
  
  #dorzuciłem w nazwach wykresów jaka to opcja i czy wykres koloruje na podstawie ilości akcji czy gotówki
  #wydaje mi się to bardziej czytelne, bo bez tego to nie wiadomo na co się patrzy
  
  graph1 <- ggplot() +
    geom_point(data = wallet_df,
               aes(x = times, y = asset_prices, color = cash_loans, shape = as.factor(moments)))+
    scale_shape_manual(values = c(2, 16)) +
    scale_color_viridis_c() +
    ggtitle(paste(option$TypeContinent, option$TypeVerb," - cash/loan")) +
    theme_bw()
  
  graph2 <- ggplot()+
    geom_point(data = wallet_df,
               aes(x = times, y = asset_prices, color = stocks, shape = as.factor(moments)))+
    scale_shape_manual(values = c(2, 16)) +
    scale_color_viridis_c() +
    ggtitle(paste(option$TypeContinent, option$TypeVerb, ' - stocks')) +
    theme_bw()
  
  if (log_y){
    graph1 <- graph1 + scale_y_continuous(trans = "log")
    graph2 <- graph2 + scale_y_continuous(trans = "log")
  }
  
  out <- list(graph1,graph2)
  
  return(out)
}


######### wywołania #############

optEurCall_test <- make_option(TypeContinent = "Europe", TypeVerb = "call")
optEurPut_test <- make_option(TypeContinent = "Europe", TypeVerb = "put")
optAmericaCall_test <- make_option(TypeContinent = "America", TypeVerb = "call")
optAmericaPut_test <- make_option(TypeContinent = "America", TypeVerb = "put")

t1_test <- make_tree(optEurCall_test)
t2_test <- make_tree(optEurPut_test)
t3_test <- make_tree(optAmericaCall_test)
t4_test <- make_tree(optAmericaPut_test)

t1_wallet <- wallet(optEurCall_test)
t2_wallet <- wallet(optEurPut_test)
t3_wallet <- wallet(optAmericaCall_test)
t4_wallet <- wallet(optAmericaPut_test)


plot_tree_wallet(optEurCall_test,t1_test,t1_wallet,log_y = TRUE)
plot_tree_wallet(optEurPut_test,t2_test,t2_wallet,log_y = TRUE)
plot_tree_wallet(optAmericaCall_test,t3_test,t3_wallet,log_y = TRUE)
plot_tree_wallet(optAmericaPut_test,t4_test,t4_wallet,log_y = TRUE)






