# arcsv-docker
A docker container for the arc-sv tool

## How it was built
1. Activate Docker app on mac
2. Run:
```
docker build -t philliparichmond/arcsv:20230222 /Users/prichmond/Desktop/DockerContainers/arcsv-docker
```
3. Push to DockerHub
```
docker push philliparichmond/arcsv:20230222
```

## How to use with Docker (working)
1. Docker run image
```
docker run docker.io/philliparichmond/arcsv:20230221 /opt/arcsv/bin/arcsv
```

Should output:
```
usage: arcsv [-h] {call,filter-merge} ...

positional arguments:
  {call,filter-merge}
    call               Call SVs from alignment data
    filter-merge       Filter and/or merge ARC-SV output

options:
  -h, --help           show this help message and exit
```


## How to use with singularity (not working)
1. Pull image
```
singularity pull  docker://philliparichmond/arcsv:20230221
```
This should produce a file like:
```
arcsv_20230221.sif 
```
2. Run image and call location of arcsv install
```
singularity exec arcsv_20230221.sif /opt/arcsv/bin/arcsv
```


