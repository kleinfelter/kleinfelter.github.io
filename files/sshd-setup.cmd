@echo on
c:
mkdir \OpenSSH-server
net user sshd password /add /fullname:"sshd server" /homedir:"C:\OpenSSH-server"
net localgroup Administrators sshd /add
cd "C:\Program Files\OpenSSH\bin"
mkgroup -l > ..\etc\group
mkpasswd -l > ..\etc\passwd
ntrights +r SeAssignPrimaryTokenPrivilege -u sshd
ntrights +r SeCreateTokenPrivilege -u sshd
ntrights +r SeDenyInteractiveLogonRight -u sshd
ntrights +r SeDenyNetworkLogonRight -u sshd
ntrights +r SeDenyRemoteInteractiveLogonRight -u sshd
ntrights +r SeIncreaseQuotaPrivilege -u sshd
ntrights +r SeServiceLogonRight -u sshd

