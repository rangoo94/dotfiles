# My Dotfiles

Based on [Nick Plekhanov's Dotfiles](https://github.com/nicksp/dotfiles).

Typically I work on OSX, mostly working on NodeJS.

## Installation

```sh
$ git clone https://github.com/rangoo94/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
$ chmod +x setup.sh
$ ./setup.sh
```

## Remotely install using curl

Alternatively, you can install this into `~/dotfiles` remotely without Git using curl:

```sh
sh -c "`curl -fsSL https://raw.github.com/rangoo94/dotfiles/master/remote-setup.sh`"
```

Or, using wget:

```sh
sh -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/rangoo94/dotfiles/master/remote-setup.sh`"
```

## Customize

**Note:** Use `~/.gitconfig.local` to store sensitive information such
as the `git` user credentials, e.g.:

```sh
[user]
  name = Dawid Rusnak
  email = nick@example.com
```

## Manual work

- Generate SSH key (`ssh-key` command is ready)
- Set up Dracula theme in WebStorm & PyCharm
- Install Chrome extensions:
  - AdBlock
  - CSS Peeper
  - DOMListener
  - Full Page Screen Capture
  - Ghostery
  - Grammarly
  - JSON Viewer
  - Lighthouse
  - Octolinker
  - PageSpeed Insights
  - Perfmap
  - React Developer Tools
  - Redux DevTools
  - Tag Assistant (by Google)
  - The Great Suspender
  - Vue.js devtools
  - Web Developer
- Install WebStorm/PyCharm plugins:
  - .ignore
  - dotplugin
  - Quokka
  - Wallaby
- Install Keynote, Numbers, Pages, CPULed from App Store
- Download and set up modern.ie images
- Log in or set up licenses:
  - WebStorm
  - Wallaby
  - Quokka
  - Toggl
  - Sketch
  - Postman
  - Spotify
- Set up Git user

## To do

- [ ] Automate installs from App Store
- [ ] Automate downloading some modern.ie images
- [ ] Automate loading WebStorm plugins
- [ ] Automate loading Chrome extensions
