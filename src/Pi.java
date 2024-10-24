import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;

public class Pi {
    private final static int ITERATION_DEFAULT = 3;
    private final static int NUM_RUNS_FOR_AVERAGES = 50;
    private final static int MAXIMUM_PRECISION = 100;
    private final static String OUTPUT_DIR = "./src/output/java_out.txt";

    public static void main(String[] args) {
        System.out.println("Hello World, From Java!");
        BigDecimal iterative_pi = new BigDecimal(0);
        BigDecimal recursive_pi = new BigDecimal(0);
        long time_sum_iterative = 0;
        long time_sum_recursive = 0;
        int num_iterations = handle_num_iterations(args);
        for (int i = 0; i < NUM_RUNS_FOR_AVERAGES; i++) {
            long start_time_iterative = System.nanoTime();
            iterative_pi = gauss_legendre_iterative(num_iterations);
            long end_time_iterative = System.nanoTime();
            long start_time_recursive = System.nanoTime();
            recursive_pi = gauss_legendre_recursive(num_iterations);
            long end_time_recursive = System.nanoTime();
            long time_taken_iterative = end_time_iterative - start_time_iterative;
            long time_taken_recursive = end_time_recursive - start_time_recursive;
            time_sum_iterative += time_taken_iterative;
            time_sum_recursive += time_taken_recursive;
        }
        long avg_time_iterative = time_sum_iterative / NUM_RUNS_FOR_AVERAGES;
        long avg_time_recursive = time_sum_recursive / NUM_RUNS_FOR_AVERAGES;
        System.out.println(
                String.format(
                        "Value of pi calcualted iteratively with the Gauss-Legendre algorithm: %s.\nAverage Time of execution (in nanoseconds): %d.\nAverage Time of execution (in milliseconds): %d.\nNumber of Iterations: %d.",
                        iterative_pi.toPlainString(), avg_time_iterative, avg_time_iterative / 1000000,
                        num_iterations));
        System.out.println(
                String.format(
                        "Value of pi calcualted recursively with the Gauss-Legendre algorithm: %s.\nAverage Time of execution (in nanoseconds): %d.\nAverage Time of execution (in milliseconds): %d.\nNumber of Iterations: %d.",
                        recursive_pi.toPlainString(), avg_time_recursive, avg_time_recursive / 1000000,
                        num_iterations));
        output_to_text(iterative_pi, recursive_pi, avg_time_iterative, avg_time_recursive, num_iterations);
    }

    private static int handle_num_iterations(String[] args) {
        String raw_num_iterations = "";
        int num_iterations = ITERATION_DEFAULT;
        try {
            raw_num_iterations = args[0];
            try {
                num_iterations = Integer.parseInt(raw_num_iterations);
            } catch (NumberFormatException e) {
                System.out.println("Error on converting arg num_iterations. Using default value.");
            }
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Missing argument: num_iterations. Using default value.");
        }

        return num_iterations;
    }

    private static BigDecimal gauss_legendre_iterative(int num_iterations) {
        MathContext context = new MathContext(MAXIMUM_PRECISION, RoundingMode.HALF_UP);
        BigDecimal a = new BigDecimal(1, context);
        BigDecimal b = new BigDecimal(1, context).divide((new BigDecimal(2, context).sqrt(context)), context);
        BigDecimal t = new BigDecimal(0.25, context);
        BigDecimal p = new BigDecimal(1, context);
        for (int i = 0; i < num_iterations; i++) {
            BigDecimal old_a = a;
            a = (a.add(b, context)).divide(new BigDecimal(2, context));
            b = (old_a.multiply(b, context)).sqrt(context);
            t = t.subtract(p.multiply(old_a.subtract(a, context).pow(2, context)), context);
            p = new BigDecimal(2, context).multiply(p, context);
        }
        return (a.add(b, context).pow(2, context)).divide(new BigDecimal(4, context).multiply(t, context), context);
    }

    private static BigDecimal gauss_legendre_recursive(int num_iterations) {
        MathContext context = new MathContext(MAXIMUM_PRECISION, RoundingMode.HALF_UP);
        BigDecimal a = new BigDecimal(1, context);
        BigDecimal b = new BigDecimal(1, context).divide((new BigDecimal(2, context).sqrt(context)), context);
        BigDecimal t = new BigDecimal(0.25, context);
        BigDecimal p = new BigDecimal(1, context);
        return gauss_legendre_recursive_helper(a, b, t, p, num_iterations, context);
    }

    private static BigDecimal gauss_legendre_recursive_helper(
            BigDecimal a,
            BigDecimal b,
            BigDecimal t,
            BigDecimal p,
            int num_iterations,
            MathContext math_context) {
        if (num_iterations == 0) {
            return (a.add(b, math_context).pow(2, math_context))
                    .divide(new BigDecimal(4, math_context).multiply(t, math_context), math_context);
        }
        BigDecimal old_a = a;
        a = (a.add(b, math_context)).divide(new BigDecimal(2, math_context));
        b = (old_a.multiply(b, math_context)).sqrt(math_context);
        t = t.subtract(p.multiply(old_a.subtract(a, math_context).pow(2, math_context)), math_context);
        p = new BigDecimal(2, math_context).multiply(p, math_context);
        return gauss_legendre_recursive_helper(a, b, t, p, num_iterations - 1, math_context);
    }

    private static void output_to_text(BigDecimal iterative_pi, BigDecimal recursive_pi, long avg_time_iterative,
            long avg_time_recursive, int num_iterations) {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(OUTPUT_DIR));
            writer.write("iterative_pi : " + iterative_pi.toPlainString() + "\n");
            writer.write("recursive_pi : " + recursive_pi.toPlainString() + "\n");
            writer.write("avg_time_iterative : " + avg_time_iterative + "\n");
            writer.write("avg_time_recursive : " + avg_time_recursive + "\n");
            writer.write("num_iterations : " + num_iterations + "\n");
            writer.close();
        } catch (IOException e) {
            System.out.println("Writing to file failed. See stack trace for more detail.");
            e.printStackTrace();
        }
    }
}