# Official Mura Image

Unless you have a special need we recommend that you start with the "**Official**" Mura Docker Image.

The "**Official**" Mura Docker Image, is maintained at https://hub.docker.com/r/blueriver/mura/. An [example](https://github.com/blueriver/docker-muracms/tree/master/examples/blueriver-muracms-mysql) using this image is also included.

A useful example of using the "**Official**" Docker Image for **theme development** can be found at https://github.com/blueriver/MuraBootstrap4.

# Mura Dockerfiles

The [Docker](https://www.docker.com/) files in this repository may be used to create your own custom Docker container for running [Mura](http://www.getmura.com/). For Docker images, visit the Docker repository at https://hub.docker.com/r/blueriver/docker-muracms/.

**NOTE:** The example files and Docker images are provided as learning tools only. They are *NOT* intended for production purposes. That said, you could easily use the information as a basis for creating your own custom Docker images for integration into your team's workflow.

# Tags
* `blueriver/mura:latest` ([Dockerfile](https://github.com/blueriver/MuraCMS/blob/7.1/core/docker/build/Dockerfile))
    * The "**Official**" Blue River Mura Docker image.
* `:7.1-commandbox-lucee5` ([Dockerfile](https://github.com/blueriver/docker-muracms/blob/master/examples/commandbox-lucee5-mysql/Dockerfile))
    * Uses the [`:lucee5` CommandBox Docker image](https://hub.docker.com/r/ortussolutions/commandbox/) as the base image.
* `:7.1-commandbox-adobe2016` ([Dockerfile](https://github.com/blueriver/docker-muracms/blob/master/examples/commandbox-adobe2016-mssql/Dockerfile))
    * Uses the [`:adobe2016` CommandBox Docker image](https://hub.docker.com/r/ortussolutions/commandbox/) as the base image.
* `:7.1-lucee5` ([Dockerfile](https://github.com/blueriver/docker-muracms/blob/master/examples/lucee5-mysql/Dockerfile))
    * Uses the [`:lucee5` Lucee Docker image](https://hub.docker.com/r/lucee/lucee5) as the base image.

# Description
The Docker images and files included here are for developers to use as they consider options for integrating Docker & Mura into their workflow. 

Primary thoughts to consider when implementing Docker and Mura into your workflow include:

* Which CFML engine do you want to use? [Adoble ColdFusion](http://www.adobe.com/products/coldfusion-family.html)? Or [Lucee](http://lucee.org/)?
* Do you want to use one of the convenient [Commandbox](https://hub.docker.com/r/ortussolutions/commandbox/) images for your desired CFML engine, or roll your own?
* Which database engine do you wish to use? [MySQL](https://hub.docker.com/_/mysql/), [Postgres](https://hub.docker.com/_/postgres/), or [Microsoft SQL Server](https://hub.docker.com/r/microsoft/mssql-server-linux/)?
* Do you want to be able to modify Mura core files, and only abstract the CFML engine? (*Rare*)
* Do you want to abstract Mura core files, and simply have them included in the image itself? (*Common*)
* If abstracting Mura core files, do you want to be able to modify `modules`, `plugins`, `sites`, and/or `themes`? (*Common*)

Once you have the answers to these questions, you will be able to better select the appropriate Docker image, and `docker-compose` files to use. That said, feel free to play around with all of the included examples.

# Usage & Examples
While some users visiting this repository may have a strong understanding of Docker, and how it works, there are likely others who are completely new to Docker, and don't know where to start. 

If you're completely new to Docker, the [Docker Documentation](https://docs.docker.com/) area is a tremendous resource. You will also find the [Udemy](https://www.udemy.com) course titled "[Docker Mastery: The Complete Toolset From a Docker Captain](https://www.udemy.com/docker-mastery/)" extremely helpful in getting you up to speed rather quickly.

*The following information assumes you have a copy of the [**docker-muracms** Github repository](https://github.com/blueriver/docker-muracms) on your local machine.*

## Building Your Own Images
* To build your own images, you may use one of the `Dockerfile` and/or `docker-compose.yml` files located under any of the examples.
* Modify the `Dockerfile` and/or `docker-compose.yml` file as desired, then build your image. (e.g., `$ docker-compose build --no-cache`)

## Examples
Examples are located under https://github.com/blueriver/docker-muracms/tree/master/examples. Each example contains a `docker-compose.yml` file. Using your terminal, you may `cd` into the desired example directory, and then issue the `$ docker-compose up` command. 

Unless you've modified any of the `docker-compose.yml` files, the information outlined below for each example should be correct. Feel free to inspect the `docker-compose.yml` files to confirm, and/or to modify as desired.

### [**blueriver-muracms-mysql**](https://github.com/blueriver/docker-muracms/tree/master/examples/blueriver-muracms-mysql)

This example uses the "Official" Mura Docker image as the base image. It abstracts the Mura core files, and includes host directories under the `www` directory for editing `modules`, `plugins`, `sites`, and `themes`. The MySQL database image is added in the [`docker-compose.yml`](https://github.com/blueriver/docker-muracms/blob/master/examples/blueriver-muracms-mysql/docker-compose.yml) file. To run this example "as-is", you should be able to simply run `$ docker-compose up` from within the `examples/blueriver-muracms-mysql` directory.

* Website: 
    * Image: ["Official" Mura Docker Image (blueriver/mura:latest)](https://hub.docker.com/r/blueriver/mura/)
    * Domain: http://localhost:8001
        * Usr: `admin`
        * Pwd: `5trongP@55w0rd`
* Database: 
    * Image: [MySQL (mysql:5.7.19)](https://hub.docker.com/_/mysql/)
    * Domain: http://localhost:5001
        * Usr: `root`
        * Pwd: `5trongP@55w0rd`

### [**commandbox-adobe2016-mssql**](https://github.com/blueriver/docker-muracms/tree/master/examples/commandbox-adobe2016-mssql)

This example uses the CommandBox Adobe2016 image as the base image. It abstracts the Mura core files, and includes host directories under the `www` directory for editing `modules`, `plugins`, `sites`, and `themes`. The Microsoft SQL Server database image is added in the [`docker-compose.yml`](https://github.com/blueriver/docker-muracms/blob/master/examples/commandbox-adobe2016-mssql/docker-compose.yml) file. To run this example "as-is", you should be able to simply run `$ docker-compose up` from within the `examples/commandbox-adobe2016-mssql` directory.

To build a new image (to get the latest updates) and then run it, use `$ docker-compose build --no-cache && docker-compose up`. Your site should be available, after the scripts have finished running.

* Website: 
    * Image: [blueriver/docker-muracms:7.1-commandbox-adobe2016](https://hub.docker.com/r/blueriver/docker-muracms/)
    * Domain: http://localhost:8002
        * Usr: `admin`
        * Pwd: `5trongP@55w0rd`
* Database: 
    * Image: [Microsoft SQL Server (microsoft/mssql-server-linux:latest)](https://hub.docker.com/r/microsoft/mssql-server-linux/)
    * Domain: http://localhost:5002
        * Usr: `sa`
        * Pwd: `5trongP@55w0rd`

### [**commandbox-lucee5-mysql**](https://github.com/blueriver/docker-muracms/tree/master/examples/commandbox-lucee5-mysql)

This example uses the CommandBox Lucee5 image as the base image. It abstracts the Mura core files, and includes host directories under the `www` directory for editing `modules`, `plugins`, `sites`, and `themes`. The MySQL database image is added in the [`docker-compose.yml`](https://github.com/blueriver/docker-muracms/blob/master/examples/commandbox-lucee5-mysql/docker-compose.yml) file. To run this example "as-is", you should be able to simply run `$ docker-compose up` from within the `examples/commandbox-lucee5-mysql` directory.

To build a new image (to get the latest updates) and then run it, use `$ docker-compose build --no-cache && docker-compose up`. Your site should be available, after the scripts have finished running.

* Website: 
    * Image: [blueriver/docker-muracms:7.1-commandbox-lucee5](https://hub.docker.com/r/blueriver/docker-muracms/)
    * Domain: http://localhost:8003
        * Usr: `admin`
        * Pwd: `5trongP@55w0rd`
* Database: 
    * Image: [MySQL (mysql:5.7.19)](https://hub.docker.com/_/mysql/)
    * Domain: http://localhost:5003
        * Usr: `root`
        * Pwd: `5trongP@55w0rd`

### [**commandbox-lucee5-postgres**](https://github.com/blueriver/docker-muracms/tree/master/examples/commandbox-lucee5-postgres)

This example also uses the CommandBox Lucee5 image as the base image. It abstracts the Mura core files, and includes host directories under the `www` directory for editing `modules`, `plugins`, `sites`, and `themes`. The Postgres database image is added in the [`docker-compose.yml`](https://github.com/blueriver/docker-muracms/blob/master/examples/commandbox-lucee5-postgres/docker-compose.yml) file. To run this example "as-is", you should be able to simply run `$ docker-compose up` from within the `examples/commandbox-lucee5-postgres` directory.

To build a new image (to get the latest updates) and then run it, use `$ docker-compose build --no-cache && docker-compose up`. Your site should be available, after the scripts have finished running.

* Website: 
    * Image: [blueriver/docker-muracms:7.1-commandbox-lucee5](https://hub.docker.com/r/blueriver/docker-muracms/)
    * Domain: http://localhost:8004
        * Usr: `admin`
        * Pwd: `5trongP@55w0rd`
* Database: 
    * Image: [Postgres (postgres:9.6.5-alpine)](https://hub.docker.com/_/postgres/) 
    * Domain: http://localhost:5004
        * Usr: `muradb`
        * Pwd: `5trongP@55w0rd`

### [**lucee5-mysql**](https://github.com/blueriver/docker-muracms/tree/master/examples/lucee5-mysql)

This example uses the Lucee Lucee5 image as the base image. It abstracts the Mura core files, and includes host directories under the `www` directory for editing `modules`, `plugins`, `sites`, and `themes`. The MySQL database image is added in the [`docker-compose.yml`](https://github.com/blueriver/docker-muracms/blob/master/examples/lucee5-mysql/docker-compose.yml) file. To run this example "as-is", you should be able to simply run `$ docker-compose up` from within the `examples/lucee5-mysql` directory.

To build a new image (to get the latest updates) and then run it, use `$ docker-compose build --no-cache && docker-compose up`. Your site should be available, after the scripts have finished running.

* Website: 
    * Image: [blueriver/docker-muracms:7.1-lucee5](https://hub.docker.com/r/blueriver/docker-muracms/)
    * Domain: http://localhost:8005
        * Usr: `admin`
        * Pwd: `5trongP@55w0rd`
* Database: 
    * Image: [MySQL (mysql:5.7.19)](https://hub.docker.com/_/mysql/)
    * Domain: http://localhost:5005
        * Usr: `root`
        * Pwd: `5trongP@55w0rd`

### [**lucee5-mysql-nofiles**](https://github.com/blueriver/docker-muracms/tree/master/examples/lucee5-mysql-nofiles)

This example uses the Lucee Lucee5 image as the base image. It abstracts the Mura core files, and *also abstracts* the `modules`, `plugins`,  `sites`, and `themes` directories. In other words, all changes are stored in the mounted `volumes`.  The MySQL database image is added in the [`docker-compose.yml`](https://github.com/blueriver/docker-muracms/blob/master/examples/lucee5-mysql-nofiles/docker-compose.yml) file. To run this example "as-is", you should be able to simply run `$ docker-compose up` from within the `examples/lucee5-mysql-nofiles` directory. To view the volumes created, you can always run `$ docker image ls`.

To build a new image (to get the latest updates) and then run it, use `$ docker-compose build --no-cache && docker-compose up`. Your site should be available, after the scripts have finished running.

* Website: 
    * Image: [blueriver/docker-muracms:7.1-lucee5](https://hub.docker.com/r/blueriver/docker-muracms/)
    * Domain: http://localhost:8005
        * Usr: `admin`
        * Pwd: `5trongP@55w0rd`
* Database: 
    * Image: [MySQL (mysql:5.7.19)](https://hub.docker.com/_/mysql/)
    * Domain: http://localhost:5005
        * Usr: `root`
        * Pwd: `5trongP@55w0rd`

# Sample `docker-compose.yml` For Mura
The example below uses the "Official" Mura image, along with MySQL.
Running `$ docker-compose up` with the file below would be accessible via `http://localhost:8888`.

```
version: '3.3'

services:

  mura:
    image: blueriver/mura:latest
    depends_on:
      - svc_muradb
    environment:
      MURA_ADMIN_USERNAME: admin
      MURA_ADMIN_PASSWORD: 5trongP@55w0rd
      MURA_ADMINEMAIL: youremail@domain.com
      MURA_APPRELOADKEY: appreload
      MURA_DATASOURCE: dsn_mura
      MURA_DATABASE: muradb
      MURA_DBTYPE: mysql
      MURA_DBUSERNAME: root
      MURA_DBPASSWORD: 5trongP@55w0rd 
      MURA_DBHOST: svc_muradb
      MURA_DBPORT: 3306
      MURA_SITEIDINURLS: "false"
      MURA_INDEXFILEINURLS: "true"
      MURA_TESTBOX: "true"
      MURA_USESSL: "false"
    volumes:
      - vol_mura_modules:/var/www/modules
      - vol_mura_plugins:/var/www/plugins
      - vol_mura_sites:/var/www/sites
      - vol_mura_themes:/var/www/themes
    ports:
      - "8888:8888"

  # DB
  svc_muradb:
    image: mysql:5.7.19
    environment:
      MYSQL_DATABASE: muradb
      MYSQL_ROOT_PASSWORD: 5trongP@55w0rd
    volumes:
      - vol_muradb:/var/lib/mysql
    ports:
      - "5555:3306"

# Mounts
volumes:
  vol_muradb:
  vol_mura_modules:
  vol_mura_plugins:
  vol_mura_sites:
  vol_mura_themes:
```

# Issues
Please submit issues to https://github.com/blueriver/docker-muracms/issues.

# License
Apache License, Version 2.0
