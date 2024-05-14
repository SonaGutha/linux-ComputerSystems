#!/bin/bash
# the log file contains the output of the benchmark log
log="disk-benchmark-background-log.txt"
diskbenchmark() {
# Capturing process begin time
begin=$(date + %s)
# this runs the benchmark process for atlease 10 seconds and captures the log
nohup bash -c "{ time timeout 10s dd if=/dev/zero of=/dev/null bs=1M count=100000 &>> "$log"; }"
# captures the process end time
end=$(date +%s)
# calculate the time taken to run the benchmark and capture log
time_taken=$((end - begin))
echo "Background Benchmark is running"
echo "Benchmark ran for atleast $time_taken seconds"
}
# execute diskbenchmark
diskbenchmark
