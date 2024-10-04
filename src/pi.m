1;

function retval = riemann(x, iterations)
    sum = 0;
    for k = 1:iterations
        sum = sum + 1/(power(k,x));
    endfor
    retval = sum;
endfunction

function retval = calculate_pi_with_riemann_zeta_function_with_multiplier(iterations)
    sum = 0;
    for k = 1:iterations
        sum = sum + (power(3,k) -  1) / (power(4,k)) * (riemann (k+1,iterations));
    endfor
    retval = sum;
endfunction

function main ()
    printf("Hello World, From Octave! (Ignore any error it is related to octave running on wsl2)\n");
    iterations = 400;
    iterations_for_avg = 5;
    start_time = clock();
    for iteration = 1:iterations_for_avg
        calculate_pi_with_riemann_zeta_function_with_multiplier(iterations);
    endfor
    time_taken = etime(clock(), start_time)/iterations_for_avg;
    result = calculate_pi_with_riemann_zeta_function_with_multiplier(iterations);
    printf("Value of pi calculated with a version of the riemann zeta function: %f\nAvg. time taken (in seconds): %f\nNumber of iterations: %d\n",result,time_taken,iterations)
    
endfunction

main;