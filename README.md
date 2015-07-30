StuartOlivera.com
=================
All the magnificent code for http://stuartolivera.com

Requirements
-----------------
* Ruby
* Compass
* compass_twitter_bootstrap gem

Install
-----------------
```bash
$ brew install bundler # if you don't already have bundler
$ git clone git@github.com:sman591/stuartolivera.com.git
$ cd stuartolivera.com
$ bundle install --path vendor --local
$ compass compile
```

Compiling
-----------------
My workflow is currently a bit segmented until I make the upgrade to [Middleman](http://middlemanapp.com/). I use LiveReload to compile Haml & CoffeeScript, and ```compass compile``` to compile Compass (since LiveReload 2 doesn't support rbenv, therefore breaking all of compass)

Compile paths:

* src/index.haml ~> public/index.html
* src/stylesheets ~> public/css
* src/javascripts ~> public/js
