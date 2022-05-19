make_option = function(
    TypeContinent='Europe',
    TypeVerb='call',
    Strike=48,
    Time=2,
    S0=50,
    r=0.02,
    DeltaT=1/12,
    Sigma=0.3,
    change_u_by=0,
    change_d_by=0
){  # tworzy opcję o ustalonych parametrach, jeśli chcemy przesunąć u lub d,
    # to należy skorzystać z argumentów change_u_by i change_d_by kolejno
    option = list(
        'TypeContinent'=TypeContinent,
        'TypeVerb'=TypeVerb,
        'Strike'=Strike,
        'Time'=Time,
        'S0'=S0,
        'r'=r,
        'DeltaT'=DeltaT,
        'Sigma'=Sigma,
        'u'=exp(Sigma*sqrt(DeltaT)) + change_u_by,
        'd'=exp(-Sigma*sqrt(DeltaT)) + change_d_by
    )
    
    return(option)
}

payoff = function(option){
    # liczy payoffy podanej opcji, działa różnież gdy S0 to wektor cen aktywów bazowych
    # zwraca wektor rzeczonych payoffów
    if(option$TypeVerb == 'call'){
        result = sapply(option$S0, function(s){max(s - option$Strike, 0)})
    }else if(option$TypeVerb == 'put'){
        result = sapply(option$S0, function(s){max(option$Strike - s, 0)})
    }
    return(result)
}

branch_payoffs = function(option, depth){
    # liczy payoffy dla danej opcji, na odpowiedniej głębokości drzewa duwmianowego
    # zwraca wektor
    STs = option$S0 * option$u^(depth:0) * option$d^(0:depth)
    sub_option = option
    sub_option$S0 = STs
    return(payoff(sub_option))
}

node_value =function(option, vu, vd, p, node_payoff){
    # liczy profit i "czy sie oplaca" dla danego liscia w drzewie dwumianowym
    # zwraca wektor dwuelementowy, wartość oraz 1 jeśli w tym momencie oplaca sie wykonanie
    # albo 0 jesli sie nie oplaca wykonanie opcji amarykanskiej
    price_moment = 0
    if(option$TypeContinent == 'Europe'){
        price = p * vu + (1-p) * vd
    }else if(option$TypeContinent == 'America'){
        price = max(p * vu + (1-p) * vd, node_payoff)
        if(node_payoff > p * vu + (1-p) * vd){
            price_moment = 1
        }
    }
    return(c(price * exp(-option$r * option$DeltaT), price_moment))
}

branch_value = function(option, last_branch, this_branch_payoffs){
    # liczy profity dla tego brancha, na podstawie poprzedniego i payoffow obecnego
    # zwraca liste z wektorem profitow i wektorem momentów opłacalności wykonania
    p = (exp(option$r * option$DeltaT) - option$d) / (option$u - option$d)
    branch_prices = c()
    branch_moments = c()
    for(k in 1:(length(last_branch)-1)){
        node_price_and_moment = node_value(option, last_branch[k], last_branch[k+1], p, this_branch_payoffs[k])
        branch_prices[k] = node_price_and_moment[1]
        branch_moments[k] = node_price_and_moment[2]
    }
    return(list('branch_prices'=branch_prices, 'branch_moments'=branch_moments))
}

make_tree = function(option){
    # liczy wartosci drzewa dla modelu dwumianowego dla podanej opcji
    # zwraca drzewo profitów i drzewo momentów opłacalności
    # jako drzewo rozumiemy tutaj liste coraz krószych wektorów
    depth = as.integer(option$Time / option$DeltaT)
    moment_tree = list()
    price_tree = list()
    price_tree[[1]] = branch_payoffs(option, depth)
    moment_tree[[1]] = rep(0, depth)
    for(k in 2:(depth+1)){
        branch_profits_and_moments = branch_value(option, price_tree[[k-1]], branch_payoffs(option, depth-k+1))
        price_tree[[k]] = branch_profits_and_moments$branch_prices
        moment_tree[[k]] = branch_profits_and_moments$branch_moments
    }
    return(list(
        'price_tree' = price_tree,
        'moment_tree' = moment_tree
    ))
}

option_profit_from_tree = function(tree){
    # zwraca profit opcji na podstawie której zbudowano drzewo dwumianowe
    return(tree$price_tree[[length(tree$price_tree)]])
}

plot_tree <- function(option, tree, main){
  # wyświetla prosty wykres cen o tytule maim, naszego drzewa, dla podanej opcji
  # wydaje mi się, że warto to przerobić na ggplot2
  # ogólnie wygląda to ładnie, warto wrzucić kilka takich smaczków do raportu
  depth <- length(tree$price_tree)
  max_price <- max(sapply(tree$price_tree, max))
  plot(
    0, 
    tree$price_tree[[depth]], 
    type="p", 
    xlim=c(0, option$Time), 
    ylim=c(0, max_price),
    main=main,
    ylab="Price",
    xlab="Time",
    pch=tree$moment_tree[[depth]]*15 + 1,
  )
  for(k in 2:depth){
    points(rep((k-1)*option$DeltaT, k), tree$price_tree[[depth-k+1]], pch=tree$moment_tree[[depth-k+1]]*15+1)
  }
}
