export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%d/%m/%y %T "
export EDITOR=vim
export PATH=$HOME/.local/bin:$PATH
export ANSIBLE_NOCOWS=1
#export VAGRANT_DEFAULT_PROVIDER=libvirt

# aliases
alias ll='ls -lha'
alias dig='dig +noall +answer +ttlunits'
# kubernetes helpers
alias kafkapod='kubectl run kafkacat --rm -i --tty --namespace default  --image confluentinc/cp-kafkacat --command -- bash'
alias debugpod='kubectl run toolbox --rm -i --tty --namespace default  --image ubuntu:22.04 --command -- bash'

# functions
function git_prune() {
	git fetch -p
	for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do 
		git branch -D $branch; 
	done;
}

function get_ec2_tags() {
	steampipe query "select tags from aws.aws_ec2_instance where instance_id='$1'"
}


