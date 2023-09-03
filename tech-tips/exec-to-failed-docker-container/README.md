# How to exec to a stopped or failed docker container

Sometimes it can be useful to exec into a container once it has failed. By default, the `docker exec` command does not work. But if you run the following command, you should be able to get access to the failed container. This can be extremely useful for troubleshooting.

The command is below, all you should need to do is replace `<container-id>` with the id of your broken container:

`docker commit <container-id> my-broken-container && docker run -it my-broken-container sh`