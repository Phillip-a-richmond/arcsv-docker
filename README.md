# arcsv-docker
> A docker container for the arc-sv tool

## Notes
I had to fork the original repo from [https://github.com/SUwonglab/arcsv](https://github.com/SUwonglab/arcsv) over to [https://github.com/phillip-a-richmond/arcsv.git](https://github.com/phillip-a-richmond/arcsv.git) and modify it in order to successfully build.

Essentially what I ran into is that this was tested and run with python3.5, which isn't pip supported anymore. 

However, when bumping to python3.11, it failed due to pysam conflict. 

As pysam is hard-coded in the setup.py script, I had to modify this in my fork. 

Bumping to pysam v0.20.0 resovled this conflict, and it's functioning in docker (but some reason failing in singularity). 


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


