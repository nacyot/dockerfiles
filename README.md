# docker-huboard

This is Dockerfile for building [Huboard](https://github.com/rauhryan/huboard) application image.

## Build

1. Clone this repository.

```sh
$ git clone docker-huboard
$ cd docker-huboard
```

1. `mv .env.sample .env`
1. Input your `GITHUB_CLIENT_ID` and `GITHUB_SECRET` to `.env` file(You can
   get these strings from [Github Developer Applications page](https://github.com/settings/applications))
1. Build Dockerfile.

```sh
$ docker build -t nacyot/huboard .
```

## Starting Server

```
$ docker run -d -p <PUBLIC_PORT>:5000 nacyot/huboard
```

Replace `<PUBLIC_PORT>` with the number. You can access your huboard
application on `http://127.0.0.1:<PUBLIC_PORT>`

## nginx proxy setting
```nginx
upstream huboard_server {
  server 127.0.0.1:<PUBILC_PORT>;
}

server {
  server_name <YOUR_DOMAIN>;

  location / {
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_redirect off;
    proxy_pass http://huboard_server;
  }
}
```

If 502 bad gateway error happen, add these settings to `nginx.conf`.

```nginx
http {
  proxy_buffers 8 16k;
  proxy_buffer_size 32k;
...
```
