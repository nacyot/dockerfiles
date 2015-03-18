# docker-huboard

This is Dockerfile for building [Huboard](https://github.com/rauhryan/huboard) application image.

# Building Image

1. Clone this repository.

```sh
$ git clone https://github.com/nacyot/docker-huboard.git
$ cd docker-huboard
```

1. `mv .env.sample .env`
1. Input your `GITHUB_CLIENT_ID` and `GITHUB_SECRET` to `.env` file(You can
   get these strings from [Github Developer Applications page](https://github.com/settings/applications))
1. Build Dockerfile.

```sh
$ docker build -t nacyot/huboard .
```

# Starting Server

```
$ docker run -d -p <PUBLIC_PORT>:5000 nacyot/huboard
```

Replace `<PUBLIC_PORT>` with the number. You can access your huboard
application on `http://127.0.0.1:<PUBLIC_PORT>`

# Setting up Nginx Proxy

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

## Trouble Shooting

If 502 bad gateway error happen, add these settings to `nginx.conf`.

```nginx
http {
  proxy_buffers 8 16k;
  proxy_buffer_size 32k;
...
```

# Author
Daekwon Kim(nacyot) <propellerheaven@gmail.com>.

# License
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
