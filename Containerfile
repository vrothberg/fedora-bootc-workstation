FROM quay.io/fedora/fedora-bootc:41@sha256:1c3dcceaef776490289eb03a61154b4760d21ad2ff65b3a62368c5ed1c8b7538

# Make sure that the rootfiles package can be installed
RUN mkdir -p /var/roothome /data

#install rpmfusion
RUN dnf install -y \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

RUN dnf group install -y \
	base-graphical \
	container-management \
	core \
	firefox \
	fonts \
	gnome-desktop \
	guest-desktop-agents \
	hardware-support \
	multimedia \
	networkmanager-submodules \
	printing \
	virtualization \
	workstation-product \
	; dnf -y clean all

RUN dnf install -y \
	bash-completion \
	bcc-tools \
	htop \
	neovim \
	strace \
	tmate \
	tmux \
	vgrep \
	; dnf -y clean all

RUN systemctl set-default graphical.target

# See https://fedoraproject.org/wiki/Changes/UnprivilegedUpdatesAtomicDesktops:
#     Avoid annoying popups when logged in.
RUN dnf install -y fedora-release-ostree-desktop \
	; dnf -y clean all

# Resize windows on super+mouse-right-click
RUN gsettings set org.gnome.desktop.wm.preferences resize-with-right-button "true"

# Install all RPMs in ./additional_rpms
RUN --mount=type=bind,source=./additional_rpms,target=/additional_rpms,Z \
	dnf -y --disablerepo='*' install --skip-unavailable /additional_rpms/*.rpm \
	; dnf -y clean all

# Final lint step to prevent easy-to-catch issues at build time
RUN bootc container lint
