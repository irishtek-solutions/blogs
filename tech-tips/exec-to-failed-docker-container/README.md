# How to exec to a stopped or failed docker container

Sometimes it can be useful to exec into a container once it has failed. By default, the `docker exec` command does not work. But if you run the following command, you should be able to get access to the failed container. This can be extremely useful for troubleshooting.

The command is below, all you should need to do is replace `<container-id>` with the id of your broken container:

`docker commit <container-id> my-broken-container && docker run -it my-broken-container sh`

## Example of this working

In this example we can check in a stopped container to see why our hmtl template is showing

1. Run `docker-compose up`
2. Go to `http://localhost:8080/` in a browser
3. You'll notice that we get a `403 Forbidden` nginx error
4. Stop the container by pressing `CTRL` + `C`
5. Run docker container ls -a
6. You should now see the container has `Exited`

```
$ docker container ls -a
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS                      PORTS     NAMES
ccf17b0515dd   nginx:latest   "/docker-entrypoint.…"   2 minutes ago   Exited (0) 17 seconds ago             exec-to-failed-docker-container-web-1
68e395e29af9   php:7-fpm      "docker-php-entrypoi…"   5 days ago      Exited (0) 17 seconds ago             exec-to-failed-docker-container-php-1
```

7. If you try to just run `docker container exec -it <container-id> sh`, you'll get an error like this

```
Error response from daemon: Container ccf17b0515dd2d0dea071658ea897b0af6d9d199bd0324ab2a026ada53727843 is not running
```

8. Run `docker commit <container-id> my-broken-container && docker run -it my-broken-container sh` and you should get exec access to the container
9. Change to the directory (`/usr/share/nginx/html`) and inspect the `index.html` file. You'll see its the wrong one.
