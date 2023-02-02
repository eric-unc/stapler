# see https://github.com/comp211/comp211-container/blob/master/.bashrc

hostdir="/mnt/stapler"

# Install SSH keys
# Copy SSH files to ~/.ssh from .ssh on host
hostssh="${hostdir}/.ssh"
if [ -d "${hostssh}" ]
then
    mkdir -p ~/.ssh
    for file in ${hostssh}/*
    do
        cp "${file}" ~/.ssh
    done

    # Establish User-only Permissions on SSH directory
    chmod -R 600 ~/.ssh

    # Start SSH Agent
    if [ -f ~/.ssh/id_rsa ]; then
        ssh-add -D >/dev/null 2>&1
        ssh-agent -k >/dev/null 2>&1
        eval `ssh-agent -s` >/dev/null
        ssh-add >/dev/null
    fi       
fi
