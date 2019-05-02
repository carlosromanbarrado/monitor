FROM jboss/base-jdk:11
EXPOSE 8080 8888
ARG DT_API_URL="https://abg31868.live.dynatrace.com/api"
ARG DT_API_TOKEN="kp53qp9zQuqko3mzvZ4lg"
ARG DT_ONEAGENT_OPTIONS="flavor=default&include=java"
ENV DT_HOME="/opt/dynatrace/oneagent"
RUN mkdir -p "$DT_HOME" && \
    wget -O "$DT_HOME/oneagent.zip" "$DT_API_URL/v1/deployment/installer/agent/unix/paas/latest?Api-Token=$DT_API_TOKEN&$DT_ONEAGENT_OPTIONS" && \
    unzip -d "$DT_HOME" "$DT_HOME/oneagent.zip" && \
    rm "$DT_HOME/oneagent.zip"
ENTRYPOINT [ "/opt/dynatrace/oneagent/dynatrace-agent64.sh" ]
CMD [ "executable", "param1", "param2" ] # the command of your application, e.g. java
