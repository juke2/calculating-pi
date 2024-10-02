puts "Hello World, From Ruby!"
NUMBER_OF_ITERATIONS = 3000
NUMBER_OF_ITERATIONS_FOR_AVG_TIME = 100

def main
    iteration = 1
    total_time = 0.0
    until iteration > NUMBER_OF_ITERATIONS_FOR_AVG_TIME
        start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        calculate_pi_with_wallis_product(NUMBER_OF_ITERATIONS)
        stop = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        total_time = total_time + (stop - start)
        iteration = iteration + 1
    end
    avg_time_taken = total_time.fdiv(NUMBER_OF_ITERATIONS_FOR_AVG_TIME)
    result = calculate_pi_with_wallis_product(NUMBER_OF_ITERATIONS)
    puts "Value of pi calcualted iteratively with the Madhava-Leibniz series: " + result.to_s + ". \nNumber of Iterations: " + NUMBER_OF_ITERATIONS.to_s + ". \nAverage Time Taken: " + (avg_time_taken * 1000).to_s + "(in ms)."
end

def calculate_pi_with_wallis_product iterations
    product = 1.0
    current_iteration = 1
    until current_iteration > iterations
        top = 4.0 * current_iteration * current_iteration
        bottom = 4.0 * current_iteration * current_iteration - 1.0
        product = product * top.fdiv(bottom)
        current_iteration = current_iteration + 1
    end
    return product * 2
end

main