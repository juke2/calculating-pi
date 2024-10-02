print("Hello, World From Lua!")
function main()
    NUM_ITERATIONS = 1000
    NUM_ITERATIONS_FOR_TIME_AVG = 100
    time_sum = 0   
    result = pi_from_madhava_leibniz_series(NUM_ITERATIONS)
    print(string.format("Value of pi calcualted iteratively with the Madhava-Leibniz series: %f. \nNumber of Iterations: %d. \nNo time measured because lua os.clock() is system dependent... may god save our souls.", result, NUM_ITERATIONS))
end

function pi_from_madhava_leibniz_series(num_iterations)
    sum = 0
    for n = 0, num_iterations-1, 1 do
        sum = sum + (n%2 == 1 and -1 or 1) / (2*n + 1)
    end
    return sum * 4
end

main()