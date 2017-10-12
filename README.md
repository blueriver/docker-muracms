# Mura CMS Dockerfiles

The [Docker](https://www.docker.com/) files in this repository may be used to create your own custom Docker container for running [Mura CMS](http://www.getmura.com/). For Docker images, visit the Docker repository at https://hub.docker.com/r/blueriver/docker-muracms/.

**NOTE:** The example files and Docker images are provided as learning tools only. They are *NOT* intended for production purposes. That said, you could easily use the information as a basis for creating your own custom Docker images for integration into your team's workflow.

# Official Mura CMS Image
The "**Official**" Mura CMS Docker Image, is maintained at https://hub.docker.com/r/blueriver/muracms/. An [example](https://github.com/blueriver/docker-muracms/tree/master/examples/blueriver-muracms) using this image is also included.

# Tags
* `blueriver/muracms:latest` ([Dockerfile](https://github.com/blueriver/MuraCMS/blob/7.1/core/docker/build/Dockerfile))
    * The **official** Blue River Mura CMS Docker image.
* `:7.1-commandbox-lucee5` ([Dockerfile](https://github.com/blueriver/docker-muracms/blob/master/image-build-files/commandbox-lucee5/Dockerfile))
    * Uses the [`:lucee5` CommandBox Docker image](https://hub.docker.com/r/ortussolutions/commandbox/) as the base image.
* `:7.1-commandbox-adobe2016` ([Dockerfile](https://github.com/blueriver/docker-muracms/blob/master/image-build-files/commandbox-adobe2016/Dockerfile))
    * Uses the [`:adobe2016` CommandBox Docker image](https://hub.docker.com/r/ortussolutions/commandbox/) as the base image.
* `:7.1-lucee5` ([Dockerfile](https://github.com/blueriver/docker-muracms/blob/master/image-build-files/lucee5/Dockerfile))
    * Uses the [`:lucee5` Lucee Docker image](https://hub.docker.com/r/lucee/lucee5) as the base image.

# Description
The Docker images and files included here are for developers to use as they consider options for integrating Docker & Mura CMS into their workflow. 

Primary thoughts to consider when implementing Docker and Mura CMS into your workflow include:

* Which CFML engine do you want to use? [Adoble ColdFusion](http://www.adobe.com/products/coldfusion-family.html)? Or [Lucee](http://lucee.org/)?
* Do you want to use one of the convenient [Commandbox](https://hub.docker.com/r/ortussolutions/commandbox/) images for your desired CFML engine, or roll your own?
* Which database engine do you wish to use? [MySQL](https://hub.docker.com/_/mysql/), [Postgres](https://hub.docker.com/_/postgres/), or [Microsoft SQL Server](https://hub.docker.com/r/microsoft/mssql-server-linux/)?
* Do you want to be able to modify Mura CMS core files, and only abstract the CFML engine? (*Rare*)
* Do you want to abstract Mura CMS core files, and simply have them included in the image itself? (*Common*)
* If abstracting Mura CMS core files, do you want to be able to modify `modules`, `plugins`, `sites`, and/or `themes`? (*Common*)

Once you have the answers to these questions, you will be able to better select the appropriate Docker image, and `docker-compose` files to use. That said, feel free to play around with all of the included examples.

# Usage & Examples
While some users visiting this repository may have a strong understanding of Docker, and how it works, there are likely others who are completely new to Docker, and don't know where to start. 

If you're completely new to Docker, the [Docker Documentation](https://docs.docker.com/) area is a tremendous resource. You will also find the [Udemy](https://www.udemy.com) course titled "[Docker Mastery: The Complete Toolset From a Docker Captain](https://www.udemy.com/docker-mastery/)" extremely helpful in getting you up to speed rather quickly.

*The following information assumes you have a copy of the [**docker-muracms** Github repository](https://github.com/blueriver/docker-muracms) on your local machine.*

## Building Your Own Images
* To build your own images, you may use one of the `Dockerfile` and `docker-compose.yml` files located under the [`image-build-files`](https://github.com/blueriver/docker-muracms/blob/master/image-build-files/) section.
* Modify the `Dockerfile` and/or `docker-compose.yml` file as desired, then build your image. (e.g., `$ docker-compose build --no-cache`)

## Examples
Examples are located under https://github.com/blueriver/docker-muracms/tree/master/examples. Each example contains a `docker-compose.yml` file. Using your terminal, you may `cd` into the desired example directory, and then issue the `$ docker-compose up` command. 

Unless you've modified any of the `docker-compose.yml` files, the information outlined below for each example should be correct. Feel free to inspect the `docker-compose.yml` files to confirm, and/or to modify as desired.

* [**blueriver-muracms-mysql**](https://github.com/blueriver/docker-muracms/tree/master/examples/blueriver-muracms-mysql)
    * Website: 
        * Image: ["Official" Mura CMS Docker Image (blueriver/muracms:latest)](https://hub.docker.com/r/blueriver/muracms/)
        * Domain: http://localhost:8001
            * Usr: `admin`
            * Pwd: `5trongP@55w0rd`
    * Database: 
        * Image: [MySQL (mysql:5.7.19)](https://hub.docker.com/_/mysql/)
        * Domain: http://localhost:5001
            * Usr: `root`
            * Pwd: `5trongP@55w0rd`
* [**commandbox-adobe2016-mssql**](https://github.com/blueriver/docker-muracms/tree/master/examples/commandbox-adobe2016-mssql)
    * Website: 
        * Image: [Custom image using CommandBox as base image (blueriver/docker-muracms:7.1-commandbox-adobe2016)](https://hub.docker.com/r/blueriver/docker-muracms/)
        * Domain: http://localhost:8002
            * Usr: `admin`
            * Pwd: `5trongP@55w0rd`
    * Database: 
        * Image: [Microsoft SQL Server (microsoft/mssql-server-linux:latest)](https://hub.docker.com/r/microsoft/mssql-server-linux/)
        * Domain: http://localhost:5002
            * Usr: `sa`
            * Pwd: `5trongP@55w0rd`
* [**commandbox-lucee5-mysql**](https://github.com/blueriver/docker-muracms/tree/master/examples/commandbox-lucee5-mysql)
    * Website: 
        * Image: [Custom image using CommanBox as base image (blueriver/docker-muracms:7.1-commandbox-lucee5)](https://hub.docker.com/r/blueriver/docker-muracms/)
        * Domain: http://localhost:8003
            * Usr: `admin`
            * Pwd: `5trongP@55w0rd`
    * Database: 
        * Image: [MySQL (mysql:5.7.19)](https://hub.docker.com/_/mysql/)
        * Domain: http://localhost:5003
            * Usr: `root`
            * Pwd: `5trongP@55w0rd`
* [**commandbox-lucee5-postgres**](https://github.com/blueriver/docker-muracms/tree/master/examples/commandbox-lucee5-postgres)
    * Website: 
        * Image: [Custom image using CommandBox as base image (blueriver/docker-muracms:7.1-commandbox-lucee5)](https://hub.docker.com/r/blueriver/docker-muracms/)
        * Domain: http://localhost:8004
            * Usr: `admin`
            * Pwd: `5trongP@55w0rd`
    * Database: 
        * Image: [PostgreSQL (postgres:9.6.5-alpine)](https://hub.docker.com/_/postgres/) 
        * Domain: http://localhost:5004
            * Usr: `muradb`
            * Pwd: `5trongP@55w0rd`
* [**lucee5-mysql**](https://github.com/blueriver/docker-muracms/tree/master/examples/lucee5-mysql)
    * Website: 
        * Image: [Custom image using Lucee as base image (blueriver/docker-muracms:7.1-lucee5)](https://hub.docker.com/r/blueriver/docker-muracms/)
        * Domain: http://localhost:8005
            * Usr: `admin`
            * Pwd: `5trongP@55w0rd`
    * Database: 
        * Image: [MySQL (mysql:5.7.19)](https://hub.docker.com/_/mysql/)
        * Domain: http://localhost:5005
            * Usr: `root`
            * Pwd: `5trongP@55w0rd`
* [**lucee5-mysql-nofiles**](https://github.com/blueriver/docker-muracms/tree/master/examples/lucee5-mysql-nofiles)
    * This example abstracts the Mura CMS core files, and also abstracts the `modules`, `plugins`,  `sites`, and `themes` directories. In other words, all changes are stored in the mounted `volumes`.
        * Website: 
            * Image: [Custom image using Lucee as base image (blueriver/docker-muracms:7.1-lucee5)](https://hub.docker.com/r/blueriver/docker-muracms/)
            * Domain: http://localhost:8005
                * Usr: `admin`
                * Pwd: `5trongP@55w0rd`
        * Database: 
            * Image: [MySQL (mysql:5.7.19)](https://hub.docker.com/_/mysql/)
            * Domain: http://localhost:5005
                * Usr: `root`
                * Pwd: `5trongP@55w0rd`

# Issues
Please submit issues to https://github.com/blueriver/docker-muracms/issues

# License
Apache License, Version 2.0