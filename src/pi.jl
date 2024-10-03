using Printf

function main()
    print("Hello World, From Julia!\n")
    iterations = 12000
    iterations_for_avg = 50
    start_time = time_ns()
    for n in 1:iterations_for_avg
        calculate_pi_from_riemann_zeta_function(iterations)
    end
    end_time = time_ns()
    avg_time_diff = (end_time - start_time)/iterations_for_avg
    value_of_pi = calculate_pi_from_riemann_zeta_function(iterations)
    @printf("Value of pi calculated with the Riemann-Zeta function: %f\nAvg. time taken (in nanoseconds): %f\nNumber of iterations: %f",value_of_pi,avg_time_diff,iterations)
    


end 

function calculate_pi_from_riemann_zeta_function(iterations::Int)
    sum = 0
    for n in 1:iterations
        sum += 1 / (n^2)
    end
    return sqrt(sum * 6)
end

main()