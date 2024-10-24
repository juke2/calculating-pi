use std::time::{Duration,Instant};
fn main() -> () {
    let iterations = 50;
    let iterations_for_avg = 100;
    println!("Hello World, From Rust!");
    let mut total_duration = Duration::new(0,0);
    for _iteration in 0..20{
        let start = Instant::now();
        calculate_pi_newton_euler_convergence(iterations);
        total_duration += start.elapsed();
    } 
    let time_ns = total_duration.as_nanos()/iterations_for_avg;
    println!("Value of pi calculated with the Newton/Euler convergence: {} \nAverage Time Taken (nanoseconds): {} \nNumber of Iterations: {}",calculate_pi_newton_euler_convergence(50), time_ns, iterations);
}

fn calculate_pi_newton_euler_convergence(iterations: u32) -> f64 {
    let mut sum = 0.0_f64;
    for n in 0..iterations{
        // println!("{}",((2_f64).powf(n.into()) * factorial(n) * factorial(n))/factorial(2*n + 1));
        sum += ((2_f64).powf(n.into()) * factorial(n) * factorial(n))/factorial(2*n + 1);
    } // maybe simplify this later by combining factorial series to allow for more iterations
    // can't simplify easily (would require doing more floating point operations so I think it would actually increase execution time)
    return sum*2_f64;

}

fn factorial(i: u32) -> f64 {
    let mut result = 1_f64;
    for n in 1..=i{
        result *= f64::from(n);
    }
    return result;
}
