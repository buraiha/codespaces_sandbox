#!/bin/sh
echo -n "Starting initial_settings.sh. running user: " && echo $(whoami)
mkdir /home/vscode/.ssh

#githubのcodespace secretにdecode用のGPG_PASSPHRASEを定義しておくこと。
/usr/bin/gpg -d --batch --passphrase=$GPG_PASSPHRASE /cs_work/id_rsa.gpg > /home/vscode/.ssh/id_rsa
rm /cs_work/id_rsa.gpg
mv /cs_work/id_rsa.pub /home/vscode/.ssh/id_rsa.pub
mv /cs_work/config /home/vscode/.ssh/config

/bin/chown vscode:vscode /home/vscode/.ssh/id_rsa
/bin/chmod 400 /home/vscode/.ssh/id_rsa
/bin/chown vscode:vscode /home/vscode/.ssh/id_rsa.pub
/bin/chmod 400 /home/vscode/.ssh/id_rsa.pub
/bin/chmod 600 /home/vscode/.ssh/config

echo "initial_settings.sh is done."
