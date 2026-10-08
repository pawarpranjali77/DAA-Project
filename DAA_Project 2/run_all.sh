#!/bin/sh
# Regenerates every result from the SAME dataset files, in order.
# Run from the project root on the machine you want to report numbers for
# (use a machine with >= 8 cores so the 8-thread rows are meaningful).
set -e
mkdir -p bin
javac -d bin src/*.java
java -cp bin RealDatasetProcessor      # datasets/ from ecoli.fasta
java -cp bin CorrectnessTester         # results/correctness.csv
java -cp bin PerformanceBenchmark      # results/performance.csv + benchmark_environment.txt
java -cp bin PerformanceAnalysis       # results/performance_summary.csv
python performance.py                  # results/graphs/*.png
cat results/benchmark_environment.txt
