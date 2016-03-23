.PHONY: image install

all: build install

build:
	docker build -t offsite-aws-backup .

install:
	cp offsite-aws-backup.service /lib/systemd/system/
	# Enable auto start on boot
	sudo systemctl enable offsite-aws-backup
	# Start unit
	sudo systemctl start offsite-aws-backup
