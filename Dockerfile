ARG JOB=start.kjb
ARG LOG_LEVEL=Basic

# Run application
FROM openjdk:11-jre-buster

ARG JOB
ENV JOB $JOB
ARG LOG_LEVEL
ENV LOG_LEVEL $LOG_LEVEL

WORKDIR /etl
COPY ./data-integration data-integration
RUN mkdir -p input
ENV INPUT /etl/input
RUN mkdir -p output
ENV OUTPUT /etl/output

RUN addgroup --system etl && adduser --system etl --ingroup etl
USER etl:etl

ENTRYPOINT ["sh", "-c", "/etl/data-integration/kitchen.sh -file:$INPUT/$JOB -level:$LOG_LEVEL -param:OUTPUT=$OUTPUT"]