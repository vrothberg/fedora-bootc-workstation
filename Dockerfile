FROM quay.io/fedora/fedora-bootc:41@sha256:4980182187e22cd14115b1f6d03514b7e841a893668dbb220e0f096072da098f

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
