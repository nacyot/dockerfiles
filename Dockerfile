FROM dockerfile/nodejs

RUN npm install -g hubot coffee-script redis
RUN cd /root && \
      hubot --create slack && \
      cd slack && \
      npm install hubot-slack hubot-simple-logger --save && \
      npm install && \
      echo '["hubot-simple-logger"]' > external-scripts.json

ENV REDISTOGO_URL redis://172.17.42.1:6379/hubot
ENV PORT 8080
ENV HUBOT_LOGS_PORT 8086
ENV HUBOT_LOGS_FOLDER /data/logs
ENV TZ Asia/Seoul

EXPOSE 8080
EXPOSE 8086

WORKDIR /root/slack
ENTRYPOINT ["/root/slack/bin/hubot"]
CMD ["--adapter", "slack"]
