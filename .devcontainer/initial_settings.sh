#!/bin/sh
mkdir $HOME/.ssh
echo $SSH_PUBKEY > $HOME/.ssh/id_rsa.pub
