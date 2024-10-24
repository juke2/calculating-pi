var message = 'Hello World, From Typescript!';
console.log(message);
function calculate_pi_from_double_factorial_series(iterations) {
    var sum = 0.0;
    for (var k = 0; k < iterations; k++) {
        sum += factorial(k) / (double_factorial(2 * k + 1) * Math.pow(2, k));
    }
    return sum * 3 * Math.sqrt(3) / 2;
}
function factorial(x) {
    var product = 1;
    for (var i = 1; i <= x; i++) {
        product *= i;
    }
    return product;
}
function double_factorial(x) {
    var product = 1;
    for (var i = ((x % 2 == 1) ? 1 : 2); i <= x; i += 2) {
        product *= i;
    }
    return product;
}
var ITERATIONS = 100;
var ITERATIONS_FOR_AVG = 50;
var start = performance.now();
for (var iteration = 0; iteration < ITERATIONS_FOR_AVG; iteration++) {
    calculate_pi_from_double_factorial_series(100);
}
var end = performance.now();
var avg_time_taken_in_ms = (end - start) / ITERATIONS_FOR_AVG;
console.log("Value of pi calculated with a double factorial series: ".concat(calculate_pi_from_double_factorial_series(ITERATIONS), "\nAverage Time Taken (in milliseconds): ").concat(avg_time_taken_in_ms, "\nNumber of iterations: ").concat(ITERATIONS));
