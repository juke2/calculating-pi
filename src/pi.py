from decimal import Decimal, setcontext, Context
from time import time


def main() -> None:
    ITERATIONS = 200
    ITERATIONS_FOR_AVG = 30
    PRECISION = 50
    setcontext(Context(prec=PRECISION))
    print("Hello World, From Python!")
    output = None
    time_sum_seconds = 0
    for i in range(ITERATIONS_FOR_AVG):
        start_time_seconds = time()
        output = pi_from_nilakantha_series(ITERATIONS)
        end_time_seconds = time()
        time_sum_seconds += end_time_seconds - start_time_seconds
    average_time_seconds = time_sum_seconds / ITERATIONS_FOR_AVG
    average_time_ms = int(average_time_seconds * 1000)
    average_time_ns = int(average_time_seconds * 1000000000)
    print(
        f"Value of pi calcualted with the Nilakantha Series: {output}.\nAverage Time of execution (in nanoseconds): {average_time_ns}.\nAverage Time of execution (in milliseconds): {average_time_ms}.\nNumber of Iterations: {ITERATIONS}."
    )


def pi_from_nilakantha_series(iterations: int) -> Decimal:
    pi = Decimal(3.0)
    for i in range(1, iterations + 1):
        pi += (1 if i % 2 == 1 else -1) * (
            Decimal(4) / ((2 * i) * (2 * i + 1) * (2 * i + 2))
        )
    return pi


main()
