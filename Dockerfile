# Specify the license of the container build description (see also the LICENSE file)
# SPDX-License-Identifier: MIT
# Define the names/tags of the container
#!BuildTag: opensuse/ff-distrobox:latest opensuse/ff-distrobox:%PKG_VERSION% opensuse/ff-distrobox:%PKG_VERSION%.%RELEASE%

FROM opensuse/distrobox

# Define labels according to https://en.opensuse.org/Building_derived_containers
# labelprefix=org.opensuse.ff-distrobox
LABEL org.opencontainers.image.title="FF distrobox"
LABEL org.opencontainers.image.description="This contains nano %PKG_VERSION%"
LABEL org.opencontainers.image.version="%PKG_VERSION%.%RELEASE%"
LABEL org.opensuse.reference="registry.opensuse.org/opensuse/ff-distrobox:%PKG_VERSION%.%RELEASE%"
LABEL org.openbuildservice.disturl="%DISTURL%"
LABEL org.opencontainers.image.created="%BUILDTIME%"
# endlabelprefix

# Fill the image with content and clean the cache(s)
# For base
RUN zypper --non-interactive in racket htop ripgrep git vim tig tmux make curl wl-clipboard fish libgccjit-devel libgccjit0 gcc-c++ fd man-pages-posix coreutils-doc emacs-x11 opam gsettings-desktop-schemas

# For python
RUN zypper --non-interactive in pyenv python311-virtualenv python311-pipx python311-Pygments

# For agda
RUN zypper --non-interactive in gmp-devel zlib-devel

# For emacs
RUN zypper --non-interactive in hunspell enchant emacs-jinx gtk2-metatheme-adwaita

# For texlive
RUN zypper --non-interactive in texlive-collection-basic texlive-bbm texlive-wrapfig texlive-ulem texlive-capt-of texlive-minted texlive-mathtools texlive-collection-fontsextra texlive-savesym texlive-xargs texlive-mathpartir texlive-pgfplots texlive-cancel texlive-luacode texlive-luacode texlive-biber texlive-cleveref texlive-synctex-bin texlive-enumitem texlive-ebproof texlive-subfiles texlive-todonotes texlive-latexmk perl-Parse-RecDescent texlive-tikz-cd texlive-stmaryrd texlive-totpages texlive-hyperxmp texlive-comment texlive-pbalance texlive-tex-gyre-math texlive-hardwrap texlive-babel-english texlive-textcase texlive-doclicense texlive-multirow

# For other
RUN zypper --non-interactive in entr ncurses-devel

RUN zypper clean -a
