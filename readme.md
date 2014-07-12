# Personal blog

Build status: ![build status](https://travis-ci.org/asavin/alexsavin.me.svg?branch=master)

This blog is deployed to [alexsavin.me](http://alexsavin.me)

Under the hood there is Red Badger Generator located under `/generate`. It's a (you guessed it) static pages generator. Blazing fast and easy to use.

To generate site run these commands:

    npm install
    ./generate/bin/generator

Build can be found in `/out` directory and then deployed anywhere (like, Dropbox public folder, or Amazon S3 bucket). I'm using Travis CI, hooked to the Github repository, which builds the site after every push, and deploys it to my S3 bucket.

Both Generator and site template will be available as generic open source projects at some point in the future.
