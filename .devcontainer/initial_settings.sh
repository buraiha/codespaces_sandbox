#!/bin/sh
mkdir /home/vscode/.ssh

#githubのcodespace secretにSSH_PUBKEYを定義しておくこと。
/usr/bin/gpg -d --batch --passphrase=$GPG_PASSPHRASE /root/tmp/id_rsa.gpg > /home/vscode/.ssh/id_rsa
echo /root/tmp/id_rsa.pub > /home/vscode/.ssh/id_rsa.pub

/bin/chown vscode:vscode /home/vscode/.ssh/id_rsa
/bin/chmod 400 /home/vscode/.ssh/id_rsa
/bin/chown vscode:vscode /home/vscode/.ssh/id_rsa.pub
/bin/chmod 644 /home/vscode/.ssh/id_rsa.pub

echo "initial_settings.sh done."
