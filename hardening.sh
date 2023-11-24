#!/bin/bash
# ------------------------------------------------------------------
# [Etienne] Hardening
#           OpenSSH - hardening
# ------------------------------------------------------------------

# Sauvegarde de votre fichier de configuration existant, afin de pouvoir le restaurer dans le cas improbable où quelque chose se passerait mal.
$ sudo cp /etc/ssh/sshd_config /etc/ssh/ssh

# options actuellement configurées.
$ sudo sshd -t

# configuration de la permission.
$ sudo sed -i 's/PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/ssh.config

# Limitation du nombre de connexion. 
$ sudo sed -i 's/MaxAuthTries.*/MaxAuthTries 3/' /etc/ssh/ssh.config

# Délai de connexion.
$ sudo sed -i 's/LoginGraceTime.*/LoginGraceTime 20/' /etc/ssh/ssh.config

# Désactivation de l'authentification. 
$ sudo sed -i 's/PermitEmptyPasswords.*/PermitEmptyPasswords no/' /etc/ssh/ssh.config

# Authentification par mots de passe SSH.
$ sudo sed -i 's/PasswordAuthentification.*/PasswordAuthentification no/' /etc/ssh/ssh.config

# Désactivation de la methode d'authentification ChallengeResponseAuthentication.
$ sudo sed -i 's/ChallengeResponseAuthentication.*/ChallengeResponseAuthentication no/' /etc/ssh/ssh.config

# Désactivation de la methode d'authentification KerberosAuthentication.
$ sudo sed -i 's/KerberosAuthentication.*/KerberosAuthentication no/' /etc/ssh/ssh.config

# Désactivation de la methode d'authentification GSSAPIAuthentication.
$ sudo sed -i 's/GSSAPIAuthentication.*/GSSAPIAuthentication no/' /etc/ssh/ssh.configgit 

# Désactivation  du X11 forwarding.
$ sudo sed -i 's/X11Forwarding.*/X11Forwarding no/' /etc/ssh/ssh.config

# Comme X11 forwarding il est peu utilisé donc on le désactive.
$ sudo sed -i 's/PermitUserEnvironment.*/PermitUserEnvironment no/' /etc/ssh/ssh.config

# Vérifier Si vous décidez de configurer cette option, vous devriez également vous assurer de commenter toute référence à AcceptEnv en ajoutant un dièse(#) au début de la ligne.
# Ensuite, vous pouvez désactiver plusieurs options diverses liées au tunneling, et à la redirection si vous ne les utilisez pas sur votre serveur :
# AllowAgentForwarding no
# AllowTcpForwarding no
# PermitTunnel no

# # Désactivation  du DebianBanner.
$ sudo sed -i 's/DebianBanner.*/DebianBanner no/' /etc/ssh/ssh.config

# redémarrage du serveur.
$ sudo service ssh restart



#!/bin/bash

# Sauvegarde du fichier de configuration existant
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config_backup

# Vérification des options actuellement configurées
sudo sshd -t

# Configuration des permissions
sudo sed -i 's/PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/MaxAuthTries.*/MaxAuthTries 3/' /etc/ssh/sshd_config
sudo sed -i 's/LoginGraceTime.*/LoginGraceTime 20/' /etc/ssh/sshd_config
sudo sed -i 's/PermitEmptyPasswords.*/PermitEmptyPasswords no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/ChallengeResponseAuthentication.*/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/KerberosAuthentication.*/KerberosAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/GSSAPIAuthentication.*/GSSAPIAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/X11Forwarding.*/X11Forwarding no/' /etc/ssh/sshd_config
sudo sed -i 's/PermitUserEnvironment.*/PermitUserEnvironment no/' /etc/ssh/sshd_config

# Désactivation d'options liées au tunneling et à la redirection
sudo sed -i '/AcceptEnv/ s/^#*/#/' /etc/ssh/sshd_config
sudo sed -i 's/AllowAgentForwarding.*/AllowAgentForwarding no/' /etc/ssh/sshd_config
sudo sed -i 's/AllowTcpForwarding.*/AllowTcpForwarding no/' /etc/ssh/sshd_config
sudo sed -i 's/PermitTunnel.*/PermitTunnel no/' /etc/ssh/sshd_config

# Désactivation du DebianBanner
sudo sed -i 's/DebianBanner.*/DebianBanner no/' /etc/ssh/sshd_config

# Redémarrage du serveur SSH
sudo service ssh restart
