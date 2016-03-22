# Offsite AWS backup scripts

Offsite backups script for AWS RDS Postgresql and AWS s3.

Currently only supports one bucket and one database.

## Usage

```
export PGHOST=some.domain.rds.amazonaws.com
export PGUSER=yourpguser
export PGPASSWORD=yourpgpassword
export AWS_ACCESS_KEY_ID=aws-access-key-id
export AWS_SECRET_ACCESS_KEY=aws-access-key-secret

export DATABASE=database-to-backup
export AWS_S3_BUCKET=bucket-to-backup

# runs backup daily and archives daily, weekly and monthly
docker-compose up cron

# for one off backup tasks
# docker-compose up backup_postgres
# docker-compose up backup_s3
```
