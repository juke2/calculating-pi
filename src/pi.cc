#include <iostream>
#include <cmath>
#include <string>
#include <chrono>
using namespace std;

long double recurse_perimiter(int iterations, long double pinscribed, long double pcircumscribed, long long n)
{
    if (iterations == 0)
    {
        return ((pinscribed + pcircumscribed) / 4);
    }
    long double next_pcircumscribed = (2 * pinscribed * pcircumscribed) / (pinscribed + pcircumscribed);
    long double next_pinscribed = sqrtl(next_pcircumscribed * pinscribed);
    return recurse_perimiter(iterations - 1, next_pinscribed, next_pcircumscribed, n * 2);
}
long double calculate_pi_from_perimiter_recursion(int iterations)
{
    // see https://en.wikipedia.org/wiki/Approximations_of_%CF%80#Polygon_approximation_to_a_circle for explanation
    long double pinscribed = 4 * sqrtl(2);
    long double pcircumscribed = 8;
    long long n = 4; // start with a square, we don't actually need to store this but using for visualization purposes
    return recurse_perimiter(iterations, pinscribed, pcircumscribed, n);
}

int main()
{
    int iterations = 100;
    int iterations_for_avg = 50;
    std::chrono::steady_clock::time_point start_time = std::chrono::steady_clock::now();
    for (int iteration = 0; iteration < iterations_for_avg; iteration++)
    {
        calculate_pi_from_perimiter_recursion(iterations);
    }
    std::chrono::steady_clock::time_point end_time = std::chrono::steady_clock::now();
    auto time_taken = chrono::duration_cast<chrono::nanoseconds>(end_time - start_time).count();
    auto avg_time_taken = time_taken / iterations_for_avg;
    cout << "Hello World, From C++!\n";
    long double pi_val = calculate_pi_from_perimiter_recursion(100);
    printf("Value of pi calculated using recursive perimiters: %0.30Lf\nAvg. Time Taken (in nanoseconds): %i\nNumber of iterations: %i\n", pi_val, avg_time_taken, iterations);
    return 0;
}