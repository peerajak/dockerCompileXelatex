# To study Docker

This is my first self compile docker files, and volume

## Compile proposal.txt without docker

```
xelatex -synctex=1 -interaction=nonstopmode -8bit -output-directory=log "Proposal.tex"
```

## Build image:

```
docker build -t myxelatex:proposalbook .
```

## Create a volume to be mount to /log
```
docker volume create xelatex_compiled_docker_volume
```

## Compile Xelatex for Proposal.pdf

```
docker run  -v xelatex_compiled_docker_volume:/log myxelatex:proposalbook
```

## See result of Compilation 

```
docker run --rm -i -v=xelatex_compiled_docker_volume:/log myxelatex:proposalbook ls -l log/
```

## Copy compiled file from volume

```
CID2=$(docker run -d -v=xelatex_compiled_docker_volume:/log myxelatex:proposalbook)
docker cp $CID2:/log .
```

