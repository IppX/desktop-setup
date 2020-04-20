export HISTSIZE=10000
export HISTFILESIZE=10000

#export PATH=$HOME/go/bin:$PATH
#export PATH="/snap/bin:$PATH"
#export PATH=$PATH:/usr/local/go/bin

export ANSIBLE_NOCOWS=1
#export VAGRANT_DEFAULT_PROVIDER=libvirt

# kubernetes helpers
alias kafkapod='kubectl run --generator=run-pod/v1 kafkacat --rm -i --tty --namespace platform-tooling  --image confluentinc/cp-kafkacat --command -- bash'
alias debugpod='kubectl run --generator=run-pod/v1 toolbox --rm -i --tty --namespace platform-tooling  --image ubuntu:18.04 --command -- bash'

# xinput settings for Magic TrackPad 2
if [[ "$(xinput | grep 'Apple Inc. Magic Trackpad 2')" != "" ]]; then
	# Tap
	xinput set-prop "pointer:Apple Inc. Magic Trackpad 2" "libinput Tapping Enabled" 1
	# Natural scroll
	xinput set-prop "pointer:Apple Inc. Magic Trackpad 2" "libinput Natural Scrolling Enabled" 0
fi;
