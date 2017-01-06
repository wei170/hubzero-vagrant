HUBzero Vagrant
===============
This is a Scotch Box vagrant setup for the HUBzero Content Management System. The main motivation is to create a portable and disposable environment for web development.

** This is NOT a production-ready system!! ** 
The passwords are weak, information may be included in the database, file permissions are not properly set, etc. etc. etc. Why? Because let the sysadmins worry about it while you write your code.
Please checkout [the official HUBzero Website](https://hubzero.org/download) for more secure options. 

If you have issues, [please create an issue on GitHub](https://github.com/kevinwojo/hubzero-vagrant/issues).

The original scotch-box documentation can be found here: [https://github.com/scotch-io/scotch-box/blob/master/README.md](https://github.com/scotch-io/scotch-box/blob/master/README.md). There are some useful things like MailCatcher which can help development.

## Setup
 1. Clone this repository: `git clone https://github.com/kevinwojo/hubzero-vagrant.git`
 1. Start the Vagrant Box by running the `vagrant up` command using a Terminal program from within the hubzero-vagrant directory that was created in Step 1.
 1. Remove any files in the public directory
 1. Clone the HUBzero repository into the public directory by running `git clone https://github.com/hubzero/hubzero-cms.git --depth 1 -b 2.1.0 public/.`
 1. Remove the `public/app` directory.
 1. Copy the `app-scotch` directory into `public` directory.
 1. Rename the `public/app-scotch` directory to `public/app/`.
 1. Run `vagrant ssh` to enter the Vagrant Box.
 1. Navigate to the `/var/www/public/core` directory and run the command `php bin/composer install` to pull in external dependancies.
 1. Navigate to the `/var/www/public` directory and run `php muse migration -i -f` to run the latest database migrations.
 
