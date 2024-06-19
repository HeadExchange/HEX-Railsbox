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

## If you use Puma 6 you should use the branch puma_6

After clone you will need to checkout to puma_6 branch

```bash
cd HEX-Railsbox
git checkout puma_6
```

### Prepare your Rails app

Add this gems to your Gemfile to development group.

```
gem "capistrano"
gem "capistrano-rbenv"
gem "capistrano-rails"
gem "capistrano-bundler"
gem "capistrano3-puma"
gem "capistrano-rake"
gem "sshkit-sudo"
```

You could find an example of Capfile and deploy.rb in the examples folder.

Optionnaly you may add this gems.

```
gem "sitemap_generator"
gem "whenever", require: false
```

You could also find sitemap.rb and schedule.rb file examples in the examples folder.

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
