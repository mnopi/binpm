# shellcheck shell=sh

# '1' if 'DIST_ID' is 'alpine' and not: nix or busybox
#
export ALPINE

# '1' if 'DIST_ID' is 'alpine'
#
export ALPINE_LIKE

# '1' if 'DIST_ID' is 'arch' for archlinux
#
export ARCH

# '1' if not '/etc/os-release' and not '/sbin'.
#
export BUSYBOX

# '1' if 'DIST_ID' is 'centos'.
#
export CENTOS

# '1' if running in docker container.
    #
export CONTAINER

# '1' if 'DIST_ID' is 'debian'.
#
export DEBIAN

# 'noninteractive' if 'IS_CONTAINER' and 'DEBIAN_LIKE' are set.
    #
export DEBIAN_FRONTEND

# '1' if 'DIST_ID_LIKE is 'debian'.
#
export DEBIAN_LIKE

# <html><h2>Distribution Codename</h2>
# <p><strong><code>$DIST_CODENAME</code></strong> (always exported).</p>
# <ul>
# <li><code>Catalina</code></li>
# <li><code>Big Sur</code></li>
# <li><code>kali-rolling</code></li>
# <li><code>focal</code></li>
# <li><code>etc.</code></li>
# </ul>
# </html>
export DIST_CODENAME

# <html><h2>Distribution ID</h2>
# <p><strong><code>$DIST_ID</code></strong> (always exported).</p>
# <ul>
# <li><code>alpine</code></li>
# <li><code>centos</code></li>
# <li><code>debian</code></li>
# <li><code>kali</code></li>
# <li><code>macOS</code></li>
# <li><code>ubuntu</code></li>
# </ul>
# </html>
export DIST_ID

# <alpine|debian|rhel fedora>.
#
export DIST_ID_LIKE

# '1' if 'DIST_ID' is unknown.
#
export DIST_UNKNOWN

# <html><h2>Distribution Version</h2>
# <p><strong><code>$DIST_ID</code></strong> (always exported).</p>
# <ul>
# <li><code>macOS</code>: 10.15.1, 10.16 ...</li>
# <li><code>kali</code>: 2021.2, ...</li>
# <li><code>ubuntu</code> 20.04, ...</li>
# </ul>
# </html>
export DIST_VERSION

# '1' if 'DIST_ID' is 'fedora' or 'fedora' in 'DIST_ID_LIKE'.
#
export FEDORA_LIKE

# '1' if 'DIST_ID' is 'fedora'.
#
export FEDORA

# Version of formula, $HOMEBREW_PREFIX/opt is a symlink to $HOMEBREW_CELLAR (brew shellenv).
#
export HOMEBREW_CELLAR

# Brew bash completion (bash_completion.d) compat directory $BASH_COMPLETION_COMPAT_DIR, under etc.
#
export HOMEBREW_COMPLETION

# Homebrew etc
#
export HOMEBREW_ETC="${HOMEBREW_PREFIX}/etc"

# Symlink for the latest version of formula to $HOMEBREW_CELLAR.
#
export HOMEBREW_OPT

# Homebrew prefix (brew shellenv)
#
export HOMEBREW_PREFIX

# Profile compat dir (profile.d), under etc.
#
export HOMEBREW_PROFILE

# Repository and Library with homebrew gems and Taps (brew shellenv).
#
export HOMEBREW_REPOSITORY

# Taps path under '$HOMEBREW_REPOSITORY/Library'.
#
export HOMEBREW_TAPS

# <html><h2>First part of hostname</h2>
# <p><strong><code>$HOST</code></strong> (always exported).</p>
# <ul>
# <li><code>foo.com</code>: foo</li>
# <li><code>example.foo.com</code>: example</li>
# </ul>
# </html>
export HOST

# Symbol and 'HOST' if 'CONTAINER' or 'SSH'.
    #
export HOST_PROMPT

# '1' if 'DIST_ID' is 'kali'.
#
export KALI

# <html><h2>Is MACOS?</h2>
# <p><strong><code>$MACOS</code></strong> (always exported).</p>
# <p><strong><code>Boolean</code></strong></p>
# <ul>
# <li><code>true</code>: $UNAME is darwin</li>
# <li><code>false</code>: $UNAME is linux</li>
# </ul>
# </html>
export MACOS

# '1' if 'DIST_ID' is 'alpine' and '/etc/nix'.
#
export NIXOS

# <html><h2>Default Package Manager</h2>
# <p><strong><code>$PM</code></strong> (always exported).</p>
# <ul>
# <li><code>apk</code></li>
# <li><code>apt</code></li>
# <li><code>brew</code></li>
# <li><code>nix</code></li>
# <li><code>yum</code></li>
# </ul>
# </html>
export PM

# <html><h2>Default Package Manager with Install Options</h2>
# <p><strong><code>$PM_INSTALL</code></strong> (always exported).</p>
# <p><strong><code>Quiet and no cache (for containers)</code></strong>.</p>
# <ul>
# <li><code>apk</code></li>
# <li><code>apt</code></li>
# <li><code>brew</code></li>
# <li><code>nix</code></li>
# <li><code>yum</code></li>
# </ul>
# </html>
export PM_INSTALL

# PyCharm contents (initial plugins, etc.).
#
export PYCHARM_CONTENTS

# PyCharm repository, application executable and configuration full path.
#
export PYCHARM

# '1' if 'DIST_ID' is 'rhel'.
#
export RHEL

# '1' if 'DIST_ID' is 'rhel' or 'rhel' in 'DIST_ID_LIKE'.
#
export RHEL_LIKE

# '1' if 'SSH_CLIENT' or 'SSH_TTY' or 'SSH_CONNECTION'.
#
export SSH

# '1' if 'DIST_ID' is 'ubuntu'.
#
export UBUNTU

# <html><h2>Operating System System Name</h2>
# <p><strong><code>$UNAME</code></strong> (always exported).</p>
# <ul>
# <li><code>Darwin</code></li>
# <li><code>Linux</code></li>
# </ul>
# </html>
export UNAME

dist_id() {
  case "${DIST_ID}" in
    alpine)
      ALPINE_LIKE='1'; DIST_ID_LIKE="${DIST_ID}"
      if [ -r '/etc/nix' ]; then NIXOS='1'; PM='nix-env'; else ALPINE='1'; PM='apk'; fi
      ;;
    arch) ARCH='1'; PM='pacman' ;;
    centos) CENTOS='1'; PM='yum' ;;
    debian) DEBIAN='1'; DEBIAN_LIKE='1'; DIST_ID_LIKE="${DIST_ID}" ;;
    fedora) FEDORA='1'; FEDORA_LIKE='1'; PM='dnf' ;;
    kali) KALI='1' ;;
    rhel) RHEL='1'; RHEL_LIKE='1'; PM='yum' ;;
    ubuntu) UBUNTU='1' ;;
    *) DIST_UNKNOWN='1' ;;
  esac
}

dist_id_like() {
  case "${DIST_ID}" in
    debian) DEBIAN_LIKE='1'; PM='apt' ;;
    *fedora*) FEDORA_LIKE='1';;
    *rhel*) RHEL_LIKE='1' ;;
  esac
}

pm_install() {
  if [ "${PM-}" ]; then
    case "${PM}" in
      # pacman -Sy (like apt update)
      apk) PM_INSTALL="${PM} ${PM} add -q --no-progress"; NO_CACHE='--no-cache' ;;
      apt) PM_INSTALL="${PM} -qq full-upgrade -y && ${PM} -qq auto-remove -y && ${PM} -qq update -y \
&& ${PM} -qq install -y" ;;
      brew) PM_INSTALL="${PM} install --quiet" ;;
      dnf) PM_INSTALL="${PM} install -y -q" ;;
      nix) PM_INSTALL="${PM} --install -A" ;; # nixos -> nixos.curl, no nixos --> nixpkgs.curl
      pacman) PM_INSTALL="${PM} -Sy && ${PM} -S --noconfirm" ;;
      yum) PM_INSTALL="${PM} install -y -q" ;;
      *) PM_INSTALL=''
    esac
  fi
}

system() {
  HOST="$(hostname -s || cut -d '.' -f 1 /etc/hostname)"
  UNAME="$(uname)"
  if [ "${UNAME}" = 'Darwin' ]; then
    CLT="$(xcode-select -p)/usr"
    DIST_ID="$(sw_vers -ProductName)"
    DIST_VERSION="$(sw_vers -ProductVersion)"
      # shellcheck disable=SC2016
      case "$(echo "${DIST_VERSION}" | awk -F. '{ print $1 $2 }')" in
      1013) DIST_CODENAME='High Sierra' ;;
      1014) DIST_CODENAME='Mojave' ;;
      1015) DIST_CODENAME='Catalina' ;;
      11*) DIST_CODENAME='Big Sur' ;;
      12*) DIST_CODENAME='Monterey' ;;
      *) DIST_CODENAME='Other' ;;
    esac
    HOMEBREW_PREFIX='/usr/local'
    MACOS='true'
    PM='brew'
    PM_INSTALL="${PM} install"
    PYCHARM_CONTENTS='/Applications/PyCharm.app/Contents'
    PYCHARM="${PYCHARM_CONTENTS}/bin"
  else
    if [ -f '/etc/os-release' ]; then
      while IFS='=' read -r name value; do
        case "${name}" in
          ID) DIST_ID="${value}"; dist_id; unset -f dist_id ;;
          ID_LIKE) dist_id_like; unset -f dist_id_like ;;
          VERSION_ID) DIST_VERSION="${value}" ;;
          VERSION_CODENAME) DIST_CODENAME="${value}" ;;
        esac
      done < '/etc/os-release'
    else
      BUSYBOX='1'; PM=''
    fi
    HOMEBREW_PREFIX='/home/linuxbrew/.linuxbrew'
    MACOS='false'
  fi

  pm_install; unset pm_install

  if [ "${SSH_CLIENT-}" ] || [ "${SSH_CONNECTION-}" ] || [ "${SSH_TTY-}" ]; then
    SSH='1'
    HOST_PROMPT="⌁ ${HOST}"
  elif [ -f '/proc/1/environ' ] || [ -f '/.dockerenv' ]; then
    CONTAINER='1'
    HOST_PROMPT="ꜿ ${HOST}"
    [ ! "${DEBIAN_LIKE-}" ] || DEBIAN_FRONTEND='noninteractive'
    if [ "${NO_CACHE-}" ]; then
      PM_INSTALL="${PM_INSTALL} ${NO_CACHE}"
    fi
  fi
}

system; unset -f system
