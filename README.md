# Sinatra + Angular Seed

Get started hacking Sinatra and Angular on Heroku ASAP.

Out of the box, you get:

* Opinionated default setup of a Sinatra Web Application
* API with CORS, Sockets and JSON Support
* CLI Support
* Heroku configuration
* Unit Tests
* Standard Gem setup

# Getting started

## Pull down the seed and start the app

    git clone https://github.com/mefellows/sinatra-angular-seed.git
    cd sinatra-angular-cd
    bundle install
    foreman start

Test that we're up:

    curl  "http://localhost:8080/status"

All going to plan, you should see ```alive``` indicating the app is running.

Setup the UI

    cd public
    npm install
    bower install
    grunt

View your Web front end by visiting ```http://localhost:8080/``` in your favourite web browser.

You will want to change the name of files/folders from 'placeholder' to the name of your app. If you have the 'rename' command, this is the quickest way forward (```brew install rename``` if you don't have it and are running Mac OSX):

   find . -type d -iname '*sitemap*' -depth -exec rename 's@sitemap@<your app name in lower-case>@gi' {} +
   find . -type f -iname '*sitemap*' -depth -exec rename 's@sitemap@<your app name in lower-case>@gi' {} +

Then a quick update to the files themselves:

   find . -type f | xargs sed -i 's/sitemap/<your app name in lower-case>/g'
   find . -type f | xargs sed -i 's/sitemap/<your app name in UpperCamelCase>/g'

Alternatively, you can change them manually yourself.

## Testing

    rake

## Deploying to Heroku

You will of course need to create an app in Heroku before deployment, a typical setup would look like:

    heroku app:create <my awesome app>
    heroku config:set BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git
    git push heroku master

## Logging

By default, we log to the stdout stream (as per Heroku's guide: ). If you'd like to change this behaviour, set the ```LOG_OUTPUT_FILENAME``` environment variable:


    $ bin/placeholder  magic http://www.onegeek.com.au/
     INFO placeholder.placeholdercommand: Magic happens!
    $ export LOG_OUTPUT_FILENAME='placeholder.log'
    $ bin/placeholder  magic http://www.onegeek.com.au/
    $ cat placeholder.log
     INFO placeholder.placeholdercommand: Magic happens!

# TODO

* Yeoman Generator: This might eventually turn into a Yeoman generator, meaning an interactive CLI will guide you through a setup instead of a static clone.
* Docker/Puppetize: For deployment to a non-Heroku environment, Puppet and Docker are popular alternatives.

# Acknowledgements

* Sinatra
* Eventmachine
* Foreman
* Angular
