#!/bin/sh
mkdir $HOME/.ssh

#githubのcodespace secretにSSH_PUBKEYを定義しておくこと。
echo $SSH_PUBKEY > $HOME/.ssh/id_rsa.pub
