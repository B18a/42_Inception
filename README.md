<p align="center">
  <img src="https://github.com/B18a/42-project-badges/blob/main/badges/inceptionm.png">
</p>

<h1 align="center">
  Project - Inception
</h1>

The "Inception" project involves creating a small Docker-based infrastructure within a virtual machine to enhance system administration skills. Participants will build and configure Docker containers for services like NGINX, WordPress, and MariaDB while adhering to strict guidelines and best practices.

- **Infrastructure Requirements:**

Configure NGINX with TLSv1.2/1.3 as the sole entry point.
Set up WordPress with PHP-FPM and MariaDB, each in dedicated containers.
Use volumes for WordPress files and database storage.
Connect containers through a Docker network.
Guidelines:

Build all containers from scratch using Alpine or Debian images.
Avoid pre-built images and infinite loop hacks.
Use environment variables and a .env file for secure configuration.
Store sensitive data (e.g., credentials, passwords, API keys) securely in local files or Docker secrets, ensuring they are ignored by Git.
Bonus Features:

Add Redis caching for WordPress.
Set up an FTP server pointing to WordPress files.
Create a static website in any language except PHP.
Configure Adminer for database management.
Implement an additional useful service with justification.

<p align="center">
  <img src="https://github.com/B18a/42_Inception/blob/master/overview.png">
</p>
  
*Summary generated with chatgpt
