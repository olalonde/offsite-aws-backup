# Offsite AWS backup scripts

Offsite backups script for AWS RDS Postgresql and AWS s3.

Currently only supports one bucket and one database.

## Usage

## local / testing

```bash
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

## systemd (for starting at boot)

```bash
# Configure
cat > /etc/offsite-aws-backup <<EOF
PGHOST=some.domain.rds.amazonaws.com
PGUSER=yourpguser
PGPASSWORD=yourpgpassword
AWS_ACCESS_KEY_ID=aws-access-key-id
AWS_SECRET_ACCESS_KEY=aws-access-key-secret
DATABASE=database-to-backup
AWS_S3_BUCKET=bucket-to-backup
EOF

# Data directory where backups are stored
mkdir -p /home/ubuntu/data

# Build image
docker build -t offsite-aws-backup .

# Install systemd unit file
sudo cp offsite-aws-backup.service /lib/systemd/system/


# Enable auto start on boot
sudo systemctl enable offsite-aws-backup

# Start unit
sudo systemctl start offsite-aws-backup

# Tail logs
journalctl -f -u offsite-aws-backup
```
