
# PHP 8.1 Laravel Worker Docker Container with GeePlatform

This repository contains a Docker setup for running a Laravel queue worker using PHP 8.1 with common extensions. The container uses Supervisor to manage the queue worker process.

## Features

- PHP 8.1
- Common PHP extensions (`pdo_mysql`, `zip`, `bcmath`, `gd`)
- Composer installed
- Supervisor installed and configured to run Laravel queue worker

## Prerequisites

- Docker

## Getting Started

### 1. Clone the Repository

First, clone this repository to your local machine:

```sh
git clone https://github.com/WebGeeSolutions/gplatform-supervisor
cd your-repo
```

### 2. Dockerfile

The `Dockerfile` in this repository sets up a PHP 8.1 environment with the necessary extensions and Composer, and configures Supervisor to run the Laravel queue worker.

### 3. Supervisor Configuration

The `supervisord.conf` file in this repository configures Supervisor to manage the Laravel queue worker. Ensure it is in the same directory as your `Dockerfile`.

### 4. Building the Docker Image

Run the following command to build the Docker image:

```sh
docker build -t php8.1-laravel-worker .
```

This command will create a Docker image named `php8.1-laravel-worker` based on the instructions in the `Dockerfile`.

### 5. Running the Docker Container

Use the following command to run the Docker container. Replace the `/var/www/792917b7-a3e9-4158-8769-6c025db488b3` with the path to your Laravel project:

```sh
docker run -d \
  -v /var/www/792917b7-a3e9-4158-8769-6c025db488b3:/var/www/app \
  -e APP_ENV=production \
  --name laravel-worker \
  php8.1-laravel-worker
```

#### Explanation:

- `-d`: Run the container in detached mode (in the background).
- `-v /var/www/792917b7-a3e9-4158-8769-6c025db488b3:/var/www/app`: Mount the host machine directory to the container's `/var/www/app` directory.
- `-e APP_ENV=production`: Set the environment variable `APP_ENV` to `production`. You can set other environment variables as needed.
- `--name laravel-worker`: Name the container `laravel-worker`.
- `php8.1-laravel-worker`: The name of the image to run.

With this setup, you can use this Docker container with different code base paths by adjusting the volume mount path and environment variables as needed when running the container.

### Logs

Logs for the Laravel queue worker are stored in the container at `/var/log/worker.out.log` for stdout and `/var/log/worker.err.log` for stderr. To access the logs, you can use the following commands:

```sh
docker exec -it laravel-worker tail -f /var/log/worker.out.log
docker exec -it laravel-worker tail -f /var/log/worker.err.log
```

## Additional Information

- **Dockerfile**: This file sets up the PHP environment and installs necessary extensions and Composer.
- **supervisord.conf**: This file configures Supervisor to manage the Laravel queue worker command.

Feel free to customize the Dockerfile and Supervisor configuration according to your needs. For example, you might want to add additional PHP extensions or adjust the Supervisor settings.

## Contributing

If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.
```
