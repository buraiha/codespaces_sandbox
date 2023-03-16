#!/bin/sh
echo -n "Starting initial_settings.sh. running user: " && echo $(whoami)
mkdir /home/vscode/.ssh

# 本コンテナで使うssh鍵ペアの復号&設置処理。
# 本コンテナから外部サーバ等へssh突する場合に必要。
# ssh秘密鍵はあらかじめpassphrase付きgpgで暗号化して.devcontainerに格納しておく。
# passphraseはgithubのcodespace secretにdecode用のGPG_PASSPHRASEとしてを定義しておくこと。

# codespace secret依存の部分はこの部分のみになるので、codespace内から別のサーバにsshする必要がないのであれば、
# 以下のgpgによるid_rsa復号から.sshディレクトリの仕込みまでの処理は不要。

# ここから↓
# id_rsa復号処理 -> .sshディレクトリ設置処理
/usr/bin/gpg -d --batch --passphrase=$GPG_PASSPHRASE /cs_work/id_rsa.gpg > /home/vscode/.ssh/id_rsa
rm /cs_work/id_rsa.gpg
mv /cs_work/id_rsa.pub /home/vscode/.ssh/id_rsa.pub
mv /cs_work/config /home/vscode/.ssh/config
/bin/chown vscode:vscode /home/vscode/.ssh/id_rsa
/bin/chmod 400 /home/vscode/.ssh/id_rsa
/bin/chown vscode:vscode /home/vscode/.ssh/id_rsa.pub
/bin/chmod 400 /home/vscode/.ssh/id_rsa.pub
/bin/chmod 600 /home/vscode/.ssh/config
# ここまで↑ 外部にsshしないのであれば不要。

echo "initial_settings.sh is done."
