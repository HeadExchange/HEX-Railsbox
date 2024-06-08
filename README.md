# HEX-Railsbox

Setup Ubuntu server with Ruby On Rails, PostgreSQL and Redis

## Before use

### Install Ansible on your machine

```bash
brew install ansible
```

### Get the root access to your virtual machine via ssh key

You should have the root access to the virtual machine you want to setup. If not just login as you can and setup the root access.

```bash
ssh username@ip_address
sudo nano /root/.ssh/authorized_keys
# paste your public key

sudo nano /etc/ssh/sshd_config
# add next line to the bottom of the file without hash symbol
# PermitRootLogin yes

sudo passwd root
# create new root password

sudo systemctl restart ssh
logout
```

### Clone this repo to your Rails project

```bash
git clone git@github.com:HeadExchange/HEX-Railsbox.git
```

### Prepare your ssh key

Get the ssh public key you use, copy and paste it to HEX-Railsbox/provision/keys folder

## Production setup

Change directory to provision folder and start Ansible. In code below change IP_ADDRESS to your virtual machine real IP address.

```bash
cd HEX-Railsbox/provision
ansible-playbook -iIP_ADDRESS, production.yml
```

If you use Capistrano, after this just change directory to your app root and call Capistrno to do the rest.

```bash
cd ../..
cap production deploy
```
