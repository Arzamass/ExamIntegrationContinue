#!/bin/bash -e

NomConteneur="WildflyContainer"
NomUtilisateur="wildfly"


lxc launch images:ubuntu/xenial/amd64 $NomConteneur
	sleep 5
lxc exec $NomConteneur -- apt update
	sleep 5
lxc exec $NomConteneur -- apt -y upgrade
lxc exec $NomConteneur -- apt -y install openssh-server python sudo
lxc exec $NomConteneur -- adduser $NomUtilisateur
lxc exec $NomConteneur -- usermod -a -G sudo $NomUtilisateur
lxc restart $NomConteneur