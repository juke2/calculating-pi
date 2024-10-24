let message: string = 'Hello World, From Typescript!';
console.log(message);

function calculate_pi_from_double_factorial_series(iterations: number) {
    let sum: number = 0.0;
    for(let k:number = 0; k < iterations; k++ ){
        sum += factorial(k) / (double_factorial(2*k + 1) * 2**k)
    }
    return sum * 3 * Math.sqrt(3) / 2;
}

function factorial(x:number){
    let product: number = 1;
    for(let i:number = 1; i <= x; i++){
        product *= i;
    }
    return product;
}

function double_factorial(x:number){
    let product: number = 1;
    for(let i:number = ((x%2 == 1 ) ? 1 : 2); i <= x; i+= 2){
        product *= i;
    }
    return product;
}

let ITERATIONS = 100;
let ITERATIONS_FOR_AVG = 50;
let start = performance.now();
for(let iteration:number = 0; iteration < ITERATIONS_FOR_AVG; iteration++){
    calculate_pi_from_double_factorial_series(100)
}
let end = performance.now();
let avg_time_taken_in_ms  = (end - start)/ITERATIONS_FOR_AVG;
console.log(`Value of pi calculated with a double factorial series: ${calculate_pi_from_double_factorial_series(ITERATIONS)}\nAverage Time Taken (in milliseconds): ${avg_time_taken_in_ms}\nNumber of iterations: ${ITERATIONS}`)

