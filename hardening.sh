#!/bin/bash
# ------------------------------------------------------------------
# [Etienne] Hardening
#           OpenSSH - hardening
# ------------------------------------------------------------------
# TEST JOSS
# Sauvegarde de votre fichier de configuration existant, afin de pouvoir le restaurer dans le cas improbable où quelque chose se passerait mal.
sudo cp /etc/ssh/sshd_config /etc/ssh/ssh
#
# options actuellement configurées.
sudo sshd -t
#
# configuration de la permission.
sudo sed -i 's/PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/ssh_config
#
# Limitation du nombre de connexion. 
sudo sed -i 's/MaxAuthTries.*/MaxAuthTries 3/' /etc/ssh/ssh_config
#
# Délai de connexion.
sudo sed -i 's/LoginGraceTime.*/LoginGraceTime 20/' /etc/ssh/ssh_config
#
# Désactivation de l'authentification. 
sudo sed -i 's/PermitEmptyPasswords.*/PermitEmptyPasswords no/' /etc/ssh/ssh_config
#
# Authentification par mots de passe SSH.
sudo sed -i 's/PasswordAuthentification.*/PasswordAuthentification no/' /etc/ssh/ssh_config
#
# Désactivation de la methode d'authentification ChallengeResponseAuthentication.
sudo sed -i 's/ChallengeResponseAuthentication.*/ChallengeResponseAuthentication no/' /etc/ssh/ssh_config
#
# Désactivation de la methode d'authentification KerberosAuthentication.
sudo sed -i 's/KerberosAuthentication.*/KerberosAuthentication no/' /etc/ssh/ssh_config
#
# Désactivation de la methode d'authentification GSSAPIAuthentication.
#sudo sed -i 's/GSSAPIAuthentication.*/GSSAPIAuthentication no/' /etc/ssh/ssh_configgit 
#
# Désactivation  du X11 forwarding.
sudo sed -i 's/X11Forwarding.*/X11Forwarding no/' /etc/ssh/ssh_config
#
# Comme X11 forwarding il est peu utilisé donc on le désactive.
sudo sed -i 's/PermitUserEnvironment.*/PermitUserEnvironment no/' /etc/ssh/ssh_config
#
# # Désactivation  du DebianBanner.
sudo sed -i 's/DebianBanner.*/DebianBanner no/' /etc/ssh/ssh_config
#
# redémarrage du serveur.
sudo service ssh restart
#