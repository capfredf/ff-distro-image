# Specify the license of the container build description (see also the LICENSE file)
# SPDX-License-Identifier: MIT
# Define the names/tags of the container

FROM opensuse/distrobox

# Fill the image with content and clean the cache(s)
RUN env ZYPP_PCK_PRELOAD=1 zypper --non-interactive in\
    # For base
    racket htop ripgrep git vim tig tmux make curl wl-clipboard \
    fish libgccjit-devel libgccjit0 gcc-c++ fd man-pages-posix coreutils-doc emacs-x11 opam gsettings-desktop-schemas \
    # For python
    pyenv python313-virtualenv python313-pipx python313-Pygments python313-keyring python313-keyring python313-Markdown \
    # For agda
    gmp-devel zlib-devel \
    # For emacs
    hunspell libenchant-2-2 enchant-2-backend-hunspell emacs-jinx gtk2-metatheme-adwaita \
    # For texlive
    texlive-collection-basic texlive-bbm texlive-wrapfig texlive-ulem texlive-capt-of texlive-minted texlive-mathtools texlive-collection-fontsextra texlive-savesym texlive-xargs \
    texlive-mathpartir texlive-pgfplots texlive-cancel texlive-luacode texlive-luacode texlive-biber texlive-cleveref texlive-synctex-bin texlive-enumitem texlive-ebproof \
    texlive-subfiles texlive-todonotes texlive-latexmk perl-Parse-RecDescent texlive-tikz-cd texlive-stmaryrd texlive-totpages texlive-hyperxmp texlive-comment texlive-pbalance \
    texlive-tex-gyre-math texlive-hardwrap texlive-babel-english texlive-textcase texlive-doclicense texlive-multirow texlive-threeparttable texlive-datetime2 texlive-fnpct texlive-beamer \
    texlive-beamertheme-metropolis texlive-tikzmark texlive-wasysym texlive-hyphenat texlive-parskip texlive-tikzfill texlive-thmtools texlive-epigraph \
    # For other
    entr ncurses-devel typst fd-fish-completion zig && zypper clean -a
