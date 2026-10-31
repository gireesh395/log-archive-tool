# Log Archive Tool

A lightweight CLI tool written in Bash to compress and archive log directories with timestamps and audit history.

Project page: https://roadmap.sh/projects/log-archive-tool

## Features
- Validates CLI input and target directory existence.
- Compresses directories into `.tar.gz` format named `logs_archive_<YYYYMMDD_HHMMSS>.tar.gz`.
- Records every archival event with timestamps in `archive_history.log`.

## Usage
Make the script executable:
```bash
chmod +x log-archive.sh