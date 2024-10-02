"use strict";

function main() {
  console.log("Hello World, From JavaScript!");
  let iteration_count = 5000;
  let iterations_for_avg = 20;
  var start = performance.now();
  for (let iteration = 0; iteration < iterations_for_avg; iteration++) {
    calculate_pi_with_wallis_product(iteration_count);
  }
  var end = performance.now();
  let avg_time_taken_in_ms = (end - start) / iterations_for_avg;
  console.log(
    `Value of pi calculated with the wallis product: ${calculate_pi_with_wallis_product(
      iteration_count
    )}\nAvg. Time Taken (in milliseconds): ${avg_time_taken_in_ms}\nNumber of iterations: ${iteration_count}`
  );
}

function calculate_pi_with_wallis_product(iterations) {
  let product = 1;
  for (let i = 1; i <= iterations; i++) {
    product *= (4 * i * i) / (4 * i * i - 1);
  }
  return product * 2;
}

main();
