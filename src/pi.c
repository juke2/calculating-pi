#include <math.h>
#include <stdio.h>
#include <time.h>

double calc_pi_viete(int iterations)
{
    double product = 1.0;
    double a = sqrt(2.0);
    for (int i = 1; i <= iterations; i++)
    {
        product *= a / 2;
        a = sqrt(2.0 + a);
    }
    return (1.0 / product) * 2;
}

int main()
{
    int ITERATIONS_FOR_AVG = 50;
    int ITERATIONS = 100;
    printf("Hello World, From C!\n");
    double result = calc_pi_viete(ITERATIONS);
    double time_sum = 0.0;
    for (int i = 0; i < ITERATIONS_FOR_AVG; i++)
    {
        clock_t start = clock();
        calc_pi_viete(ITERATIONS);
        clock_t end = clock();
        time_sum += (double)(end - start) / CLOCKS_PER_SEC;
    }
    double time_avg = time_sum / ITERATIONS_FOR_AVG;
    int nanosecond_conversion = 1000000000;
    double time_avg_in_ns = time_avg * nanosecond_conversion;
    printf("Value of pi calculated by Viete's series: %.10f.\nAverage time taken (nanoseconds): %.f.\nNumber of iterations: %.d\n", result, time_avg_in_ns, ITERATIONS);

    return 0;
}
