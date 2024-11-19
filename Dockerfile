FROM quay.io/fedora/fedora-bootc:41

#install rpmfusion
RUN dnf install -y \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

RUN dnf group install -y \
	container-management \
	gnome-desktop \
	virtualization

RUN dnf install -y \
	gnome-terminal \
	neovim \
	tmate \
	tmux

RUN systemctl set-default graphical.target
