PROGRAM pi
  IMPLICIT NONE
  INTEGER, PARAMETER :: iterations = 10000
  INTEGER, PARAMETER :: iterations_for_avg = 100
  INTEGER iteration, beginning, end, rate
  DOUBLEPRECISION  :: pi_val, result
  REAL ::  avg_time_ns, elapsed_time
  CHARACTER(LEN=*), PARAMETER  :: HELLO_WORLD_FORMAT = "(A)"
  CHARACTER(LEN=*), PARAMETER  :: OUTPUT_LINE_1_FORMAT = "(A, F11.8)"
  CHARACTER(LEN=*), PARAMETER  :: OUTPUT_LINE_2_FORMAT = "(A, F23.5)"  
  CHARACTER(LEN=*), PARAMETER  :: OUTPUT_LINE_3_FORMAT = "(A, I29.1)"  


  WRITE(*,HELLO_WORLD_FORMAT) ("Hello World, From FORTRAN!")
  pi_val = calculate_pi_with_formula_derived_from_sin(iterations)
  CALL system_clock(beginning, rate)
  DO iteration = 0, iterations_for_avg
    result = calculate_pi_with_formula_derived_from_sin(iterations)
  END DO
  CALL system_clock(end)
  elapsed_time =  real(end - beginning) / real(rate)
  avg_time_ns = (elapsed_time/real(iterations_for_avg)) * 1000000000.0
  


  WRITE(*,OUTPUT_LINE_1_FORMAT) ("Value of pi calculated using sin identities: "), pi_val
  WRITE(*,OUTPUT_LINE_2_FORMAT) ("Average Time Taken (in nanoseconds): "), avg_time_ns
  WRITE(*,OUTPUT_LINE_3_FORMAT) ("Number of Iterations: "), iterations

  
CONTAINS 

FUNCTION calculate_pi_with_formula_derived_from_sin(iterations)
  INTEGER, INTENT(IN) :: iterations
  INTEGER :: n
  DOUBLEPRECISION :: calculate_pi_with_formula_derived_from_sin
  DOUBLEPRECISION :: sum = 0

  DO n = -iterations/2, iterations/2
    sum = sum + ((-1) ** n)/(n + 1.0/2.0)
  END DO
  calculate_pi_with_formula_derived_from_sin = sum
END FUNCTION calculate_pi_with_formula_derived_from_sin
END PROGRAM pi

