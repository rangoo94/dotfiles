# Dawid Rusnak' dotfiles

## Installation

```
$ git clone https://github.com/rangoo94/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
$ chmod +x run.sh
$ ./run.sh
```

and then follow manual steps.

## Remotely install using curl

Alternatively, you can install this into `~/dotfiles` remotely without Git using curl:

```sh
sh -c "`curl -fsSL https://raw.github.com/rangoo94/dotfiles/master/remote-setup.sh`"
```

Or, using wget:

```sh
sh -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/rangoo94/dotfiles/master/remote-setup.sh`"
```

## Manual steps

### Set-up SSH keys

Either [generate](https://confluence.atlassian.com/bitbucketserver/creating-ssh-keys-776639788.html) new keys,
or put existing to `~/.ssh` directory. 

### Set-up Chrome

* Set up 2 profiles in Google Chrome: "Basic" and "Developer"
* Install extensions on both profiles
   * [Disconnect](https://chrome.google.com/webstore/detail/disconnect/jeoacafpbcihiomhlakheieifhpjdfeo)
   * [Grammarly](https://chrome.google.com/webstore/detail/grammarly-for-chrome/kbfnbcaeplbcioakkpcpgfkobkghlhen)
   * [JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)
   * [OctoLinker](https://chrome.google.com/webstore/detail/octolinker/jlmafbaeoofdegohdhinkhilhclaklkp)
   * [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
* Install extensions on "Dev" profile
   * [DOMListener](https://github.com/kdzwinel/DOMListenerExtension)
   * [Full Page Screen Capture](https://chrome.google.com/webstore/detail/full-page-screen-capture/fdpohaocaechififmbbbbbknoalclacl)
   * [Perfmap](https://chrome.google.com/webstore/detail/perfmap/hgpnhiajcdppfbogcpfdgcceepgkhdmk)
   * [React Developer Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
   * [Redux DevTools](https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd)
   * [Tag Assistant (by Google)](https://chrome.google.com/webstore/detail/tag-assistant-by-google/kejbdjndbnbjgmefkgdddjlbokphdefk)
   * [Vue.js devtools](https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd)
   * [Web Developer](https://chrome.google.com/webstore/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm)

## Set-up JetBrains IDEs

* Log in to JetBrains Toolkit
* Install IntelliJ, WebStorm, CLion, GoLand, PyCharm Professional and DataGrip
* Install Material Theme UI, and set theme to Material Darker
* Install plugins, i.e.
   * [Wallaby.js](https://wallabyjs.com/download/)
   * .ignore
   * Quokka
   * BashSupport

## Set-up licenses and log in to

Including:

* JetBrains software
* Adobe Software (Adobe Photoshop CC, Adobe XD)
* MS Office
* Wallaby.js / Quokka
* Sketch
* Toggl
* Postman
* Spotify

## Touchbar

* Configure Touchbar to show "brightness slider" and "mute" natively
* Set up [BetterTouchTool](https://folivora.ai/) license
* Import [`rangoo94.bttpreset`](assets/rangoo94.bttpreset) into BTT
* Install [`btt-toggl`](https://www.npmjs.com/package/btt-toggl) NPM package, configure it and set up proper script in "Toggl"

## Other stuff

* Disable guest account
* Adjust Docker resources ("Preferences" > "Advanced"), giving more CPUs and memory
* Download and set-up [`modern.ie`](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/) virtual machines
