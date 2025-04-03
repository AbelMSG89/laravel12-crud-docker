# Docker Implementation for Laravel 12 CRUD Application

This project demonstrates how to containerize a Laravel 12 CRUD application using Docker with Ubuntu, Apache, MySQL, and PHP. It builds upon the excellent base project created by [Programming-Mindset](https://github.com/Programming-Mindset/laravel12-crud).

[![Docker Hub](https://img.shields.io/docker/pulls/abelmsg/laravel12-crud.svg)](https://hub.docker.com/r/abelmsg/laravel12-crud)

## Original Project Credits

The base Laravel CRUD application was created by Programming-Mindset. You can find the original repository [here](https://github.com/Programming-Mindset/laravel12-crud).

## What's Added

- Dockerfile for containerization
- Multi-service setup (Apache, MySQL, PHP)
- Environment configuration
- Apache virtual host configuration
- MySQL database initialization
- Automated service startup

## Prerequisites

- Docker installed on your system
- Git

## Quick Start with Docker Hub

You can pull the pre-built image directly from Docker Hub:

```bash
docker pull abelmsg/laravel12-crud:latest
```

Then run it:

```bash
docker run -p 80:80 abelmsg/laravel12-crud:latest
```

## Building Locally

1. Clone the repository:

   ```bash
   git clone https://github.com/AbelMSG89/laravel12-crud-docker.git
   cd laravel12-crud-docker
   ```

2. Build the Docker image:

    ```bash
    docker build -t laravel12-crud .
    ```

3. Run the container:

    ```bash
    docker run -p 80:80 laravel12-crud
    ```

## What's Inside

The Docker implementation includes:

- Ubuntu 24.10 as base image
- Apache web server
- MySQL database server
- PHP with required extensions
- Composer for dependency management
- Automated database initialization
- Proper file permissions setup

## Architecture

- Apache serves the application on port 80
- MySQL runs internally for database operations
- Laravel application stored in /var/www/html

## Original Project Screenshot

![Original Project Screenshot](https://raw.githubusercontent.com/Programming-Mindset/laravel12-crud/refs/heads/master/screenshot/laravel12-crud-app.png)

## Contributing

Feel free to submit issues and enhancement requests.

## Original Project Reference

For the base Laravel CRUD application details, please visit [Programming-Mindset's repository](https://github.com/Programming-Mindset/laravel12-crud).
