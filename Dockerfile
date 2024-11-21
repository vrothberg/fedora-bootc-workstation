FROM quay.io/fedora/fedora-bootc:41@sha256:ef5fd46ac0e84b4760c8f5a30fc088c65f49b926ba5e57b5e14aeb85b67618ff

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
