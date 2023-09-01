# Getting started with Portainer


[Watch the video instead](#Watch-the-video-instead) \
[Pre-requisites](#Pre-requisites) \
[How to install Portainer and deploy a new container](#How-to-install-Portainer-and-deploy-a-new-container) \
[What we learned](#What-we-learned)

## CLICK - Watch the video instead 

[![IMAGE ALT TEXT](./images/portainer.png)](http://www.youtube.com/watch?v=YOUTUBE_VIDEO_ID_HERE "Video Title")

## Pre-requisites

1. Docker and Docker Compose is installed
2. Access to terminal

## How to install Portainer and deploy a new container

1. In this directory, run `docker-compose -f portainer.yaml up`
2. Go to your browser (Chrome, Edge, Safari etc..) and type `https://localhost:9443` in the browser

> **_NOTE:_**  You may have to accept the self signed certificate. 

3. Once you accept you should see the following page.

![Setting up the admin page](./images/admin-setup.png)

4. Next, specify and confirm your password. Make sure it's at least 12 characters long.
5. You should then be greeted by the following page, select `Get Started`

![Getting started](./images/get-started-select.png)

6. From the home page, you can select which environment you want to use, and on the left-hand side you can select and inspect different components such as containers, images, networks, volumes, events.
7. Select `Containers` from the left-hand side menu. Right now we see one. Like below:

![Container list](./images/container-list.png)

8. Let's setup a new container using the UI.

> **_NOTE:_**  You could also run it from the command line or docker compose. As an example you could run `docker run --name docker-nginx -p 8080:8080 nginx`.

You will need to enter the following as outlined in the attached image:

- `Name`: docker-nginx
- `Image`: nginx
- `Port mappings`: 8080 to 80

![Container list](./images/add-container.png)

9. Once you are happy, select `Deploy the Container`. This will run the new container with the configuration options we have specified.

![Container list](./images/new-container.png)

10. Once the state is `Running`, open up a new tab in your browser. Go to `http:localhost:8080` . We should now see nginx is running.

![Nginx](./images/nginx.png)

## What we learned

1. We learned to deploy Portainer using Docker
2. Set Portainer up for our administrator
3. Reviewed the UI and what containers were deployed
4. Deployed a new container using the UI (nginx)
5. Verify Nginx is working