# FYI: https://github.com/fedora-cloud/Fedora-Dockerfiles
: ${USERNAME:=guest}
: ${PASS:=$(dd if=/dev/urandom bs=1 count=15 | base64)}
_create_new() {
  useradd $USERNAME
  echo -e "$PASS\n$PASS" | (passwd --stdin $USERNAME)
  echo The password for an SSH connection: $PASS
}
_set() {
  ssh-keygen -b 4096 -f /etc/ssh/ssh_host_rsa_key -N ""
}
# Function calls
_set
_create_new
exec "$@"