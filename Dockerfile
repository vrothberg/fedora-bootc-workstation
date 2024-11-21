FROM quay.io/fedora/fedora-bootc:42@sha256:88c9a77c566e043b1c49bfda9bfbcc603520aef7e860d2fadd84fff5f14831ad

#install rpmfusion
RUN dnf install -y \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

RUN dnf group install -y \
	container-management \
	gnome-desktop \
	virtualization

RUN dnf install -y \
	neovim \
	tmate \
	tmux

RUN systemctl set-default graphical.target
