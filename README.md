# hubot-simple-logger Dockerfile

Dockerfile for hubot-simple-logger.

The image based on this Dockerfile has [hubot][hubot] and [hubot-simple-logger][logger].

[hubot]: https://github.com/github/hubot
[logger]: https://github.com/anarcher/hubot-simple-logger/

# Running Image with slack adapter

```
# Run redis image
$ docker run -d --name redis -p 6379:6379 dockerfile/redis

# Run volume container for data prsistence
$ docker run --name logger-storage -v /data busybox

# Run main image
$ docker run -d \
    -p 8080:8080 \
    -p 8086:8086 \
    -e HUBOT_SLACK_TOKEN=<SLACK_TOKEN> \
    -e HUBOT_SLACK_TEAM=<SLACK_TEAM_NAME> \
    -e HUBOT_SLACK_BOTNAME=<BOTNAME_ON_SLACK> \
    --volumes-from logger-storage \
    nacyot/hubot-simple-logger \
```

You can get these values from [Slack][slack] integration page(like https://<TEAM_NAME>.slack.com/services/new).

[slack]: http://slack.com

## Environment Variables

You can overwrite below environment variables. Right side is default value.

```
REDISTOGO_URL=redis://172.17.42.1:6379/hubot # Redis Server URL
PORT=8080                                    # Hubot Port
HUBOT_LOGS_PORT=8086                         # Logger web server Port
HUBOT_LOGS_FOLDER=/data/logs                 # Directory for Log Data
TZ=Asia/Seoul                                # Timezone
```

# Backup

```
$ docker run --volumes-from logger-storage:ro \
    -v $(pwd):/backup \
    ubuntu:14.04 \
    tar cvf /backup/data.tar /data
$ ls
data.tar
```

# Screenshot

Slack room.

![Slack chat room](http://i.imgur.com/JdXxc6s.png)

This is logger web page(default port 8086).

![hubot simple logger web page](http://i.imgur.com/R4C83jf.png)

