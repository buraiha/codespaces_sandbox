#!/bin/sh
mkdir /home/vscode/.ssh

#githubのcodespace secretにSSH_PUBKEYを定義しておくこと。
echo $SSH_PUBKEY > /home/vscode/.ssh/id_rsa.pub
