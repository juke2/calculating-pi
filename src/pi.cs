using System;
using System.Diagnostics;

namespace CalculatingPi
{
    class Pi
    {
        const int iterations = 3000;
        const int iterations_for_avg = 50;
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World, From C#!");
            Stopwatch timer = new Stopwatch();
            timer.Start();
            for (int iteration = 0; iteration < iterations_for_avg; iteration++)
            {
                calculate_pi_with_madhavas_series(iterations);
            }
            timer.Stop();
            long average_time = timer.ElapsedMilliseconds / iterations_for_avg;
            double output = calculate_pi_with_madhavas_series(iterations);
            Console.WriteLine($"Value of pi calculated with Madhava's series: {output}\nTime taken (in milliseconds): {1 * 2}\nAmount of iterations: {iterations}");
        }

        static double calculate_pi_with_madhavas_series(int iterations)
        {
            double sum = 0;
            for (int i = 0; i < iterations; i++)
            {
                sum += Math.Pow(-3, -i) / (2 * i + 1);
            }
            return Math.Sqrt(12) * sum;
        }
    }
}