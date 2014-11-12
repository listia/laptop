Laptop
======

Laptop is a script to set up a Mac OS X for Rails development.

Requirements
------------

### Mac OS X

We support:

* [10.9: Mavericks](https://itunes.apple.com/us/app/os-x-mavericks/id675248567)

Older versions may work but aren't regularly tested. Bug reports for older
versions are welcome.

Install
-------

    bash <(curl -s https://raw.githubusercontent.com/listia/laptop/master/map) 2>&1 | tee ~/laptop.log


Debugging
---------

Your last Laptop run will be saved to `~/laptop.log`. Read through it to see if
you can debug the issue yourself. If not, copy the lines where the script
failed into a [new GitHub
Issue](https://github.com/thoughtbot/laptop/issues/new) for us. Or, attach the
whole log file as an attachment.

What it sets up
---------------

* [Bundler] for managing Ruby libraries
* [Homebrew] for managing operating system libraries (OS X only)
* [ImageMagick] for cropping and resizing images
* [RVM] for managing versions of Ruby
* [MySQL] for storing data
* [Ruby 1.9.3-p327] stable for writing general-purpose code

[Bundler]: http://bundler.io/
[Homebrew]: http://brew.sh/
[ImageMagick]: http://www.imagemagick.org/
[Qt]: http://qt-project.org/
[Redis]: http://redis.io/
[Ruby Build]: https://github.com/sstephenson/ruby-build
[Ruby]: https://www.ruby-lang.org/en/
[The Silver Searcher]: https://github.com/ggreer/the_silver_searcher
[Tmux]: http://tmux.sourceforge.net/
[Watch]: http://linux.die.net/man/1/watch
[Zsh]: http://www.zsh.org/

It should take less than 15 minutes to install (depends on your machine).

Laptop can be run multiple times on the same machine safely. It will upgrade
already installed packages and install and activate a new version of ruby (if
one is available).

Make your own customizations
----------------------------

Put your customizations in `~/.laptop.local`. For example, your
`~/.laptop.local` might look like this:

    #!/bin/sh

    brew tap caskroom/cask
    brew install brew-cask

    brew cask install dropbox
    brew cask install google-chrome
    brew cask install rdio

You should write your customizations such that they can be run safely more than
once. See the `mac` and `linux` scripts for examples.

Laptop'ed Linux Vagrant boxes
-----------------------------

We now publish [Vagrant](http://vagrantup.com) boxes with the Laptop script
applied for every supported Linux distro.

Create a Vagrantfile:

    vagrant init thoughtbot/ubuntu-14-04-server-with-laptop

In the same directory as your Vagrantfile:

    vagrant up
    vagrant ssh

Laptop'ed vagrantcloud boxes currently available:

* `thoughtbot/debian-wheezy-64-with-laptop`
* `thoughtbot/debian-jessie-64-with-laptop`
* `thoughtbot/ubuntu-14-04-server-with-laptop`
* `thoughtbot/ubuntu-12-04-server-with-laptop`

See our [vagrantcloud profile](https://vagrantcloud.com/thoughtbot). You must
have Vagrant >= 1.5.0 to use vagrantcloud images directly.

Credits
-------

![thoughtbot](http://thoughtbot.com/assets/tm/logo.png)

Laptop is maintained and funded by [thoughtbot, inc](http://thoughtbot.com/community).
The names and logos for thoughtbot are trademarks of thoughtbot, inc.

Thank you, [contributors](https://github.com/thoughtbot/laptop/graphs/contributors)!

Contributing
------------

Please see [CONTRIBUTING.md](https://github.com/thoughtbot/laptop/blob/master/CONTRIBUTING.md).

License
-------

Laptop is © 2011-2014 thoughtbot, inc. It is free software, and may be
redistributed under the terms specified in the LICENSE file.
