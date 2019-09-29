#!/usr/bin/env bash

set -e

readonly EXIT_UNSUPPORTED_OS=1
readonly EXIT_BUG=255

readonly PM_HOMEBREW="homebrew"

readonly HOMEBREW_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"
readonly JANDALS_URL="git+https://github.com/BotTech/jandals.git@master#egg=jandals"
readonly PYTHON_VERSION="3.7.4"

install_homebrew() {
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL "${HOMEBREW_URL}")"
    echo "Homebrew installed."
  fi
}

install_python_via_homebrew() {
  temp_file="$(mktemp -t "$(basename "$0")")"
  echo brew '"pyenv"' > "${temp_file}"
  brew bundle install --file="${temp_file}"
  rm "${temp_file}"
  pyenv install --skip-existing "${PYTHON_VERSION}"
  eval "$(pyenv init -)"
  pyenv shell "${PYTHON_VERSION}"
}

# Detect and setup Package Manager.
case "${OSTYPE}" in
  darwin*)
    PM="${PM_HOMEBREW}"
    install_homebrew
    ;;
  # TODO
  #linux-gnu)
  #  ;;
  #cygwin|msys)
  #  ;;
  #freebsd*)
  #  ;;
  *)
    >&2 echo "Your operating system (${os}) is not supported."
    exit "${EXIT_UNSUPPORTED_OS}"
    ;;
esac

echo "Installing Python..."
case "${PM}" in
  "${PM_HOMEBREW}")
    install_python_via_homebrew
    ;;
  *)
    >&2 echo "Oops you found a bug."
    >&2 echo "There is a missing case for PM on line #$((${LINENO}-2)) of $(basename "$0")."
    exit "${EXIT_BUG}"
    ;;
esac
echo "Python installed."

echo "Installing Jandals..."
pip install -e "${JANDALS_URL}"

echo "Starting Jandals..."
jandals "$@"
