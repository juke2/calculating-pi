import subprocess
from pathlib import Path
import sys

ROOT_DIRECTORY = Path(__file__).parent.resolve()
RUNNER_PATH = ROOT_DIRECTORY.joinpath("runner.ps1")
subprocess.run("poetry run python src/pi.py", stdout=sys.stdout, shell=True)
subprocess.run("java ./src/pi.java 100", stdout=sys.stdout, shell=True)
subprocess.run("lua src/pi.lua", stdout=sys.stdout, shell=True)
subprocess.run("ruby src/pi.rb", stdout=sys.stdout, shell=True)
subprocess.run("Rscript  src/pi.r", stdout=sys.stdout, shell=True)
subprocess.run("node src/pi.js", stdout=sys.stdout, shell=True)
subprocess.run("tsc src/pi.ts --outfile src/pi-ts.js", stdout=sys.stdout, shell=True)
subprocess.run("node src/pi-ts.js", stdout=sys.stdout, shell=True)
subprocess.run("julia src/pi.jl", stdout=sys.stdout, shell=True)
subprocess.run("perl src/pi.pl", stdout=sys.stdout, shell=True)
subprocess.run("octave src/pi.m", stdout=sys.stdout, shell=True)
subprocess.run("csc /out:src/pi-cs.exe src/pi.cs", stdout=sys.stdout, shell=True)
subprocess.run("./src/pi-cs.exe", stdout=sys.stdout, shell=True)
subprocess.run("g++ src/pi.cc -o ./src/pi-cpp.exe", stdout=sys.stdout, shell=True)
subprocess.run("./src/pi-cpp.exe", stdout=sys.stdout, shell=True)
subprocess.run("gcc src/pi.c -o ./src/pi-c.exe", stdout=sys.stdout, shell=True)
subprocess.run("./src/pi-c.exe", stdout=sys.stdout, shell=True)
subprocess.run("rustc src/pi.rs -o src/pi-rust.exe", stdout=sys.stdout, shell=True)
subprocess.run("./src/pi-rust.exe", stdout=sys.stdout, shell=True)
subprocess.run(
    "gfortran src/pi.f90 -o src/pi-fortran.exe", stdout=sys.stdout, shell=True
)
subprocess.run("./src/pi-fortran.exe", stdout=sys.stdout, shell=True)
