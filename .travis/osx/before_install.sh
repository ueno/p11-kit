brew update
brew install libffi bash-completion bison

export PATH=${PATH}:/usr/local/opt/gettext/bin
export PATH=/usr/local/opt/bison/bin:${PATH}
export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/opt/libffi/lib/pkgconfig
