# performance-summary-collection
Use Robot framework to collect performance summary

Report
https://docs.google.com/spreadsheets/d/1ZBQvbFf-XwXcSfcFe7g5coys9hNsWMG7d1ja-UbdB2A/edit#gid=0
Test case
https://docs.google.com/spreadsheets/d/1ScN7urohtlbwL9ns-5rSxjRy5hIL3j3Jr4eyLeD000w/edit#gid=0

## Getting start

* Install docker
* Clone repo
    ```
    $ git clone git@github.com:IOTechSystems/performance-summary-collection.git
    ```
* Run 
    ```
    $ cd /path/to/performance-summary-collection
    $ docker run --rm --network host -v $PWD:$PWD -w $PWD -v /var/run/docker.sock:/var/run/docker.sock  \
        iotech-releases.jfrog.io/robotframework:1.0.0 -d report .
    
    ```

    in arm64
    ```
    $ cd /path/to/performance-summary-collection
    $ docker run --rm --network host -v $PWD:$PWD -w $PWD -v /var/run/docker.sock:/var/run/docker.sock  \
        iotech-releases.jfrog.io/robotframework-arm64:1.0.0 -d report .
    ```

## Develop

* docker

* sudo apt install python3-pip
* python3 -m pip install robotframework

* python lib
  * pip3 install docker
  * pip3 install pytz


### Run Robot

```
git clone git@github.com:IOTechSystems/performance-summary-collection.git
cd /path/to/performance-summary-collection
robot -d report .
```

### Run docker-compose in container

```
docker run --rm --env-file x86_64.env -v $PWD:$PWD -w $PWD -v /var/run/docker.sock:/var/run/docker.sock   \
    docker/compose:1.24.0 up -d
    
docker run --rm --env-file x86_64.env -v $PWD:$PWD -w $PWD -v /var/run/docker.sock:/var/run/docker.sock   \
    iotech-services.jfrog.io/compose_arm64:1.25.0-rc1 up -d
```


## Custom robotframework docker image
```
docker build -t iotech-releases.jfrog.io/robotframework:1.0.0 .
docker build -f Dockerfile.arm64 -t iotech-releases.jfrog.io/robotframework-arm64:1.0.0 .
```

6647808


