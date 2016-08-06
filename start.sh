docker build -t carrier .
mkdir /mnt/carrier;
mkdir /depot;
docker run --privileged  -v /lib/modules/3.10.0-123.4.4.el7.x86_64/:/lib/modules/3.10.0-123.4.4.el7.x86_64/ -v /depot:/depot -v /mnt/carrier/:/var/lib/docker/ -d carrier
