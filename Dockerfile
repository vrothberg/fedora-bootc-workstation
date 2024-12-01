FROM quay.io/fedora/fedora-bootc:41@sha256:e5d972d67c854fdf054f1162d8758f79057f5f611ea7879530cc67da98152420

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
	workstation-product

RUN dnf install -y \
	bash-completion \
	htop \
	neovim \
	strace \
	tmate \
	tmux \
	vgrep

RUN systemctl set-default graphical.target
