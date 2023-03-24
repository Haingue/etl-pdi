# Pentaho Data integration
Thanks to this project, you can execute PDI job/transformation in a container.
You can find the docker image on [docker Hub](https://hub.docker.com/r/haingue/etl-pdi)

<br/>

## Container folders
  - data-integration: folder with Pentaho Data Integration
  - /etc/input: folder with your jobs and transformations 
  - /etc/output: folder for the etl outputs

## Requirements
- Your main job must be called "start.kjb"
- If you need to import files, you must create variables in your main job called "INPUT"
- If you need to export files, you must create variables in your main job called "OUTPUT"

<br/>


## Quick start
### Docker compose
```yaml
version: '3.7'
services:
    etl:
        container_name: pentaho-etl
        image: haingue/etl-pdi:latest
        environment:
            - JOB=start.kjb
            - LOG_LEVEL=Basic
        volumes:
          - {YOUR JOB FOLDER}:/etl/input
          - {YOUR OUTPUT FOLDER}:/etl/output
```
