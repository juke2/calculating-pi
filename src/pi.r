main <- function(){
    cat('Hello World, From R!\n')
    num.iterations <- 20000
    num.iterations.for.avg <- 50
    start.time <- Sys.time()
    for(iteration in 1:num.iterations.for.avg){
        calc.pi.unnamed.inverse.square(num.iterations)
    }
    end.time <- Sys.time()
    time.taken <- (end.time - start.time)/num.iterations.for.avg
    time.taken.ms <- as.numeric(time.taken)*1000
    result <- calc.pi.unnamed.inverse.square(num.iterations)
    output <- sprintf("Value of pi calculated with inverse square formula: %f\nAvg. Time Taken (in milliseconds): %f4\nNumber of iterations: %s\n",result,time.taken.ms,num.iterations )
    cat(output)
    
}
#https://en.wikipedia.org/wiki/List_of_formulae_involving_%CF%80#Other_infinite_.series 1/(2n)^2 starting at n = 1 that is equal to \frac{\pi^2}{24}
calc.pi.unnamed.inverse.square <- function(iterations){
    sum <- 0
    for (n in 1:iterations){
        sum <- sum + (1/((2*n)^2))
    }
    return(sqrt(sum*24))
}
main()