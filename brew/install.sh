if test ! $(which brew) ; then
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)" || exit
fi

for PKG in $(cat $(dirname $0)/packages) ; do
  brew install $PKG
done

