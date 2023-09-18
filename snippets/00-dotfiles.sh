#!/bin/bash

header "Add dotfiles commands"

bashrc_snippet "Dotfiles" "
  dotfiles() {
    case \$1 in
      run)
        sh -c \"\`curl -fsSL https://raw.github.com/rangoo94/dotfiles/master/remote-setup.sh\`\"
        ;;
      cd)
        cd \"$DOTFILES_PATH\"
        ;;
      *)
        echo 'dotfiles [run|cd]'
        return 1
        ;;
    esac
  }
"

success "Configured \`dotfiles\` commands."
