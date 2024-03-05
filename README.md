# Network Monitoring Scripts

This repository contains scripts for monitoring network performance and logging results to CSV files.

## Scripts

### speedtest_logging.sh

Runs a speedtest using `speedtest-cli` and logs results to a CSV file.

### ping_logging.sh  

Pings a specified host a number of times and logs response times to a CSV file.

## Usage

The scripts will log to default CSV files:

- `/home/$USER/net_speed/net_speed_log/net_log.csv` 
- `/home/$USER/net_speed/net_speed_log/ping_log.csv`

To run the scripts:

```
./speedtest_logging.sh 
./ping_logging.sh
```

This will run the tests and append results to the log files.

## Customization

The scripts contain configurable variables to control the test behavior and logging:

- `log_file` - Path to log file  
- `ping_count` - Number of pings to perform
- `interval` - Interval between pings
- `speedtest_options` - CLI options for speedtest

## Cron Jobs

To run the scripts on a schedule, cron jobs can be added like:

Speedtest every hour
0 * * * * /path/to/speedtest_logging.sh

Ping every 5 minutes
*/5 * * * * /path/to/ping_logging.sh

## Requirements

- `speedtest-cli` for speedtest script
- Standard Linux ping utility
- `awk` for parsing output

## Logging

The CSV log files can be imported into spreadsheets for graphing and analysis.
