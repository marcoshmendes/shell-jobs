# shell-jobs
Shell scripts for useful jobs at developer life

# Turn file into executable

`chmod +x file.sh`

Then you can run it without bash prefix:

`./file.sh`

# Files

### nginx-block

- Create local domain at /etc/hosts
- Create /etc/nginx/sites-available/domain
- Create a symbolic link to /etc/nginx/sites-enabled
- Restart nginx

### install.sh

This script is very useful when you have a brand new installation of linux (debian based) and need to install some tools to start develop.
You may edit this file to include your own version of softwares of your day by day use.
This version contain:

- curl
- git
- vscode
- spotify
- chrome
- slack
- aws-cli
- teamviewer

### mysql-backup.sh

This helps you to execute dumps (backups) of your mysql database and upload then to AWS S3. You can schedule CRON to run or manually.
